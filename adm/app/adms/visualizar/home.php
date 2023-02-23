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
<style>
    * {
        border: none;
    }

    .menu a:hover {
        background-color: #007BFF;
    }

    .menu a:focus {
        background-color: #007BFF;
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
                        <h2 class="display-4 titulo">HISA Satisfação de Leitos</h2>
                    </div>
                    <div class="btn-group btn-sm">
                        <button type="button" class="btn btn-success btn btn-prymary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Site
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="http://localhost/leito_pesquisa/site/home" target=_blank><i class="fas fa-hand-point-right"></i> Página Principal</a>
                        </div>
                    </div>

                </div>
                <br>
                <div class="row mb-3">
                    <?php
                    $result_usuarios = "SELECT * FROM adms_usuarios";
                    $resultado_usuarios = mysqli_query($conn, $result_usuarios);
                    $total_usuarios = mysqli_num_rows($resultado_usuarios);

                    echo "<div class='col-lg-3 col-sm-3 text-center'style='padding: 10px' style='a{color: black !Important;}' id='esconder'>";
                    echo "<div class ='card bg-success menu'>";
                    echo "<a class='dropdown-item' href='" . pg . "/listar/list_usuario' id='esconder'>";
                    echo "<i class = 'fas fa-eye fa-2x text-white'></i>";
                    echo "<h6 class = 'card-title text-white'>Usuários</h6>";
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