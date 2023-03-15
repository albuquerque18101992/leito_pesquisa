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
                                    <label> 
                                        <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 1 ";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                        ?>
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="adms_pergunta1_id" id="adms_pergunta1_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['adms_pergunta1_id']) AND ( $_SESSION['dados']['adms_pergunta1_id'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label> 
                                    <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 2 ";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                    ?>    
                                    </label>
                                    <select name="adms_pergunta2_id" id="adms_pergunta2_id" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['adms_pergunta2_id']) AND ( $_SESSION['dados']['adms_pergunta2_id'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label>
                                    <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 3";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                    ?>
                                    </label>
                                    <select name="pergunta3" id="pergunta3" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['pergunta3']) AND ( $_SESSION['dados']['pergunta3'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label>
                                        <?php
                                            $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 4 ";
                                            $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                            $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                            echo $row_m_pergunta['descricao_pergunta'];
                                        ?>
                                    </label>
                                    <select name="pergunta4" id="pergunta4" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['pergunta4']) AND ( $_SESSION['dados']['pergunta4'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label>
                                    <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 5";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                    ?>
                                    </label>
                                    <select name="pergunta5" id="pergunta5" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['pergunta5']) AND ( $_SESSION['dados']['pergunta5'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label>
                                    <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 6";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                    ?>
                                    </label>
                                    <select name="pergunta6" id="pergunta6" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['pergunta6']) AND ( $_SESSION['dados']['pergunta6'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label>
                                    <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 7";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                    ?>
                                    </label>
                                    <select name="pergunta7" id="pergunta7" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['pergunta7']) AND ( $_SESSION['dados']['pergunta7'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label>
                                    <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 8";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                    ?>
                                    </label>
                                    <select name="pergunta8" id="pergunta8" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['pergunta8']) AND ( $_SESSION['dados']['pergunta8'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label>
                                    <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 9";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                    ?>
                                    </label>
                                    <select name="pergunta9" id="pergunta9" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['pergunta9']) AND ( $_SESSION['dados']['pergunta9'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <label>
                                    <?php
                                        $result_m_pergunta = "SELECT id, descricao_pergunta FROM adms_pergunta WHERE id = 10";
                                        $resultado_m_pergunta = mysqli_query($conn, $result_m_pergunta);
                                        $row_m_pergunta =  mysqli_fetch_assoc($resultado_m_pergunta);
                                        echo $row_m_pergunta['descricao_pergunta'];
                                    ?>
                                    </label>
                                    <select name="pergunta10" id="pergunta10" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['pergunta10']) AND ( $_SESSION['dados']['pergunta10'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";                                                
                                            }else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label> Com base em sua experiencia de uma nota de 0 á 10 </label>
                                    <input name="nota_avaliacao" type="number" class="form-control is-valid" id="nota_avaliacao" min="1" max="10" placeholder="Nota de 0 à 10" value="<?php
                                    if (isset($_SESSION['dados']['nota_avaliacao'])) {
                                        echo $_SESSION['dados']['nota_avaliacao'];
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