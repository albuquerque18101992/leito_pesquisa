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
                <form method="POST" action="<?php echo pg; ?>/processa/cadastrar/proc_cad_paciente" enctype="multipart/form-data" autocomplete="off">
                    <div class="form-row ">
                        <div class="form-group col-md-12 was-validated">
                            <label>
                                Nome
                            </label>
                            <input name="nome_paciente" type="text" class="form-control is-valid" id="nome_paciente" placeholder="Nome completo do usuário" value="<?php
                                if (isset($_SESSION['dados']['nome_paciente'])) {
                                    echo $_SESSION['dados']['nome_paciente'];
                                }
                                ?>" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label> Telefone </label>
                            <input name="telefone" type="text" class="form-control" id="telefone" placeholder="Numero de telefone" value="<?php
                                if (isset($_SESSION['dados']['telefone'])) {
                                    echo $_SESSION['dados']['telefone'];
                                }
                                ?>">
                        </div>

                        <div class="form-group col-md-6 was-validated">
                            <label> CPF </label>
                            <input name="cpf_doc" type="text" class="form-control is-valid" id="cpf_doc" placeholder="Informe um CPF" value="<?php
                                if (isset($_SESSION['dados']['cpf_doc'])) {
                                    echo $_SESSION['dados']['cpf_doc'];
                                }
                                ?>" required>
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
                        <div class="form-group col-md-12 was-validated">
                            <?php
                            $result_sit_user = "SELECT * FROM adms_situacao_paciente ORDER BY descricao_situacao ASC";
                            $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                            ?>
                            Situação do Usuário </label>
                            <select name="adms_situacao_paciente_id" id="adms_situacao_paciente_id" class="form-control is-valid" required>
                                <option value="">SELECIONAR</option>
                                <?php
                                while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                    if (isset($_SESSION['dados']['adms_situacao_paciente_id']) and ($_SESSION['dados']['adms_situacao_paciente_id'] == $row_sit_user['id'])) {
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

<script>
    //Mascara para preencher o CPF no padrão -> 000.000.000-01
    document.getElementById('cpf_doc').addEventListener('input', function(e) {

    x = e.target.value.replace(/\D/g, '').match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
    e.target.value = !x[2] ? x[1] : x[1] + '.' + x[2] + (x[3] ? '.' : '') + x[3] + (x[4] ? '-' + x[4] : '');

    });


    //Mascara para preencher o Celular no padrão -> (00)00000-0000
    document.getElementById('telefone').addEventListener('input', function(e) {

    cel = e.target.value.replace(/\D/g, '').match(/(\d{0,2})(\d{0,5})(\d{0,4})/);
    e.target.value = !cel[2] ? cel[1] : cel[1] + '-' + cel[2] + (cel[3] ? '-' : '') + cel[3];

    });
</script>