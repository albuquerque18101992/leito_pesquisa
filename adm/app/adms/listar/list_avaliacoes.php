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
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">

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
                        <h2 class="display-4 titulo"><div class='btn btn-success btn-sm'><i class='fa fa-check-circle' aria-hidden='true'></i> </div> Avaliações realizadas</h2>
                    </div>
                    
                </div>
                <?php
                if (isset($_SESSION['msg'])) {
                    echo $_SESSION['msg'];
                    unset($_SESSION['msg']);
                }
                ?>

                <div class="table-responsive">
                    <table id="listar-pacientes" class="table table-striped table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>Nome</th>
                                <th>Telefone</th>
                                <th>CPF</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                    </table>
                </div>

            </div>
            
        </div>
        <?php
        include_once 'app/adms/include/rodape_lib.php';
        ?>
        
        <script src="<?php echo pg; ?>/assets/js/personalizado.js"></script>
        <script src="<?php echo pg; ?>/assets/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#listar-pacientes').DataTable({
                    "processing": true,
                    "serverSide": true,
                    "ajax": {
                        "url": "../app/adms/listar/list_avaliacaoes_tables.php",
                        "type": "POST"
                    },
                });
            });
        </script>

    </div>
</body>