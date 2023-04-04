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
$SendLogin = filter_input(INPUT_POST, 'SendLogin', FILTER_SANITIZE_STRING);
if ($SendLogin) {
    $usuario_rc = filter_input(INPUT_POST, 'usuario', FILTER_SANITIZE_STRING);
    $usuario = str_ireplace(" ", "", $usuario_rc);
    $senha_rc = filter_input(INPUT_POST, 'senha', FILTER_SANITIZE_STRING);
    $senha = str_ireplace(" ", "", $senha_rc);

    if ((!empty($usuario)) and (!empty($senha))) {
        //echo password_hash($senha, PASSWORD_DEFAULT);
        $result_user = "SELECT id, nome, email, usuario, senha, adms_niveis_acesso_id FROM adms_usuarios WHERE usuario='$usuario' LIMIT 1";
        $resultado_user = mysqli_query($conn, $result_user);
        if (($resultado_user) and ($resultado_user->num_rows != 0)) {
            $row_user = mysqli_fetch_assoc($resultado_user);
            if (password_verify($senha, $row_user['senha'])) {
                //Pesquisar a ordem do nível de acesso
                $result_niv_ac = "SELECT ordem FROM adms_niveis_acessos WHERE id='" . $row_user['adms_niveis_acesso_id'] . "' LIMIT 1";
                $resultado_niv_ac = mysqli_query($conn, $result_niv_ac);
                $row_niv_ac = mysqli_fetch_assoc($resultado_niv_ac);

                $_SESSION['id'] = $row_user['id'];
                $_SESSION['nome'] = $row_user['nome'];
                $_SESSION['email'] = $row_user['email'];
                $_SESSION['usuario'] = $row_user['usuario'];
                $_SESSION['adms_niveis_acesso_id'] = $row_user['adms_niveis_acesso_id'];
                $_SESSION['ordem'] = $row_niv_ac['ordem'];


                //Cadastrando o usuário ao se logar, salvando na tabela de adms_log_usuaios
                $result_cad_login = "INSERT INTO adms_log_usuaios (adms_usuario_id, nome_logado, usuario_logado, adms_niveis_acesso_id, ip_maquina_acesso, created) VALUES (
                    '" . $_SESSION['id'] . "',
                    '" . $_SESSION['nome'] . "',
                    '" . $_SESSION['usuario'] . "',
                    '" . $_SESSION['adms_niveis_acesso_id'] . "',
                    '" . $_SERVER['REMOTE_ADDR'] . "',
                    NOW())";
                mysqli_query($conn, $result_cad_login);



                $url_destino = pg . '/visualizar/home';
                header("Location: $url_destino");
            } else {
                $_SESSION['msg'] = "<div class='alert alert-danger'>Login ou senha incorreto!</div>";
                $url_destino = pg . '/acesso/login';
                header("Location: $url_destino");
            }
        } else {
            $_SESSION['msg'] = "<div class='alert alert-danger'>Login ou senha incorreto!</div>";
            $url_destino = pg . '/acesso/login';
            header("Location: $url_destino");
        }
    } else {
        $_SESSION['msg'] = "<div class='alert alert-danger'>Login ou senha incorreto!</div>";
        $url_destino = pg . '/acesso/login';
        header("Location: $url_destino");
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
