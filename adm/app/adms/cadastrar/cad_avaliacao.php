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
                        <h2 class="display-4 titulo"> Cadastrar Avaliação do Leito </h2>
                    </div>
                    <div class="p-2">
                        <?php
                        $btn_list = carregar_btn('listar/list_paciente', $conn);
                        if ($btn_list) {
                            echo "<a href='" . pg . "/listar/list_paciente' class='btn btn-outline-info btn-sm'>Voltar</a> ";
                        }
                        ?>
                    </div>
                </div>

                <?php
                if (isset($_SESSION['msg'])) {
                    echo $_SESSION['msg'];
                    unset($_SESSION['msg']);
                }
                ?>
                <form method="POST" action="<?php echo pg; ?>/processa/proc_cad_avaliacao" enctype="multipart/form-data" autocomplete="off">

                    <?php
                    //Receber o número da página
                    $pagina_atual = filter_input(INPUT_GET, 'pagina', FILTER_SANITIZE_NUMBER_INT);
                    $pagina = (!empty($pagina_atual)) ? $pagina_atual : 1;

                    //Setar a quantidade de itens por pagina
                    $qnt_result_pg = 40;

                    //Calcular o inicio visualização
                    $inicio = ($qnt_result_pg * $pagina) - $qnt_result_pg;

                    $resul_menu = "SELECT * FROM adms_pergunta ORDER BY id ASC LIMIT $inicio, $qnt_result_pg";
                    $resultado_menu = mysqli_query($conn, $resul_menu);

                    if (($resultado_menu) and ($resultado_menu->num_rows != 0)) {
                    ?>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Pergunta</th>
                                        <th class="text-center">Opções</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $qnt_linhas_exe = 1;
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
                                                        <select name="adms_niveis_acesso_id" id="adms_niveis_acesso_id" class="form-control is-valid" required>
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
                            <?php
                            $result_pg = "SELECT COUNT(id) AS num_result FROM adms_pergunta";
                            $resultado_pg = mysqli_query($conn, $result_pg);
                            $row_pg = mysqli_fetch_assoc($resultado_pg);
                            //echo $row_pg['num_result'];
                            //Quantidade de pagina 
                            $quantidade_pg = ceil($row_pg['num_result'] / $qnt_result_pg);
                            //Limitar os link antes depois
                            $max_links = 2;
                            echo "<nav aria-label='paginacao-blog'>";
                            echo "<ul class='pagination pagination-sm justify-content-center'>";
                            echo "<li class='page-item'>";
                            echo "<a class='page-link' href='" . pg . "/cadastrar/cad_avaliacao?pagina=1' tabindex='-1'>Primeira</a>";
                            echo "</li>";

                            for ($pag_ant = $pagina - $max_links; $pag_ant <= $pagina - 1; $pag_ant++) {
                                if ($pag_ant >= 1) {
                                    echo "<li class='page-item'><a class='page-link' href='" . pg . "/cadastrar/cad_avaliacao?pagina=$pag_ant'>$pag_ant</a></li>";
                                }
                            }

                            echo "<li class='page-item active'>";
                            echo "<a class='page-link' href='#'>$pagina</a>";
                            echo "</li>";

                            for ($pag_dep = $pagina + 1; $pag_dep <= $pagina + $max_links; $pag_dep++) {
                                if ($pag_dep <= $quantidade_pg) {
                                    echo "<li class='page-item'><a class='page-link' href='" . pg . "/cadastrar/cad_avaliacao?pagina=$pag_dep'>$pag_dep</a></li>";
                                }
                            }

                            echo "<li class='page-item'>";
                            echo "<a class='page-link' href='" . pg . "/cadastrar/cad_avaliacao?pagina=$quantidade_pg'>Última</a>";
                            echo "</li>";
                            echo "</ul>";
                            echo "</nav>";
                            ?>
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