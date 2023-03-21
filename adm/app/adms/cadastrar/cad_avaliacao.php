<?php
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
                                <h2 class="display-4 titulo">Avaliação de Leito</h2>
                                <kbd><?php echo $row_edit_user['descricao_situacao'] . " - " . $row_edit_user['nome_paciente'] . " id:" . $id ?></kbd>
                            </div>
                            <div class="p-2">
                                <span class="d-none d-md-block">
                                    <?php
                                    $btn_list = carregar_btn('listar/list_paciente', $conn);
                                    if ($btn_list) {
                                        echo "<a href='" . pg . "/listar/list_paciente' class='btn btn-outline-info btn-sm'>Votlar</a> ";
                                    }

                                    ?>
                                </span>

                            </div>
                        </div>
                        <hr>
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
                                        Recepção
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao1" id="questao1" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao1']) and ($_SESSION['dados']['questao1'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label>
                                        Organização e limpeza
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao2" id="questao2" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao2']) and ($_SESSION['dados']['questao2'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">

                                    <label>
                                        Estrutura física (Acomodação, iluminação, climatização)
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao3" id="questao3" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao3']) and ($_SESSION['dados']['questao3'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">

                                    <label>
                                        Equipe Médica
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao4" id="questao4" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao4']) and ($_SESSION['dados']['questao4'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label>
                                        Equipe de Enfermagem
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao5" id="questao5" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao5']) and ($_SESSION['dados']['questao5'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label>
                                        Equipe Multidisciplinar (assistente social, fisioterapia, psicólogo, nutricionista, fonoaudiólogo, dentista, farmacêutico)
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao6" id="questao6" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao6']) and ($_SESSION['dados']['questao6'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label>
                                        Assistência Farmacêutica
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao7" id="questao7" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao7']) and ($_SESSION['dados']['questao7'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label>
                                        Equipe de coleta (exame de laboratório)
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao8" id="questao8" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao8']) and ($_SESSION['dados']['questao8'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label>
                                        Realização de outros exames
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao9" id="questao9" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao9']) and ($_SESSION['dados']['questao9'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">

                                    <label>
                                        Qualidade da alimentação
                                    </label>
                                    <?php
                                    $result_m_resposta = "SELECT id, descricao_resposta FROM adms_resposta";
                                    $resultado_m_resposta = mysqli_query($conn, $result_m_resposta);
                                    ?>
                                    <select name="questao10" id="questao10" class="form-control is-valid" required>
                                        <option value="">SELECIONAR</option>
                                        <?php
                                        while ($row_m_resposta = mysqli_fetch_assoc($resultado_m_resposta)) {
                                            if (isset($_SESSION['dados']['questao10']) and ($_SESSION['dados']['questao10'] == $row_m_resposta['id'])) {
                                                echo "<option value='" . $row_m_resposta['id'] . "' selected>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_m_resposta['id'] . "'>" . $row_m_resposta['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label> Com base em sua experiencia de uma nota de 0 á 10 </label>
                                    <input name="nota_avaliacao" type="number" class="form-control is-valid" id="nota_avaliacao" min="0" max="10" placeholder="Nota de 0 à 10" value="<?php if (isset($_SESSION['dados']['nota_avaliacao'])) {
                                                                                                                                                                                            echo $_SESSION['dados']['nota_avaliacao'];
                                                                                                                                                                                        } ?>" required>
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
