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



//Segurança para não consiguir acessa páginas indo direto na URL .
if (!isset($seg)) {
    exit;
}

$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
if (!empty($id)) {

    $result_atendido = "SELECT * FROM adms_leitos_questoes";
    $resultado_atendido = mysqli_query($conn, $result_atendido);
    $row_atendido = mysqli_fetch_assoc($resultado_atendido);

    //Editar tabela adms_paciente coluna atendido para valor 1 que significa que avalição não foi realizada
    $result_paciente_atendido = "UPDATE adms_paciente SET
            atendido = 1 ,
            modified = NOW(),
            editor = '" . $_SESSION['id'] . "'
            WHERE '" . $row_atendido['adms_paciente_id'] . "' = id ";
    mysqli_query($conn, $result_paciente_atendido);



    //Apagar a avaliação
    $result_user = "DELETE FROM adms_leitos_questoes WHERE id='$id'";
    mysqli_query($conn, $result_user);



    if (mysqli_affected_rows($conn)) {
        $_SESSION['msg'] = "<div class='alert alert-success'>Avaliação apagada com sucesso!</div>";
        $url_destino = pg . '/listar/list_avaliacoes';
        header("Location: $url_destino");
    } else {
        $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: A avaliação não foi apagada!</div>";
        $url_destino = pg . '/listar/list_avaliacoes';
        header("Location: $url_destino");
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
