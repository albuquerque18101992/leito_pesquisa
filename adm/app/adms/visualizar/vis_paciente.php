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
if (!empty($id)) {

    $result_paciente_vis = "SELECT user.*,
            sit.descricao_situacao nome_sit
            FROM adms_paciente user
            INNER JOIN adms_situacao_paciente sit ON sit.id=user.adms_situacao_paciente_id
            WHERE user.id=$id LIMIT 1";

    $resultado_paciente_vis = mysqli_query($conn, $result_paciente_vis);
    if (($resultado_paciente_vis) and ($resultado_paciente_vis->num_rows != 0)) {
        $row_paciente_vis = mysqli_fetch_assoc($resultado_paciente_vis);
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
                                <h2 class="display-4 titulo">Detalhes do Paciente</h2>
                            </div>
                            <div class="p-2">
                                <span class="d-none d-md-block">
                                    <?php
                                    $btn_list = carregar_btn('listar/list_paciente', $conn);
                                    if ($btn_list) {
                                        echo "<a href='" . pg . "/listar/list_paciente' class='btn btn-outline-info btn-sm'>Voltar</a> ";
                                    }
                                    $btn_edit = carregar_btn('editar/edit_paciente', $conn);
                                    if ($btn_edit) {
                                        echo "<a href='" . pg . "/editar/edit_paciente?id=" . $row_paciente_vis['id'] . "' class='btn btn-outline-warning btn-sm'>Editar </a> ";
                                    }
                                    $btn_apagar = carregar_btn('processa/apagar/apagar_paciente', $conn);
                                    if ($btn_apagar) {
                                        echo "<a href='" . pg . "/processa/apagar/apagar_paciente?id=" . $row_paciente_vis['id'] . "' class='btn btn-outline-danger btn-sm' data-confirm='Tem certeza de que deseja excluir o item selecionado?'>Apagar</a> ";
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
                                            echo "<a class='dropdown-item' href='" . pg . "/listar/list_paciente'>Voltar</a>";
                                        }
                                        if ($btn_edit) {
                                            echo "<a class='dropdown-item' href='" . pg . "/editar/edit_paciente?id=" . $row_paciente_vis['id'] . "'>Editar</a>";
                                        }
                                        if ($btn_apagar) {
                                            echo "<a class='dropdown-item' href='" . pg . "/processa/apagar/apagar_paciente?id=" . $row_paciente_vis['id'] . "' data-confirm='Tem certeza de que deseja excluir o item selecionado?'>Apagar</a>";
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <dl class="row">
                            <dt class="col-sm-3">id</dt>
                            <dd class="col-sm-9"><?php echo $row_paciente_vis['id']; ?></dd>

                            <dt class="col-sm-3">Nome</dt>
                            <dd class="col-sm-9"><?php echo $row_paciente_vis['nome_paciente']; ?></dd>

                            <dt class="col-sm-3">Telefone de contato</dt>
                            <dd class="col-sm-9"><?php echo $row_paciente_vis['telefone']; ?></dd>

                            <dt class="col-sm-3">Documento: CPF</dt>
                            <dd class="col-sm-9"><?php echo $row_paciente_vis['cpf_doc']; ?></dd>

                            <dt class="col-sm-3">Endereço</dt>
                            <dd class="col-sm-9"><?php echo $row_paciente_vis['endereco']; ?></dd>

                            <dt class="col-sm-3">Situação</dt>
                            <dd class="col-sm-9"><?php echo $row_paciente_vis['adms_situacao_paciente_id']; ?></dd>

                            <dt class="col-sm-3 text-truncate">Data do Cadastro</dt>
                            <dd class="col-sm-9"><?php echo date('d/m/Y H:i:s', strtotime($row_paciente_vis['created'])); ?></dd>

                            <dt class="col-sm-3 text-truncate">Data de Edição</dt>
                            <dd class="col-sm-9"><?php
                                if (!empty($row_paciente_vis['modified'])) {
                                    echo date('d/m/Y H:i:s', strtotime($row_paciente_vis['modified']));
                                }
                                ?>
                            </dd>






                        </dl>
                    </div>
                </div>
                <?php
                include_once 'app/adms/include/rodape_lib.php';
                ?>

            </div>
        </body>
<?php
    } else {
        $_SESSION['msg'] = "<div class='alert alert-danger'>Usuário não encontrado!</div>";
        $url_destino = pg . '/listar/list_paciente';
        header("Location: $url_destino");
    }
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
    $url_destino = pg . '/acesso/login';
    header("Location: $url_destino");
}
