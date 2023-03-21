<?php


/**
 * ---------------------------------------------------------------------
 * Avaliação de Leito do Hospital Municipal Integrado - Santo Amaro - HISA
 * Inicio do projeto 02/2023
 * ---------------------------------------------------------------------
 * Desenvolvido pela equipe de sistemas
 * ---------------------------------------------------------------------
 * Desenvolvedor responsável: Paulo Albuquerque - https://github.com/albuquerque18101992
 * Coordenador: Wellington Santos
 * Supervisor: Lucas Texeira
 * ---------------------------------------------------------------------
 */


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
    4 => 'botao'
);

//Obter registros de numero total sem qualquer pesquisa
$result_pg = "SELECT COUNT(id) AS num_result FROM adms_paciente WHERE atendido = 2";
$resultado_pg = mysqli_query($conn, $result_pg);
$qnt_linhas = mysqli_fetch_assoc($resultado_pg);


//Obter os dados a serem apresentados

$result_avaliacao = "SELECT * FROM adms_paciente WHERE atendido = 2";


if (!empty($requestData['search']['value'])) {
    // se houver um parametro de pesquisa, $requestData['search']['value'] contem o parametro de pesquisa
    $result_avaliacao .= " AND ( id LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_avaliacao .= " OR nome_paciente LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_avaliacao .= " OR telefone LIKE '%" . $requestData['search']['value'] . "%' ";
    $result_avaliacao .= " OR cpf_doc LIKE '%" . $requestData['search']['value'] . "%' )";
}


$resultado_avaliacoes = mysqli_query($conn, $result_avaliacao);
$totalFiltered = mysqli_num_rows($resultado_avaliacoes);
//Ordenar o resultado
$result_avaliacao .= " ORDER BY " . $columns[$requestData['order'][0]['column']] . "   " . $requestData['order'][0]['dir'] . "  LIMIT " . $requestData['start'] . " ," . $requestData['length'] . "   ";
$resultado_avaliacoes = mysqli_query($conn, $result_avaliacao);

//Função para validar os botões
require '../../../lib/lib_permissao.php';
$btn_vis = carregar_btn('visualizar/vis_avalia_realizada', $conn);
$btn_edit = carregar_btn('editar/edit_avalia_realizada', $conn);
$btn_apagar = carregar_btn('processa/apagar/apagar_avalia_realizada', $conn);
$btn_acoes = carregar_btn('visualizar/vis_avalia_realizada', $conn);
//Iniciando as variaveis abaixo como vazio para nao dar erro, caso a permissão do botao for negativa
$btn_vis_val = "";
$btn_edit_val = "";
$btn_apagar_val = "";
$btn_acoes_ok = "";

//Ler e criar o array de dados
$dados = array();
while ($row_avaliacoes = mysqli_fetch_array($resultado_avaliacoes)) {
    $dado = array();
    $dado[] = $row_avaliacoes["id"];
    $dado[] = $row_avaliacoes["nome_paciente"];
    $dado[] = $row_avaliacoes["telefone"];
    $dado[] = $row_avaliacoes["cpf_doc"];

    if ($btn_vis) {
        $btn_vis_val =  "<a class='dropdown-item' href='" . pg . "/visualizar/vis_avalia_realizada?id=" . $row_avaliacoes['id'] . "'>Visualizar</a> ";

        
    }
    
    if ($btn_edit) {
        $btn_edit_val = "<a class='dropdown-item' href='" . pg . "/editar/edit_avalia_realizada?id=" . $row_avaliacoes['id'] . "'>Editar</a> ";
    }
    

    if ($btn_apagar) {
        $btn_apagar_val = "<a class='dropdown-item' href='" . pg . "/processa/apagar/apagar_avalia_realizada?id=" . $row_avaliacoes['id'] . "' class='apagar_rg' data-confirm='VOCÊ TEM CERTEZA QUE QUER EXCLUÍR O ITEM SELECIONADO?'>Apagar</a> ";
    }


    if ($btn_acoes) {
        $btn_acoes_ok = 
        "   <div class='dropdown d-block'>
                <button class='btn btn-primary dropdown-toggle btn-sm' type='button' id='acoesListar' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                    Ações
                </button>
                <div class='dropdown-menu dropdown-menu-right' aria-labelledby='acoesListar'>
                    $btn_vis_val  $btn_edit_val  $btn_apagar_val
                </div>
            </div>
        ";
    }

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
