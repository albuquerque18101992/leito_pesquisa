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
    $result_edit_av = "SELECT * FROM adms_leitos_questoes WHERE id='$id' LIMIT 1";
    $resultado_edit_av = mysqli_query($conn, $result_edit_av);
    //Verificar se encontrou a página no banco de dados
    if (($resultado_edit_av) and ($resultado_edit_av->num_rows != 0)) {
        $row_edit_av = mysqli_fetch_assoc($resultado_edit_av);
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
                                <h2 class="display-4 titulo">Editar Avaliação id:<?php echo $id ?></h2>
                            </div>
                            <div class="p-2">
                                <span class="d-none d-md-block">
                                    <?php
                                    $btn_list = carregar_btn('listar/list_avaliacoes', $conn);
                                    if ($btn_list) {
                                        echo "<a href='" . pg . "/listar/list_avaliacoes' class='btn btn-outline-info btn-sm'>Voltar</a> ";
                                    }

                                    $btn_apagar = carregar_btn('processa/apagar/apagar_avalia_realizada', $conn);
                                    if ($btn_apagar) {
                                        echo "<a href='" . pg . "/processa/apagar/apagar_avalia_realizada?id=" . $row_edit_av['id'] . "' class='btn btn-outline-danger btn-sm' data-confirm='Tem certeza de que deseja excluir o item selecionado?'>Apagar</a> ";
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
                                            echo "<a class='dropdown-item' href='" . pg . "/listar/list_avaliacoes'>Voltar</a>";
                                        }

                                        if ($btn_apagar) {
                                            echo "<a class='dropdown-item' href='" . pg . "/processa/apagar/apagar_avalia_realizada?id=" . $row_edit_av['id'] . "' data-confirm='Tem certeza de que deseja excluir o item selecionado?'>Apagar</a>";
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
                        <form method="POST" action="<?php echo pg; ?>/processa/editar/proc_edit_avaliacao">
                            <input type="hidden" name="id" value="<?php
                                                                    if (isset($row_edit_av['id'])) {
                                                                        echo $row_edit_av['id'];
                                                                    }
                                                                    ?>">

                            <div class="form-row">
                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_sits = "SELECT * FROM adms_resposta";
                                    $resultado_sits = mysqli_query($conn, $result_sits);
                                    ?>
                                    <label>
                                        Recepção
                                    </label>
                                    <select name="questao1" id="questao1" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_sits = mysqli_fetch_assoc($resultado_sits)) {
                                            if (isset($_SESSION['dados']['questao1']) and ($_SESSION['dados']['questao1'] == $row_sits['id'])) {
                                                echo "<option value='" . $row_sits['id'] . "' selected>" . $row_sits['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao1']) and (isset($row_edit_av['questao1']) and ($row_edit_av['questao1'] == $row_sits['id']))) {
                                                echo "<option value='" . $row_sits['id'] . "' selected>" . $row_sits['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_sits['id'] . "'>" . $row_sits['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao2 = "SELECT * FROM adms_resposta";
                                    $resultado_questao2 = mysqli_query($conn, $result_questao2);
                                    ?>
                                    <label>
                                        Organização e limpeza
                                    </label>
                                    <select name="questao2" id="questao2" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_questao2 = mysqli_fetch_assoc($resultado_questao2)) {
                                            if (isset($_SESSION['dados']['questao2']) and ($_SESSION['dados']['questao2'] == $row_sits['id'])) {
                                                echo "<option value='" . $row_questao2['id'] . "' selected>" . $row_questao2['descricao_resposta'] . "</option>";
                                            } elseif (!isset($_SESSION['dados']['questao2']) and (isset($row_edit_av['questao2']) and ($row_edit_av['questao2'] == $row_questao2['id']))) {
                                                echo "<option value='" . $row_questao2['id'] . "' selected>" . $row_questao2['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_questao2['id'] . "'>" . $row_questao2['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao3 = "SELECT * FROM adms_resposta";
                                    $resultado_questao3 = mysqli_query($conn, $result_questao3);
                                    ?>
                                    <label>
                                        Estrutura física (Acomodação, iluminação, climatização)
                                    </label>
                                    <select name="questao3" id="questao3" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_questao3 = mysqli_fetch_assoc($resultado_questao3)) {
                                            if (isset($_SESSION['dados']['questao3']) and ($_SESSION['dados']['questao3'] == $row_questao3['id'])) {
                                                echo "<option value='" . $row_questao3['id'] . "' selected>" . $row_questao3['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao3']) and (isset($row_edit_av['questao3']) and ($row_edit_av['questao3'] == $row_questao3['id']))) {
                                                echo "<option value='" . $row_questao3['id'] . "' selected>" . $row_questao3['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_questao3['id'] . "'>" . $row_questao3['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao4 = "SELECT * FROM adms_resposta";
                                    $resultado_questao4 = mysqli_query($conn, $result_questao4);
                                    ?>
                                    <label>
                                        Equipe Médica
                                    </label>
                                    <select name="questao4" id="questao4" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_questao4 = mysqli_fetch_assoc($resultado_questao4)) {
                                            if (isset($_SESSION['dados']['questao4']) and ($_SESSION['dados']['questao4'] == $row_sits['id'])) {
                                                echo "<option value='" . $row_questao4['id'] . "' selected>" . $row_questao4['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao4']) and (isset($row_edit_av['questao4']) and ($row_edit_av['questao4'] == $row_questao4['id']))) {
                                                echo "<option value='" . $row_questao4['id'] . "' selected>" . $row_questao4['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_questao4['id'] . "'>" . $row_questao4['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao5 = "SELECT * FROM adms_resposta";
                                    $resultado_questao5 = mysqli_query($conn, $result_questao4);
                                    ?>
                                    <label>
                                        Equipe de Enfermagem
                                    </label>
                                    <select name="questao5" id="questao5" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_questao5 = mysqli_fetch_assoc($resultado_questao5)) {
                                            if (isset($_SESSION['dados']['questao5']) and ($_SESSION['dados']['questao5'] == $row_sits['id'])) {
                                                echo "<option value='" . $row_questao5['id'] . "' selected>" . $row_questao5['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao5']) and (isset($row_edit_av['questao5']) and ($row_edit_av['questao5'] == $row_questao5['id']))) {
                                                echo "<option value='" . $row_questao5['id'] . "' selected>" . $row_questao5['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_questao5['id'] . "'>" . $row_questao5['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao6 = "SELECT * FROM adms_resposta";
                                    $resultado_questao6 = mysqli_query($conn, $result_questao6);
                                    ?>
                                    <label>
                                        Equipe Multidisciplinar (assistente social, fisioterapia, psicólogo, nutricionista, fonoaudiólogo, dentista, farmacêutico)
                                    </label>
                                    <select name="questao6" id="questao6" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($questao6 = mysqli_fetch_assoc($resultado_questao6)) {
                                            if (isset($_SESSION['dados']['questao6']) and ($_SESSION['dados']['questao6'] == $questao6['id'])) {
                                                echo "<option value='" . $questao6['id'] . "' selected>" . $questao6['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao6']) and (isset($row_edit_av['questao6']) and ($row_edit_av['questao6'] == $questao6['id']))) {
                                                echo "<option value='" . $questao6['id'] . "' selected>" . $questao6['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $questao6['id'] . "'>" . $questao6['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao7 = "SELECT * FROM adms_resposta";
                                    $resultado_questao7 = mysqli_query($conn, $result_questao7);
                                    ?>
                                    <label>
                                        Assistência Farmacêutica
                                    </label>
                                    <select name="questao7" id="questao7" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_questao7 = mysqli_fetch_assoc($resultado_questao7)) {
                                            if (isset($_SESSION['dados']['questao7']) and ($_SESSION['dados']['questao7'] == $row_sits['id'])) {
                                                echo "<option value='" . $row_questao7['id'] . "' selected>" . $row_questao7['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao7']) and (isset($row_edit_av['questao7']) and ($row_edit_av['questao7'] == $row_questao7['id']))) {
                                                echo "<option value='" . $row_questao7['id'] . "' selected>" . $row_questao7['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_questao7['id'] . "'>" . $row_questao7['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao8 = "SELECT * FROM adms_resposta";
                                    $resultado_questao8 = mysqli_query($conn, $result_questao8);
                                    ?>
                                    <label>
                                        Equipe de coleta (exame de laboratório)
                                    </label>
                                    <select name="questao8" id="questao8" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_questao8 = mysqli_fetch_assoc($resultado_questao8)) {
                                            if (isset($_SESSION['dados']['questao8']) and ($_SESSION['dados']['questao8'] == $row_sits['id'])) {
                                                echo "<option value='" . $row_questao8['id'] . "' selected>" . $row_questao8['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao8']) and (isset($row_edit_av['questao8']) and ($row_edit_av['questao8'] == $row_questao8['id']))) {
                                                echo "<option value='" . $row_questao8['id'] . "' selected>" . $row_questao8['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_questao8['id'] . "'>" . $row_questao8['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao9 = "SELECT * FROM adms_resposta";
                                    $resultado_questao9 = mysqli_query($conn, $result_questao9);
                                    ?>
                                    <label>
                                        Realização de outros exames
                                    </label>
                                    <select name="questao9" id="questao9" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_questao9 = mysqli_fetch_assoc($resultado_questao9)) {
                                            if (isset($_SESSION['dados']['questao9']) and ($_SESSION['dados']['questao9'] == $row_sits['id'])) {
                                                echo "<option value='" . $row_questao9['id'] . "' selected>" . $row_questao9['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao9']) and (isset($row_edit_av['questao9']) and ($row_edit_av['questao9'] == $row_questao9['id']))) {
                                                echo "<option value='" . $row_questao9['id'] . "' selected>" . $row_questao9['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_questao9['id'] . "'>" . $row_questao9['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group form-group col-md-12 was-validated">
                                    <?php
                                    $result_questao10 = "SELECT * FROM adms_resposta";
                                    $resultado_questao10 = mysqli_query($conn, $result_questao10);
                                    ?>
                                    <label>
                                        Qualidade da alimentação
                                    </label>
                                    <select name="questao10" id="questao10" class="form-control">
                                        <option value="">SELECIONE</option>
                                        <?php
                                        while ($row_questao10 = mysqli_fetch_assoc($resultado_questao10)) {
                                            if (isset($_SESSION['dados']['questao10']) and ($_SESSION['dados']['questao10'] == $row_sits['id'])) {
                                                echo "<option value='" . $row_questao10['id'] . "' selected>" . $row_questao10['descricao_resposta'] . "</option>";


                                                //Preencher com informações do banco de dados caso não tenha nenhum valor salvo na sessão $_SESSION['dados']
                                            } elseif (!isset($_SESSION['dados']['questao10']) and (isset($row_edit_av['questao10']) and ($row_edit_av['questao10'] == $row_questao10['id']))) {
                                                echo "<option value='" . $row_questao10['id'] . "' selected>" . $row_questao10['descricao_resposta'] . "</option>";
                                            } else {
                                                echo "<option value='" . $row_questao10['id'] . "'>" . $row_questao10['descricao_resposta'] . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="form-group col-md-12 was-validated">
                                    <label> Com base em sua experiencia de uma nota de 0 á 10 </label>
                                    <input name="nota_avaliacao" type="number" class="form-control is-valid" id="nota_avaliacao" min="0" max="10" placeholder="Nota de 0 à 10" value="<?php
                                    if (isset($_SESSION['dados']['nota_avaliacao'])) {
                                        echo $_SESSION['dados']['nota_avaliacao'];
                                    } elseif (isset($row_edit_av['nota_avaliacao'])) {
                                        echo $row_edit_av['nota_avaliacao'];
                                    }
                                    ?>" required>
                                </div>
                            </div>

                            <br>

                            <input name="SendEditav" type="submit" class="btn btn-warning" value="Salvar">
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
        $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
        $url_destino = pg . '/listar/list_avaliacoes';
        header("Location: $url_destino");
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
