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
    
    $result_edit_user = "SELECT meus_paciente.*,
    situacao.descricao_situacao, situacao.id
    FROM adms_paciente meus_paciente
    INNER JOIN adms_situacao_paciente situacao ON situacao.id=meus_paciente.adms_situacao_paciente_id
    WHERE meus_paciente.id='$id' LIMIT 1";

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
                                <kbd><?php echo $row_edit_user['descricao_situacao'] ." - ". $row_edit_user['nome_paciente'] ." id:". $id?></kbd>
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
                        <form method="POST" action="<?php echo pg; ?>/processa/cadastrar/proc_cad_avaliacao" enctype="multipart/form-data" autocomplete="off">  
                            <input type="hidden" name="adms_paciente_id" id="adms_paciente_id" value="<?php
                            if (isset($id)) {
                                echo $id;
                            }
                            ?>">

                            <div class="form-row">
                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_sit_user = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                                    ?>
                                    <label> Recepção </label>
                                    <select name="pergunta1" id="pergunta1" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta1']) AND ( $_SESSION['dados']['pergunta1'] == $row_sit_user['id'])) {
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
                                    <select name="pergunta2" id="pergunta2" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta2']) AND ( $_SESSION['dados']['pergunta2'] == $row_sit_user['id'])) {
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
                                    <label> Estrutura física (Acomodação, iluminação, climatização) </label>
                                    <select name="pergunta3" id="pergunta3" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta3']) AND ( $_SESSION['dados']['pergunta3'] == $row_sit_user['id'])) {
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
                                    <label> Equipe Médica </label>
                                    <select name="pergunta4" id="pergunta4" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta4']) AND ( $_SESSION['dados']['pergunta4'] == $row_sit_user['id'])) {
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
                                    <label> Equipe de Enfermagem </label>
                                    <select name="pergunta5" id="pergunta5" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta5']) AND ( $_SESSION['dados']['pergunta5'] == $row_sit_user['id'])) {
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
                                    <label> Equipe Multidisciplinar (assistente social, fisioterapia, psicólogo, nutricionista, fonoaudiólogo, dentista, farmacêutico) </label>
                                    <select name="pergunta6" id="pergunta6" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta6']) AND ( $_SESSION['dados']['pergunta6'] == $row_sit_user['id'])) {
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
                                    <label> Assistência Farmacêutica </label>
                                    <select name="pergunta7" id="pergunta7" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta7']) AND ( $_SESSION['dados']['pergunta7'] == $row_sit_user['id'])) {
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
                                    <label> Equipe de coleta (exame de laboratório) </label>
                                    <select name="pergunta8" id="pergunta8" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta8']) AND ( $_SESSION['dados']['pergunta8'] == $row_sit_user['id'])) {
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
                                    <label> Realização de outros exames </label>
                                    <select name="pergunta9" id="pergunta9" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta9']) AND ( $_SESSION['dados']['pergunta9'] == $row_sit_user['id'])) {
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
                                    <label> Qualidade da alimentação </label>
                                    <select name="pergunta10" id="pergunta10" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                            if (isset($_SESSION['dados']['pergunta10']) AND ( $_SESSION['dados']['pergunta10'] == $row_sit_user['id'])) {
                                                echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label> Com base em sua experiencia de uma nota de 0 á 10 </label>
                                    <input name="pergunta11" type="number" class="form-control is-valid" id="pergunta11" min="1" max="10" placeholder="Nota de 0 à 10" value="<?php
                                    if (isset($_SESSION['dados']['pergunta11'])) {
                                        echo $_SESSION['dados']['pergunta11'];
                                    }
                                    ?>" required>
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