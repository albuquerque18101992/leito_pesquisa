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

$SendEditPaciente = filter_input(INPUT_POST, 'SendEditPaciente', FILTER_SANITIZE_STRING);
if ($SendEditPaciente) {
    $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

    //Retirar campo da validação vazio
    $dados_nome_paciente = $dados['nome_paciente'];
    $dados_endereco = $dados['endereco'];
    unset($dados['nome_paciente'], $dados['endereco']);

    //validar nenhum campo vazio
    $erro = false;
    include_once 'lib/lib_vazio.php';
    $dados_validos = vazio($dados);
    if (!$dados_validos) {
        $erro = true;
        $_SESSION['msg'] = "<div class='alert alert-danger'>Necessário preencher todos os campos para editar o paciente!</div>";
    } else {
        //Proibir cadastro de cpf_doc duplicado
        $result_paginas = "SELECT id FROM adms_paciente WHERE cpf_doc='" . $dados_validos['cpf_doc'] . "' AND id<>'" . $dados['id'] . "' ";
        $resultado_paginas = mysqli_query($conn, $result_paginas);
        if (($resultado_paginas) and ($resultado_paginas->num_rows != 0)) {
            $erro = true;
            $_SESSION['msg'] = "<div class='alert alert-danger'>Este CPF já está cadastrado!</div>";
        }
    }

    //Houve erro em algum campo será redirecionado para o login, não há erro no formulário tenta cadastrar no banco
    if ($erro) {
        $dados['nome_paciente'] = $dados_nome_paciente;
        $dados['endereco'] = $dados_endereco;
        $_SESSION['dados'] = $dados;
        $url_destino = pg . '/editar/edit_paciente?id=' . $dados['id'];
        header("Location: $url_destino");
    } else {
        $result_pg_up = "UPDATE adms_paciente SET
                nome_paciente='" . $dados_validos['nome_paciente'] . "',
                telefone='" . $dados_telefone . "', 
                cpf_doc='" . $dados_validos['cpf_doc'] . "', 
                endereco='" . $dados_endereco . "', 
                adms_situacao_paciente_id='" . $dados_validos['adms_situacao_paciente_id'] . "', 
                adms_leito_id='" . $dados_validos['adms_leito_id'] . "',
                modified=NOW() 
                WHERE id='" . $dados_validos['id'] . "'";

        mysqli_query($conn, $result_pg_up);

        if (mysqli_affected_rows($conn)) {
            unset($_SESSION['dados']);
            $_SESSION['msg'] = "<div class='alert alert-success'>Paciente editada!</div>";
            $url_destino = pg . '/listar/list_paciente';
            header("Location: $url_destino");
        } else {
            $dados['nome_paciente'] = $dados_nome_paciente;
            $dados['endereco'] = $dados_endereco;
            $_SESSION['dados'] = $dados;
            $_SESSION['msg'] = "<div class='alert alert-danger'>Paciente não editada!</div>";
            $url_destino = pg . '/editar/edit_paciente?id=' . $dados['id'];
            header("Location: $url_destino");
        }
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
