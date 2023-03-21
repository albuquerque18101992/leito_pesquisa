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
$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
//verificar a existencia do id na URL
if (!empty($id)) {

    $result_edit_user = "SELECT * FROM adms_paciente WHERE id='$id' LIMIT 1";

    $resultado_edit_user = mysqli_query($conn, $result_edit_user);
    //Verificar se encontrou a página no banco de dados
    if (($resultado_edit_user) and ($resultado_edit_user->num_rows != 0)) {
        $row_edit_user = mysqli_fetch_assoc($resultado_edit_user);
        include_once 'app/adms/include/head.php';
?>

        <body>
            <?php
            include_once 'app/adms/include/header.php';
            ?>
            <div class="d-flex">
                <?php
                include_once 'app/adms/include/menu.php';
                ?>

                <div class="content p-1">
                    <div class="list-group-item">
                        <div class="d-flex">
                            <div class="mr-auto p-2">
                                <h2 class="display-4 titulo">Editar Paciente</h2>
                            </div>
                            <div class="p-2">
                                <span class="d-none d-md-block">
                                    <?php
                                    $btn_list = carregar_btn('listar/list_paciente', $conn);
                                    if ($btn_list) {
                                        echo "<a href='" . pg . "/listar/list_paciente' class='btn btn-outline-info btn-sm'>Votlar</a> ";
                                    }

                                    $btn_apagar = carregar_btn('processa/apagar_paciente', $conn);
                                    if ($btn_apagar) {
                                        echo "<a href='" . pg . "/processa/apagar_paciente?id=" . $row_edit_user['id'] . "' class='btn btn-outline-danger btn-sm' data-confirm='Tem certeza de que deseja excluir o item selecionado?'>Apagar</a> ";
                                    }
                                    ?>
                                </span>
                                <div class="dropdown d-block d-md-none">
                                    <button class="btn btn-primary dropdown-toggle btn-sm" type="button" id="acoesListar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Ações
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="acoesListar">
                                        <?php
                                        if ($btn_list) {
                                            echo "<a class='dropdown-item' href='" . pg . "/listar/list_menu'>Listar</a>";
                                        }

                                        if ($btn_apagar) {
                                            echo "<a class='dropdown-item' href='" . pg . "/processa/apagar_menu?id=" . $row_edit_user['id'] . "' data-confirm='Tem certeza de que deseja excluir o item selecionado?'>Apagar</a>";
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <?php
                        if (isset($_SESSION['msg'])) {
                            echo $_SESSION['msg'];
                            unset($_SESSION['msg']);
                        }
                        ?>
                        <form method="POST" action="<?php echo pg; ?>/processa/editar/proc_edit_paciente" enctype="multipart/form-data">

                            <div class="form-row ">
                                <div class="form-group col-md-12 was-validated">
                                    <label>
                                        Nome
                                    </label>
                                    <input name="nome_paciente" type="text" class="form-control is-valid" id="nome_paciente" placeholder="Nome completo do usuário" value="<?php
                                        if (isset($_SESSION['dados']['nome_paciente'])) {
                                            echo $_SESSION['dados']['nome_paciente'];
                                        } elseif (isset($row_edit_user['nome_paciente'])) {
                                            echo $row_edit_user['nome_paciente'];
                                        }
                                        ?>" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label> Telefone </label>
                                    <input name="telefone" type="text" class="form-control" id="telefone" placeholder="Numero de telefone" value="<?php
                                        if (isset($_SESSION['dados']['telefone'])) {
                                            echo $_SESSION['dados']['telefone'];
                                        } elseif (isset($row_edit_user['telefone'])) {
                                            echo $row_edit_user['telefone'];
                                        }
                                        ?>">
                                </div>

                                <div class="form-group col-md-6 was-validated">
                                    <label> CPF </label>
                                    <input name="cpf_doc" type="text" class="form-control is-valid" id="cpf_doc" placeholder="Informe um CPF" value="<?php
                                        if (isset($_SESSION['dados']['cpf_doc'])) {
                                            echo $_SESSION['dados']['cpf_doc'];
                                        } elseif (isset($row_edit_user['cpf_doc'])) {
                                            echo $row_edit_user['cpf_doc'];
                                        }
                                        ?>" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label> Endereço </label>
                                    <input name="endereco" type="text" class="form-control" id="endereco" placeholder="Rua, bairro, numero" value="<?php
                                        if (isset($_SESSION['dados']['endereco'])) {
                                            echo $_SESSION['dados']['endereco'];
                                        } elseif (isset($row_edit_user['endereco'])) {
                                            echo $row_edit_user['endereco'];
                                        }
                                        ?>">
                                </div>

                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_situacao FROM adms_situacao_paciente ORDER BY descricao_situacao ASC";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Situação do paciente </label>
                                    <select name="adms_situacao_paciente_id" id="adms_situacao_paciente_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_situacao_paciente_id']) and ($_SESSION['dados']['adms_situacao_paciente_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_situacao'] . "</option>";
                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['adms_situacao_paciente_id']) and (isset($row_edit_user['adms_situacao_paciente_id']) and ($row_edit_user['adms_situacao_paciente_id'] == $row_sit_user['id']))) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_situacao'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_situacao'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>


                            <br>
                            <input name="SendEditPaciente" type="submit" class="btn btn-warning" value="Salvar">
                        </form>
                    </div>
                </div>

                <?php
                include_once 'app/adms/include/rodape_lib.php';
                ?>
                <script>
                    function previewImagem() {
                        var imagem = document.querySelector('input[name=imagem').files[0];
                        var preview = document.querySelector('#preview-user');

                        var reader = new FileReader();

                        reader.onloadend = function() {
                            preview.src = reader.result;
                        }

                        if (imagem) {
                            reader.readAsDataURL(imagem);
                        } else {
                            preview.src = "";
                        }
                    }
                </script>
            </div>
        </body>
<?php
        unset($_SESSION['dados']);
    } else {
        $_SESSION['msg'] = "<div class='alert alert-danger'>Usuário não encontrada!</div>";
        $url_destino = pg . '/listar/list_paciente';
        header("Location: $url_destino");
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
