<?php

session_start();
$seg = true;
require '../../../config/conexao.php';
require '../../../config/config.php';

//Receber a requisicaoo da pesquisa
$requestData = $_REQUEST;

//Indice da coluna na tabela visualizar resultado => nome da coluna no banco de dados 
$columns = array(
    0 => 'id',
    1 => 'nome',
    2 => 'email',
    3 => 'nome_nivac',
    4 => 'botao'
);

//Obter registros de numero total sem qualquer pesquisa
$result_pg = "SELECT COUNT(id) AS num_result FROM adms_usuarios";
$resultado_pg = mysqli_query($conn, $result_pg);
$qnt_linhas = mysqli_fetch_assoc($resultado_pg);


//Obter os dados a serem apresentados
if ($_SESSION['adms_niveis_acesso_id'] == 1) {
    $result_usuarios = "SELECT user.id, user.nome, user.email,
            nivac.nome nome_nivac
            FROM adms_usuarios user
            INNER JOIN adms_niveis_acessos nivac ON nivac.id=user.adms_niveis_acesso_id
            WHERE 1=1";
} else {
    $result_usuarios = "SELECT user.id, user.nome, user.email,
            nivac.nome nome_nivac
            FROM adms_usuarios user
            INNER JOIN adms_niveis_acessos nivac ON nivac.id=user.adms_niveis_acesso_id
            WHERE nivac.ordem >= '" . $_SESSION['ordem'] . "'";
}

if (!empty($requestData['search']['value'])) {   // se houver um parametro de pesquisa, $requestData['search']['value'] contem o parametro de pesquisa
    $result_usuarios .= " AND ( user.id LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_usuarios .= " OR user.nome LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_usuarios .= " OR user.email LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_usuarios .= " OR nivac.nome LIKE '%" . $requestData['search']['value'] . "%' )";
}


$resultado_usuarios = mysqli_query($conn, $result_usuarios);
$totalFiltered = mysqli_num_rows($resultado_usuarios);
//Ordenar o resultado
$result_usuarios .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "  LIMIT " . $requestData['start'] . " ," . $requestData['length'] . "   ";
$resultado_usuarios = mysqli_query($conn, $result_usuarios);

//Função para validar os botões
require '../../../lib/lib_permissao.php';
$btn_vis = carregar_btn('visualizar/vis_usuario', $conn);
$btn_edit = carregar_btn('editar/edit_usuario', $conn);
$btn_apagar = carregar_btn('processa/apagar_usuario', $conn);
//Iniciando as variaveis abaixo como vazio para nao dar erro, caso a permissão do botao for negativa
$btn_vis_val = "";
$btn_edit_val = "";
$btn_apagar_val = "";

//Ler e criar o array de dados
$dados = array();
while ($row_usuarios = mysqli_fetch_array($resultado_usuarios)) {
    $dado = array();
    $dado[] = $row_usuarios["id"];
    $dado[] = $row_usuarios["nome"];
    $dado[] = $row_usuarios["email"];
    $dado[] = $row_usuarios["nome_nivac"];

    if ($btn_vis) {
        $btn_vis_val =  "<a href='" . pg . "/visualizar/vis_usuario?id=" . $row_usuarios['id'] . "' title='Visualizar' /*data-toggle='modal' data-target='#visualizarUsuario'*/ class='btn btn-outline-primary btn-sm'>Visualizar</a> ";
    }
    
    if ($btn_edit) {
        $btn_edit_val = "<a href='" . pg . "/editar/edit_usuario?id=" . $row_usuarios['id'] . "' title='Editar' class='btn btn-outline-warning btn-sm'>Editar </a> ";
    }

    if ($btn_apagar) {
        $btn_apagar_val = "<a href='" . pg . "/processa/apagar_usuario?id=" . $row_usuarios['id'] . "' title='Deletar' class='btn btn-outline-danger btn-sm apagar_rg' data-confirm='VOCÊ TEM CERTEZA QUE QUER EXCLUÍR O ITEM SELECIONADO?'>Apagar </a> ";
    }

    $dado[] = $btn_vis_val . $btn_edit_val . $btn_apagar_val;

    $dados[] = $dado;
}

//Cria o array de informacoees a serem retornadas para o JavaScript
$json_data = array(
    "draw" => intval($requestData['draw']), //Para cada requisicaoo e enviado um numero como parametro
    "recordsTotal" => intval($qnt_linhas), //Quantidade de registro que ha no banco de dados
    "recordsFiltered" => intval($totalFiltered), //Total de registros quando houver pesquisa
    "data" => $dados //Array de dados completo dos dados retornados da tabela
);

echo json_encode($json_data); //enviar dados como formato json
