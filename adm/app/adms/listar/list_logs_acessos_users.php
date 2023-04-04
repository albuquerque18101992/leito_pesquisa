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


//Segurança para não consiguir acessa páginas indo direto na URL .
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
                        <h2 class="display-4 titulo"><i class="fas fa-list-ol"></i> Log de usuários</h2>
                    </div>
                    <div class="p-2">
                        <?php
                        $btn_list = carregar_btn('listar/list_usuario', $conn);
                        if ($btn_list) {
                            echo "<a href='" . pg . "/listar/list_usuario' class='btn btn-outline-info btn-sm'>Usuários</a> ";
                        }
                        ?>
                    </div>
                </div>
                <hr>
                <?php
                //include_once 'app/adms/pesquisas/pesquisa_cpu.php'; CRIAR PESQUISA CHIP ....
                if (isset($_SESSION['msg_de_erro'])) {
                    echo $_SESSION['msg_de_erro'];
                    unset($_SESSION['msg_de_erro']);
                }
                //Receber o número da página
                $pagina_atual = filter_input(INPUT_GET, 'pagina', FILTER_SANITIZE_NUMBER_INT);
                $pagina = (!empty($pagina_atual)) ? $pagina_atual : 1;
                //Setar a quantidade de itens por pagina
                $qnt_result_pg = 50;
                //Calcular o inicio visualização
                $inicio = ($qnt_result_pg * $pagina) - $qnt_result_pg;


                $resul_pg = "SELECT log.*,
                nome_usuario.nome AS nome_do_usuario,
                niv_acs.nome AS nome_do_acesso
                FROM adms_log_usuaios log
                INNER JOIN adms_usuarios nome_usuario ON nome_usuario.id=log.adms_usuario_id
                INNER JOIN adms_niveis_acessos niv_acs ON niv_acs.id=log.adms_niveis_acesso_id
                ORDER BY log.id DESC";

                $resultado_pg = mysqli_query($conn, $resul_pg);
                if (($resultado_pg) and ($resultado_pg->num_rows != 0)) {
                ?>
                    <div class="table-responsive">
                        <table class="table table-hover table-sm text-center table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th>id</th>
                                    <th>Nome</th>
                                    <th>User</th>
                                    <th>Nivel</th>
                                    <th>IP</th>
                                    <th>Data</th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                while ($row_pg = mysqli_fetch_assoc($resultado_pg)) {
                                ?>
                                    <tr>

                                        <td class="text-center"> <?php echo $row_pg['id'] ?></td>

                                        <td class="text-center"> <?php echo $row_pg['nome_do_usuario'] ?></td>

                                        <td class="text-center"> <?php echo $row_pg['usuario_logado'] ?></td>

                                        <td class="text-center"> <?php echo $row_pg['nome_do_acesso'] ?></td>

                                        <td class="text-center"> <?php echo $row_pg['ip_maquina_acesso'] ?></td>

                                        <td class="text-center"> <?php echo date('d/m/Y - H:i:s', strtotime($row_pg['created'])) ?></td>

                                    </tr>
                                <?php
                                }
                                ?>
                            </tbody>
                        </table>
                        <?php
                        $result_pg = "SELECT COUNT(id) AS num_result FROM adms_usuarios";
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
                        echo "<a class='page-link' href='" . pg . "/listar/list_logs_acessos_users?pagina=1' tabindex='-1'>Primeira</a>";
                        echo "</li>";
                        for ($pag_ant = $pagina - $max_links; $pag_ant <= $pagina - 1; $pag_ant++) {
                            if ($pag_ant >= 1) {
                                echo "<li class='page-item'><a class='page-link' href='" . pg . "/listar/list_logs_acessos_users?pagina=$pag_ant'>$pag_ant</a></li>";
                            }
                        }
                        echo "<li class='page-item active'>";
                        echo "<a class='page-link' href='#'>$pagina</a>";
                        echo "</li>";
                        for ($pag_dep = $pagina + 1; $pag_dep <= $pagina + $max_links; $pag_dep++) {
                            if ($pag_dep <= $quantidade_pg) {
                                echo "<li class='page-item'><a class='page-link' href='" . pg . "/listar/list_logs_acessos_users?pagina=$pag_dep'>$pag_dep</a></li>";
                            }
                        }
                        echo "<li class='page-item'>";
                        echo "<a class='page-link' href='" . pg . "/listar/list_logs_acessos_users?pagina=$quantidade_pg'>Última</a>";
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
            </div>
        </div>
    </div>
    <?php
    include_once 'app/adms/include/rodape_lib.php';
    ?>

</body>