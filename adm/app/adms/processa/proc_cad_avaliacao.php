<?php
if (!isset($seg)) {
    exit;
}


$SendCadAvaliacao = filter_input(INPUT_POST, 'SendCadAvaliacao', FILTER_SANITIZE_STRIPPED);
if ($SendCadAvaliacao) {
    $opcoes = $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

   
foreach ($opcoes as $opcao) {
  echo $opcao . "<br>";
}
    


    

} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>adms_avaliacao_feita</div>";
    $url_destino = pg . '/listar/list_paciente';
    header("Location: $url_destino");
}
