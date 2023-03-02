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
                        <h2 class="display-4 titulo">Cadastrar Avaliação do Leito </h2>
                    </div>
                    <div class="p-2">
                        <?php
                        $btn_list = carregar_btn('listar/list_paciente', $conn);
                        if ($btn_list) {
                            echo "<a href='" . pg . "/listar/list_paciente' class='btn btn-outline-info btn-sm'>Voltar</a> ";
                        }
                        ?>
                    </div>
                </div><hr>
                <?php
                if (isset($_SESSION['msg'])) {
                    echo $_SESSION['msg'];
                    unset($_SESSION['msg']);
                }
                ?>
                <form method="POST" action="<?php echo pg; ?>/processa/proc_cad_avaliacao" enctype="multipart/form-data" autocomplete="off">  
                    
                <?php
                        $resul_menu = "SELECT * FROM adms_pergunta ORDER BY id ASC";
                        $resultado_menu = mysqli_query($conn, $resul_menu);

                        if (($resultado_menu) and ($resultado_menu->num_rows != 0)) {
                        ?>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-sm">
                                    <thead>
                                        <tr>
                                            <th class="col-md-6">Pergunta</th>
                                            <th class="col-md-6">Opções</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        while ($row_menu = mysqli_fetch_assoc($resultado_menu)) {
                                        ?>
                                            <tr>
                                                <td><?php echo $row_menu['descricao_pergunta']; ?></td>
                                                <td class="text-center">
                                                    <div class="form-group was-validated">
                                                        <?php
                                                        $result_niv_ac = "SELECT id, descricao_resposta FROM adms_resposta ORDER BY id ASC";
                                                        $resultado_niv_ac = mysqli_query($conn, $result_niv_ac);
                                                        ?>
                                                        <select name="adms_niveis_acesso_id" id="adms_niveis_acesso_id" class="form-control form-control-sm is-valid" required>
                                                            <option value="">SELECIONAR</option>
                                                            <?php
                                                            while ($row_niv_ac = mysqli_fetch_assoc($resultado_niv_ac)) {
                                                                if (isset($_SESSION['dados']['adms_niveis_acesso_id']) and ($_SESSION['dados']['adms_niveis_acesso_id'] == $row_niv_ac['id'])) {
                                                                    echo "<option value='" . $row_niv_ac['id'] . "' selected>" . $row_niv_ac['descricao_resposta'] . "</option>";
                                                                } else {
                                                                    echo "<option value='" . $row_niv_ac['id'] . "'>" . $row_niv_ac['descricao_resposta'] . "</option>";
                                                                }
                                                            }
                                                            ?>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                        <?php
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        <?php
                        } else {
                        ?>
                            <div class="alert alert-danger" role="alert">
                                Nenhum registro encontrado!
                            </div>
                        <?php
                        }
                        ?>
                    
                    <br>
                    <input name="SendCadAvaliacao" type="submit" class="btn btn-success" value="Cadastrar">
                </form>
            </div>    
        </div>
        <?php
        unset($_SESSION['dados']);
        include_once 'app/adms/include/rodape_lib.php';
        ?>       
    </div>
</body>


