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

    //validar nenhum campo vazio
    $erro = false;
    include_once 'lib/lib_vazio.php';
    include_once 'lib/validar_cpf.php';
    $dados_validos = vazio($dados);
    if (!$dados_validos) {
        $erro = true;
        $_SESSION['msg'] = "<div class='alert alert-danger'>Necessário preencher todos os campos para cadastrar o Paciente!</div>";
    } 

        //Proibir cadastro de paciente duplicado
        $result_paciente_dupli = "SELECT id FROM adms_paciente WHERE cpf_doc='" . $dados_validos['cpf_doc'] . "'";
        $resultado_paciente_dupli = mysqli_query($conn, $result_paciente_dupli);
        if (($resultado_paciente_dupli) AND ( $resultado_paciente_dupli->num_rows != 0 )) {
            $erro = true;
            $_SESSION['msg'] = "<div class='alert alert-warning'>Este CPF já está cadastrado no sistema, favor verificar!</div>";
        }
    }
    

    //Houve erro em algum campo será redirecionado para o formulário, não há erro no formulário tenta cadastrar no banco
    if ($erro) {
        //$dados['apelido'] = $dados_apelido;
        $_SESSION['dados'] = $dados;
        $url_destino = pg . '/cadastrar/cad_paciente';
        header("Location: $url_destino");
    } else {
        
        $result_cad_paciente = "INSERT INTO adms_paciente (nome_paciente, telefone, cpf_doc, endereco, adms_situacao_paciente_id, created, cadastrador) VALUES (
        '" . $dados_validos['nome_paciente'] . "',
        '" . $dados_validos['telefone'] . "',
        '" . $dados_validos['cpf_doc'] . "',
        '" . $dados_validos['endereco'] . "',
        '" . $dados_validos['adms_situacao_paciente_id'] . "',
        NOW(),
        '" . $_SESSION['id'] . "')";

        mysqli_query($conn, $result_cad_paciente);
        if (mysqli_insert_id($conn)) {
            unset($_SESSION['dados']);

            $_SESSION['msg'] = "<div class='alert alert-success'>Paciente cadastrado com sucesso!</div>";
            $url_destino = pg . '/listar/list_paciente';
            header("Location: $url_destino");
        } else {
            //$dados['apelido'] = $dados_apelido;
            $_SESSION['dados'] = $dados;
            $_SESSION['msg'] = "<div class='alert alert-danger'>Erro: O Paciente não foi cadastrado com sucesso!</div>";
            $url_destino = pg . '/cadastrar/cad_paciente';
            header("Location: $url_destino");
        }
    }


