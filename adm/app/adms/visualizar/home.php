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

//Trazendo o nome do nivel de acesso do usuário, para imprimir na tela de home
$niv_acesso = "SELECT id, nome FROM adms_niveis_acessos WHERE id='" . $_SESSION['adms_niveis_acesso_id'] . "' LIMIT 1";
$nivel_acesso = mysqli_query($conn, $niv_acesso);
$row_nivel_acesso = mysqli_fetch_assoc($nivel_acesso);



//Trazendo o nome do usuário logado
$niv_usuario = "SELECT * FROM adms_usuarios WHERE id='" . $_SESSION['id'] . "' LIMIT 1";
$nivel_usuario = mysqli_query($conn, $niv_usuario);
$row_usuario = mysqli_fetch_assoc($nivel_usuario);
?>
<style>
    * {
        border: none;
    }

    .menu a:hover {
        background-color: #185597;
    }

    .menu a:focus {
        background-color: #185597;
    }

</style>

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
                    <div class="mr-auto p2">
                        <h2 class="display-4 titulo"><?php echo $row_nivel_acesso['nome'] ?></h2>
                        <kbd><?php echo "Nome: " . $row_usuario['nome'] . " Crachá: " . $row_usuario['num_cracha'] ?></kbd>
                    </div>
                </div>
                <br>
                <div class="row mb-3">

                    <?php
                    if ($_SESSION['adms_niveis_acesso_id'] != 7) {
                        $result_usuarios = "SELECT * FROM adms_usuarios";
                        $resultado_usuarios = mysqli_query($conn, $result_usuarios);
                        $total_usuarios = mysqli_num_rows($resultado_usuarios);

                        echo "<div class='col-lg-3 col-sm-3 text-center'style='padding: 10px' style='a{color: black !Important;}' id='esconder'>";
                        echo "<div class ='card bg-primary menu'>";
                        echo "<a class='dropdown-item hvr-icon-wobble-vertical' href='" . pg . "/listar/list_usuario' id='esconder'>";
                        echo "<i class = 'fas fa-users fa-2x hvr-icon text-white'></i>";
                        echo "<h6 class = 'card-title text-white'>Usuários</h6>";
                        echo "<h2 class='text-white'>$total_usuarios</h2>";
                        echo "</a>";
                        echo "</div>";
                        echo "</div>";
                    }

                    $result_pacientes = "SELECT * FROM adms_paciente WHERE atendido = 1 AND baixa = 1";
                    $resultado_pacientes = mysqli_query($conn, $result_pacientes);
                    $total_pacientes = mysqli_num_rows($resultado_pacientes);

                    echo "<div class='col-lg-3 col-sm-3 text-center'style='padding: 10px' style='a{color: black !Important;}' id='esconder'>";
                    echo "<div class ='card bg-primary menu'>";
                    echo "<a class='dropdown-item hvr-icon-wobble-vertical' href='" . pg . "/listar/list_paciente' id='esconder'>";
                    echo "<i class = 'fa fa-bed fa-2x hvr-icon text-white'></i>";
                    echo "<h6 class = 'card-title text-white'>Pacientes</h6>";
                    echo "<h2 class='text-white'>$total_pacientes</h2>";
                    echo "</a>";
                    echo "</div>";
                    echo "</div>";


                    $result_pacientes_avali = "SELECT * FROM adms_paciente WHERE atendido = 2";
                    $resultado_pacientes_avali = mysqli_query($conn, $result_pacientes_avali);
                    $total_pacientes_avali = mysqli_num_rows($resultado_pacientes_avali);

                    echo "<div class='col-lg-3 col-sm-3 text-center'style='padding: 10px' style='a{color: black !Important;}' id='esconder'>";
                    echo "<div class ='card bg-primary menu'>";
                    echo "<a class='dropdown-item hvr-icon-wobble-vertical' href='" . pg . "/listar/list_avaliacoes' id='esconder'>";
                    echo "<i class = 'fa fa-clipboard fa-2x hvr-icon text-white'></i>";
                    echo "<h6 class = 'card-title text-white'>Avaliações</h6>";
                    echo "<h2 class='text-white'>$total_pacientes_avali</h2>";
                    echo "</a>";
                    echo "</div>";
                    echo "</div>";
                    ?>
                </div>



                <div class="card text-center">
                    <div class="card-header">
                        Tecnologia da Informação - T.I
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Em caso de dúvidas</h5>
                        <p class="card-text">Em caso de necessidade abrir chamado na ferramenta GLPI informando o ocorrido!</p>
                        <a href="http://177.66.152.194:4321/glpi/" target="_blank" class="btn btn-primary">GLPI</a>
                    </div>
                    <div class="card-footer text-muted">
                        <?php echo date('d/m/Y') ?>
                    </div>
                </div>


                <?php
                include_once 'app/adms/include/rodape_lib.php';
                ?>

            </div>
        </div>
    </div>
</body>