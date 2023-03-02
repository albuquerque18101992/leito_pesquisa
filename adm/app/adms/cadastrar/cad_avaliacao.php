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
    if (($resultado_edit_user) AND ( $resultado_edit_user->num_rows != 0)) {
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
                                <h2 class="display-4 titulo">Avaliação de Leito</h2>
                            </div>
                            <div class="p-2">
                                <span class = "d-none d-md-block">
                                    <?php
                                    $btn_list = carregar_btn('listar/list_paciente', $conn);
                                    if ($btn_list) {
                                        echo "<a href='" . pg . "/listar/list_paciente' class='btn btn-outline-info btn-sm'>Votlar</a> ";
                                    }
                                    
                                    ?>
                                </span>
                                
                            </div>
                        </div><hr>
                        <?php
                        if (isset($_SESSION['msg'])) {
                            echo $_SESSION['msg'];
                            unset($_SESSION['msg']);
                        }
                        ?>
                        <form method="POST" action="<?php echo pg; ?>/processa/proc_cad_avaliacao" enctype="multipart/form-data" autocomplete="off">  
                            <input type="hidden" name="id" value="<?php
                            if (isset($row_edit_user['id'])) {
                                echo $row_edit_user['id'];
                            }
                            ?>">

                            <div class="form-row">
                                <div class="form-group col-md-4 was-validated">
                                    <label> Nome </label>
                                    <input name="nome" type="text" class="form-control is-valid" id="nome" placeholder="Nome do usuário completo" value="<?php
                                    if (isset($_SESSION['dados']['nome_paciente'])) {
                                        echo $_SESSION['dados']['nome_paciente'];
                                    } elseif (isset($row_edit_user['nome_paciente'])) {
                                        echo $row_edit_user['nome_paciente'];
                                    }
                                    ?>" required>
                                </div>
                            </div>

                            
                            <?php
                                 $resul_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta";
                                 $resultado_pergunta = mysqli_query($conn, $resul_pergunta);
                 
                                 if (($resultado_pergunta) AND ( $resultado_pergunta->num_rows != 0)) {
                                    while ($row_pergunta = mysqli_fetch_assoc($resultado_pergunta)) {
                                        //echo $row_pergunta['id'];
                                        //echo $row_pergunta['descricao_pergunta'];
                                    }
                                 }
                            ?>

                            <div class="form-row">
                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Recepção </label>
                                    <select name="recp" id="recp" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['recp']) AND ( $_SESSION['dados']['recp'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Organização e limpeza </label>
                                    <select name="limpeza" id="limpeza" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['limpeza']) AND ( $_SESSION['dados']['limpeza'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Pergunta </label>
                                    <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            
                            <br>
                            <input name="SendCadAvaliacao" type="submit" class="btn btn-success" value="Cadastrar">
                        </form>
                    </div>    
                </div>

                <?php
                include_once 'app/adms/include/rodape_lib.php';
                ?>
                
            </div>
        </body>
        <?php
        unset($_SESSION['dados']);
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