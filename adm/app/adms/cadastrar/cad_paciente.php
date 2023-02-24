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
                        <h2 class="display-4 titulo"> Cadastrar Paciente </h2>
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
                <hr>
                <?php
                if (isset($_SESSION['msg'])) {
                    echo $_SESSION['msg'];
                    unset($_SESSION['msg']);
                }
                ?>
                <form method="POST" action="<?php echo pg; ?>/processa/proc_cad_paciente" enctype="multipart/form-data">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label>
                                Nome
                            </label>
                            <input name="nome_paciente" type="text" class="form-control" id="nome_paciente" placeholder="Nome completo do usuário" value="<?php
                                if (isset($_SESSION['dados']['nome_paciente'])) {
                                    echo $_SESSION['dados']['nome_paciente'];
                                }
                                ?>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label> Telefone </label>
                            <input name="telefone" type="text" class="form-control" id="telefone" placeholder="Numero de telefone" value="<?php
                                if (isset($_SESSION['dados']['telefone'])) {
                                    echo $_SESSION['dados']['telefone'];
                                }
                                ?>">
                        </div>

                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label> Endereço </label>
                            <input name="endereco" type="text" class="form-control" id="endereco" placeholder="Rua, bairro, numero" value="<?php
                                if (isset($_SESSION['dados']['endereco'])) {
                                    echo $_SESSION['dados']['endereco'];
                                }
                                ?>">
                        </div>

                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <?php
                            $result_sit_user = "SELECT * FROM adms_situacao_paciente ORDER BY descricao_situacao ASC";
                            $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                            ?>
                            Situação do Usuário </label>
                            <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control">
                                <option>SELECIONAR</option>
                                <?php
                                while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                    if (isset($_SESSION['dados']['adms_sits_usuario_id']) and ($_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
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
                    <input name="SendCadPaciente" type="submit" class="btn btn-success" value="Cadastrar">
                </form>
            </div>
        </div>
        <?php
        unset($_SESSION['dados']);
        include_once 'app/adms/include/rodape_lib.php';
        ?>
    </div>
</body>