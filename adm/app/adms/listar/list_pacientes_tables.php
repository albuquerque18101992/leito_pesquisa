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
    1 => 'nome_paciente',
    2 => 'telefone',
    3 => 'cpf_doc',
    4 => 'botao',
    5 => 'teste'
);

//Obter registros de numero total sem qualquer pesquisa
$result_pg = "SELECT COUNT(id) AS num_result FROM adms_paciente WHERE atendido = 1";
$resultado_pg = mysqli_query($conn, $result_pg);
$qnt_linhas = mysqli_fetch_assoc($resultado_pg);


//Obter os dados a serem apresentados
$result_usuarios = "SELECT * FROM adms_paciente WHERE atendido = 1 AND baixa = 1";


if (!empty($requestData['search']['value'])) {
    // se houver um parametro de pesquisa, $requestData['search']['value'] contem o parametro de pesquisa
    $result_usuarios .= " AND ( id LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_usuarios .= " OR nome_paciente LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_usuarios .= " OR telefone LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_usuarios .= " OR cpf_doc LIKE '%" . $requestData['search']['value'] . "%' )";
}


$resultado_usuarios = mysqli_query($conn, $result_usuarios);
$totalFiltered = mysqli_num_rows($resultado_usuarios);
//Ordenar o resultado
$result_usuarios .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "  LIMIT " . $requestData['start'] . " ," . $requestData['length'] . "   ";
$resultado_usuarios = mysqli_query($conn, $result_usuarios);

//Função para validar os botões
require '../../../lib/lib_permissao.php';
$btn_vis = carregar_btn('visualizar/vis_paciente', $conn);
$btn_edit = carregar_btn('editar/edit_paciente', $conn);
$btn_avaliacao = carregar_btn('cadastrar/cad_avaliacao', $conn);
$btn_apagar = carregar_btn('processa/apagar/apagar_paciente', $conn);
$btn_acoes = carregar_btn('visualizar/vis_paciente', $conn);

//Iniciando as variaveis abaixo como vazio para nao dar erro, caso a permissão do botao for negativa
$btn_vis_val = "";
$btn_edit_val = "";
$btn_avaliacao_val = "";
$btn_apagar_val = "";
$btn_acoes_ok = "";

//Ler e criar o array de dados
$dados = array();
while ($row_usuarios = mysqli_fetch_array($resultado_usuarios)) {
    $dado = array();
    $dado[] = $row_usuarios["id"];
    $dado[] = $row_usuarios["nome_paciente"];
    $dado[] = $row_usuarios["telefone"];
    $dado[] = $row_usuarios["cpf_doc"];

    if ($btn_vis) {
        $btn_vis_val =  "<a class='dropdown-item' href='" . pg . "/visualizar/vis_paciente?id=" . $row_usuarios['id'] . "'>Visualizar</a>  ";

    }
    
    if ($btn_edit) {
        $btn_edit_val = "<a class='dropdown-item' href='" . pg . "/editar/edit_paciente?id=" . $row_usuarios['id'] . "'>Editar</a> ";
  
    }

    if ($btn_avaliacao) {
        $btn_avaliacao_val = "<a href='" . pg . "/cadastrar/cad_avaliacao?id=" . $row_usuarios['id'] . "' title='Avaliação do leito' class='btn btn-outline-info btn-sm'>Avaliação </a> ";
    }

    if ($btn_apagar) {
        $btn_apagar_val = "<a class='dropdown-item' href='" . pg . "/processa/apagar/apagar_paciente?id=" . $row_usuarios['id'] . "' class='apagar_rg' data-confirm='VOCÊ TEM CERTEZA QUE QUER EXCLUÍR O ITEM SELECIONADO?'>Apagar</a> ";
    }

    

    if ($btn_acoes) {
        $btn_acoes_ok = 
        "   <div class='dropdown d-block'>
                <button class='btn btn-primary dropdown-toggle btn-sm' type='button' id='acoesListar' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                    Ações
                </button>
                <div class='dropdown-menu dropdown-menu-right' aria-labelledby='acoesListar'>
                    $btn_vis_val  $btn_edit_val $btn_apagar_val
                </div>
            </div>
        ";
    }

    $dado[] = $btn_avaliacao_val;
    
    $dado[] = $btn_acoes_ok;

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
