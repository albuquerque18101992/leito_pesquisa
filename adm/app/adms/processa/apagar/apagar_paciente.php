<?php

if (!isset($seg)) {
    exit;
}
$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
if (!empty($id)) {

    $result_user = "SELECT id FROM adms_paciente WHERE id='$id' AND baixa = 1 LIMIT 1";

    $resultado_user = mysqli_query($conn, $result_user);
    //Verificar se encontrou o paciente no banco de dados
    if (($resultado_user) and ($resultado_user->num_rows != 0)) {
        $row_user = mysqli_fetch_assoc($resultado_user);
        
        //Paciente já não aparece mais
        $result_user_del = "UPDATE adms_paciente SET
        baixa = '2'
        WHERE id= " . $row_user['id'] . "";
        mysqli_query($conn, $result_user_del);



        if (mysqli_affected_rows($conn)) {
            $_SESSION['msg'] = "<div class='alert alert-success'>Paciente apagado com sucesso!</div>";
            $url_destino = pg . '/listar/list_paciente';
            header("Location: $url_destino");
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: O paciente não foi apagado!</div>";
            $url_destino = pg . '/listar/list_paciente';
            header("Location: $url_destino");
        }
    } else {
        $_SESSION['msg'] = "<div class='alert alert-danger'>Paciente não encontrada!</div>";
        $url_destino = pg . '/listar/list_paciente';
        header("Location: $url_destino");
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
