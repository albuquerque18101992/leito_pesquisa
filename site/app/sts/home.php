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


if (!isset($seguranca)) {
    exit;
}
include_once 'app/sts/header.php';
?>

<body>
    <?php
    include_once 'app/sts/menu.php';
    ?>
    <main role="main">

        <div class="container card-servicos">
            <div class="content p-5">
                <div class="list-group-item">
                    <div class="d-flex verde-escuro">
                        <div class="mr-auto p-2">
                            <h2 class="display-6 titulo">Queremos a sua Opinião!</h2>
                        </div>
                    </div>
                    <?php
                    if (isset($_SESSION['msg'])) {
                        echo $_SESSION['msg'];
                        unset($_SESSION['msg']);
                    }
                    ?>
                    <form method="POST" action="<?php echo pg; ?>/processa/proc_sts_cad_pagina" enctype="multipart/form-data" autocomplete="off">
                        <div class="form-row was-validated">
                            <div class="form-group col-md-12">
                                <label>
                                    <span tabindex="0" data-placement="top">
                                        <i class="fas fa-question-circle"></i>
                                    </span>
                                    <span class="text-danger">*</span> Nome
                                </label>
                                <input name="nome" type="text" class="form-control is-invalid" id="nome" placeholder="Informar o nome" value="<?php
                                                                                                                                                if (isset($_SESSION['dados']['nome'])) {
                                                                                                                                                    echo $_SESSION['dados']['nome'];
                                                                                                                                                }
                                                                                                                                                ?>" required>
                            </div>

                            <div class="form-group col-md-12">
                                <label>
                                    <span tabindex="0" data-toggle="tooltip" data-placement="top" data-html="true">
                                        <i class="fas fa-question-circle"></i>
                                    </span><span class="text-danger">*</span> Telefone
                                </label>
                                <input name="telefone" type="text" class="form-control is-invalid" id="telefone" placeholder="Informar o telefone" value="<?php
                                                                                                                                                            if (isset($_SESSION['dados']['telefone'])) {
                                                                                                                                                                echo $_SESSION['dados']['telefone'];
                                                                                                                                                            }
                                                                                                                                                            ?>" required>
                            </div>

                            <div class="form-group col-md-12">
                                <label><span class="text-danger">*</span> Endereço</label>
                                <input name="endereco" type="text" class="form-control is-invalid" id="endereco" placeholder="Informar o endereço" value="<?php
                                                                                                                                                            if (isset($_SESSION['dados']['endereco'])) {
                                                                                                                                                                echo $_SESSION['dados']['endereco'];
                                                                                                                                                            }
                                                                                                                                                            ?>" required>
                            </div>
                        </div>



                        <div class="d-flex verde-escuro">
                            <div class="mr-auto p-2">
                                <h2 class="display-6 titulo">Qual sua opinião sobre o nosso atendimento:</h2>
                            </div>
                        </div>

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Pergunta</th>
                                    <th scope="col">Ruim</th>
                                    <th scope="col">Bom</th>
                                    <th scope="col">Excelente</th>
                                    <th scope="col">Não utilizei este serviço</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td> <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked></td>
                                    <td> <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked></td>
                                    <td><input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked></td>
                                    <td><input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked></td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                    <td>@twitter</td>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>Otto</td>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                            </tbody>
                        </table>


                        <p>
                            <span class="text-danger">* </span>Campo obrigatório
                        </p>
                        <input name="SendCadPg" type="submit" class="btn btn-success" value="Cadastrar">
                    </form>
                </div>
            </div>
        </div>




        <?php
        $result_servico = "SELECT * FROM sts_servicos LIMIT 1";
        $resultado_servico = mysqli_query($conn, $result_servico);
        $row_servico = mysqli_fetch_assoc($resultado_servico);
        ?>
        <div class="jumbotron servicos">
            <div class="container-fluid">
                <h2 class="display-4 text-center" style="margin-bottom: 40px;"><?php echo $row_servico['titulo']; ?></h2>
                <div class="card-deck card-servicos">
                    <div class="card text-center">
                        <div class="icon-row tamanh-icone">
                            <span class="step size-96 text-primary">
                                <i class="icon <?php echo $row_servico['icone_um']; ?>"></i>
                            </span>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row_servico['nome_um']; ?></h5>
                            <p class="card-text lead"><?php echo $row_servico['descricao_um']; ?></p>
                        </div>
                    </div>
                    <div class="card text-center">
                        <div class="icon-row tamanh-icone">
                            <span class="step size-96 text-primary">
                                <i class="icon <?php echo $row_servico['icone_dois']; ?>"></i>
                            </span>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row_servico['nome_dois']; ?></h5>
                            <p class="card-text lead"><?php echo $row_servico['descricao_dois']; ?></p>
                        </div>
                    </div>
                    <div class="card text-center">
                        <div class="icon-row tamanh-icone ">
                            <span class="step size-96 text-primary">
                                <i class="icon <?php echo $row_servico['icone_tres']; ?>"></i>
                            </span>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row_servico['nome_tres']; ?></h5>
                            <p class="card-text lead"><?php echo $row_servico['descricao_tres']; ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>
    <?php
    include_once 'app/sts/rodape.php';
    include_once 'app/sts/rodape_lib.php';
    ?>

    <script>
        window.sr = ScrollReveal({
            reset: true
        });

        sr.reveal('.card-servicos', {
            duration: 1000,
            origin: 'bottom',
            distance: '20px'
        });
    </script>
</body>