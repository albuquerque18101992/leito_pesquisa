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

        //Ler as perguntas e as respostas
        $result_avaliacao = "INSERT INTO adms_leitos_questoes(adms_leito_id, adms_paciente_id, questao1, questao2, questao3, questao4, questao5, questao6, questao7, questao8, questao9, questao10, nota_avaliacao, created, cadastrador) VALUES (
                '" . $dados['adms_leito_id'] . "',
                '" . $dados['adms_paciente_id'] . "',
                '" . $dados['questao1'] . "',
                '" . $dados['questao2'] . "',
                '" . $dados['questao3'] . "',
                '" . $dados['questao4'] . "',
                '" . $dados['questao5'] . "',
                '" . $dados['questao6'] . "',
                '" . $dados['questao7'] . "',
                '" . $dados['questao8'] . "',
                '" . $dados['questao9'] . "',
                '" . $dados['questao10'] . "',
                '" . $dados['nota_avaliacao'] . "',
                NOW(),
                '" . $_SESSION['id'] . "')";


        //Editar tabela adms_paciente coluna atendido para valor 2 que significa que avalição foi realizada
        $result_paciente_atendido = "UPDATE adms_paciente SET
               atendido = 2 ,
               modified = NOW(),
               editor = '" . $_SESSION['id'] . "'
               WHERE id = '" . $dados['adms_paciente_id'] . "'";
        mysqli_query($conn, $result_paciente_atendido);


        mysqli_query($conn, $result_avaliacao);
        if (mysqli_insert_id($conn)) {
            unset($_SESSION['dados']);

            $_SESSION['msg'] = "<div class='alert alert-success'>Avaliação registrada com sucesso!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='trues'>&times;</span></button></div>";
            $url_destino = pg . '/listar/list_paciente';
            header("Location: $url_destino");
        } else {
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
