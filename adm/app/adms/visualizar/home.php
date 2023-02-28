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

    @media (max-width: 575.98px) {
        #esconder {
            display: none;
        }

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
                    </div>
                </div>
                <br>
                <div class="row mb-3">
                    <?php
                    $result_usuarios = "SELECT * FROM adms_usuarios";
                    $resultado_usuarios = mysqli_query($conn, $result_usuarios);
                    $total_usuarios = mysqli_num_rows($resultado_usuarios);

                    echo "<div class='col-lg-3 col-sm-3 text-center'style='padding: 10px' style='a{color: black !Important;}' id='esconder'>";
                    echo "<div class ='card bg-primary menu'>";
                    echo "<a class='dropdown-item' href='" . pg . "/listar/list_usuario' id='esconder'>";
                    echo "<i class = 'fas fa-users fa-2x text-white'></i>";
                    echo "<h6 class = 'card-title text-white'>Usuários</h6>";
                    echo "<h2 class='text-white'>$total_usuarios</h2>";
                    echo "</a>";
                    echo "</div>";
                    echo "</div>";

                    $result_usuarios = "SELECT * FROM adms_paciente";
                    $resultado_usuarios = mysqli_query($conn, $result_usuarios);
                    $total_usuarios = mysqli_num_rows($resultado_usuarios);

                    echo "<div class='col-lg-3 col-sm-3 text-center'style='padding: 10px' style='a{color: black !Important;}' id='esconder'>";
                    echo "<div class ='card bg-primary menu'>";
                    echo "<a class='dropdown-item' href='" . pg . "/listar/list_paciente' id='esconder'>";
                    echo "<i class = 'fa fa-male fa-2x text-white'></i>";
                    echo "<h6 class = 'card-title text-white'>Pacientes</h6>";
                    echo "<h2 class='text-white'>$total_usuarios</h2>";
                    echo "</a>";
                    echo "</div>";
                    echo "</div>";
                    ?>
                </div>
                <?php
                include_once 'app/adms/include/rodape_lib.php';
                ?>

            </div>
        </div>
    </div>
</body>