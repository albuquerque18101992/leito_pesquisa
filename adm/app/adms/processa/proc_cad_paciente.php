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
$SendCadPaciente = filter_input(INPUT_POST, 'SendCadPaciente', FILTER_SANITIZE_STRING);
if (!empty($SendCadPaciente)) {
    $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

    //Retirar campo da validação vazio
    //$dados_apelido = $dados['apelido'];
    //unset($dados['apelido']);
    

    //validar nenhum campo vazio
    $erro = false;
    include_once 'lib/lib_vazio.php';
    $dados_validos = vazio($dados);
    if (!$dados_validos) {
        $erro = true;
        $_SESSION['msg'] = "<div class='alert alert-danger'>Necessário preencher todos os campos para cadastrar o Paciente!</div>";
    } 

        //Proibir cadastro de usuario duplicado
        $result_user_dupli = "SELECT id FROM adms_paciente WHERE nome_paciente='" . $dados_validos['usuario'] . "'";
        $resultado_user_dupli = mysqli_query($conn, $result_user_dupli);
        if (($resultado_user_dupli) AND ( $resultado_user_dupli->num_rows != 0 )) {
            $erro = true;
            $_SESSION['msg'] = "<div class='alert alert-danger'>Este nome de usuario já está cadastrado!</div>";
        }
    }
    

    //Houve erro em algum campo será redirecionado para o formulário, não há erro no formulário tenta cadastrar no banco
    if ($erro) {
        //$dados['apelido'] = $dados_apelido;
        $_SESSION['dados'] = $dados;
        $url_destino = pg . '/cadastrar/cad_paciente';
        header("Location: $url_destino");
    } else {
        
        $result_cad_user = "INSERT INTO adms_paciente (nome_paciente, telefone, endereco, adms_situacao_paciente_id, created, cadastrador) VALUES (
        '" . $dados_validos['nome_paciente'] . "',
        '" . $dados_validos['telefone'] . "',
        '" . $dados_validos['endereco'] . "',
        '" . $dados_validos['adms_situacao_paciente_id'] . "',
        'NOW()',
        '" . $dados_validos['cadastrador'] . "')";

        mysqli_query($conn, $result_cad_user);
        if (mysqli_insert_id($conn)) {
            unset($_SESSION['dados']);

            $_SESSION['msg'] = "<div class='alert alert-success'>Paciente cadastrado com sucesso!</div>";
            $url_destino = pg . '/listar/list_usuario';
            header("Location: $url_destino");
        } else {
            //$dados['apelido'] = $dados_apelido;
            $_SESSION['dados'] = $dados;
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: O Paciente não foi cadastrado com sucesso!</div>";
            $url_destino = pg . '/cadastrar/cad_paciente';
            header("Location: $url_destino");
        }
    }

    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!!!!!!!!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");

