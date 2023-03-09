<?php
/*
    $opcoes = $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
    foreach ($opcoes as $opcao) {
    echo $opcao . "<br>";
    }
*/
if (!isset($seg)) {
    exit;
}

$SendCadAvaliacao = filter_input(INPUT_POST, 'SendCadAvaliacao', FILTER_SANITIZE_STRIPPED);
if (!empty($SendCadAvaliacao)) {
    $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

    $erro = false;

    if ($erro) {
        $_SESSION['dados'] = $dados;
        $url_destino = pg . '/cadastrar/cad_usuario';
        header("Location: $url_destino");
    } else {
        $result_avaliacao = "INSERT INTO adms_avaliacao_feita(adms_paciente_id, pergunta1, pergunta2, pergunta3, pergunta4, pergunta5, pergunta6, pergunta7, pergunta8, pergunta9, pergunta10, pergunta11, created, cadastrador) VALUES (
            '" . $dados['adms_paciente_id'] . "',
            '" . $dados['pergunta1'] . "',
            '" . $dados['pergunta2'] . "',
            '" . $dados['pergunta3'] . "',
            '" . $dados['pergunta4'] . "',
            '" . $dados['pergunta5'] . "',
            '" . $dados['pergunta6'] . "',
            '" . $dados['pergunta7'] . "',
            '" . $dados['pergunta8'] . "',
            '" . $dados['pergunta9'] . "',
            '" . $dados['pergunta10'] . "',
            '" . $dados['pergunta11'] . "',
            NOW(),
            '" . $_SESSION['id'] . "')";


        //Editar tabela adms_paciente coluna atendido para valor 2 que significa que avalição foi realizada
        $result_paciente_atendido = "UPDATE adms_paciente SET
               atendido = 2 ,
               modified = NOW(),
               editor = '" . $_SESSION['id'] . "'
               WHERE id = '".$dados['adms_paciente_id']."'";
        mysqli_query($conn, $result_paciente_atendido);


        mysqli_query($conn, $result_avaliacao);
        if (mysqli_insert_id($conn)) {
            unset($_SESSION['dados']);

            $_SESSION['msg'] = "<div class='alert alert-success'>Avaliação registrada com sucesso!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='trues'>&times;</span></button></div>";
            $url_destino = pg . '/listar/list_paciente';
            header("Location: $url_destino");
        } else {
            //$dados['apelido'] = $dados_apelido;
            $_SESSION['dados'] = $dados;
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: Avaliação não realizada!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='trues'>&times;</span></button></div>";
            $url_destino = pg . '/listar/list_paciente';
            header("Location: $url_destino");
        }
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
