<?php
if (!isset($seg)) {
    exit;
}

$result_edit_user = "SELECT * FROM adms_usuarios WHERE id='" . $_SESSION['id'] . "' LIMIT 1";


$resultado_edit_user = mysqli_query($conn, $result_edit_user);
//Verificar se encontrou a página no banco de dados
if (($resultado_edit_user) AND ( $resultado_edit_user->num_rows != 0)) {
    $row_edit_user = mysqli_fetch_assoc($resultado_edit_user);
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
                            <h2 class="display-4 titulo">Editar Perfil</h2>
                        </div>
                        <div class="p-2">
                            <?php
                            $btn_vis = carregar_btn('visualizar/vis_perfil', $conn);
                            if ($btn_vis) {
                                echo "<a href='" . pg . "/visualizar/vis_perfil' class='btn btn-outline-primary btn-sm'>Visualizar </a> ";
                            }
                            ?>
                        </div>
                    </div><hr>
                    <?php
                    if (isset($_SESSION['msg'])) {
                        echo $_SESSION['msg'];
                        unset($_SESSION['msg']);
                    }
                    ?>
                    <form method="POST" action="<?php echo pg; ?>/processa/proc_edit_perfil" enctype="multipart/form-data">  
                        <div class="form-row">
                            <div class="form-group col-md-6 was-validated">
                                <label>                                
                                     Nome
                                </label>
                                <input name="nome" type="text" class="form-control is-valid" id="nome" placeholder="Nome do usuário completo" value="<?php
                                if (isset($_SESSION['dados']['nome'])) {
                                    echo $_SESSION['dados']['nome'];
                                } elseif (isset($row_edit_user['nome'])) {
                                    echo $row_edit_user['nome'];
                                }
                                ?>" required>
                            </div>

                            <div class="form-group col-md-6 was-validated">
                                <label> E-mail</label>
                                <input name="email" type="email" class="form-control is-valid" id="email" placeholder="E-mail do usuário" value="<?php
                                if (isset($_SESSION['dados']['email'])) {
                                    echo $_SESSION['dados']['email'];
                                } elseif (isset($row_edit_user['email'])) {
                                    echo $row_edit_user['email'];
                                }
                                ?>" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-5 was-validated">
                                <label>                                
                                     Usuário
                                </label>
                                <input name="usuario" type="text" class="form-control is-valid" id="nome" placeholder="Nome de usuário para login" value="<?php
                                if (isset($_SESSION['dados']['usuario'])) {
                                    echo $_SESSION['dados']['usuario'];
                                } elseif (isset($row_edit_user['usuario'])) {
                                    echo $row_edit_user['usuario'];
                                }
                                ?>" required>
                            </div>

                            <div class="form-group col-md-4 was-validated">
                                <label> Senha</label>
                                <input name="senha" type="password" class="form-control is-valid" id="email" placeholder="A senha deve ter 6 caracteres" value="<?php
                                if (isset($_SESSION['dados']['senha'])) {
                                    echo $_SESSION['dados']['senha'];
                                }
                                ?>" required>
                            </div>

                            <div class="form-group col-md-3">
                                <label> Apelido </label>
                                <input name="apelido" type="text" class="form-control" id="email" placeholder="Apelido do usuário" value="<?php
                                if (isset($_SESSION['dados']['apelido'])) {
                                    echo $_SESSION['dados']['apelido'];
                                } elseif (isset($row_edit_user['apelido'])) {
                                    echo $row_edit_user['apelido'];
                                }
                                ?>">
                            </div>
                        </div>

                        <br>
                        <input name="SendEditPerfil" type="submit" class="btn btn-warning" value="Salvar">
                    </form>
                </div>    
            </div>

            <?php
            include_once 'app/adms/include/rodape_lib.php';
            ?> 
        </div>
    </body>
    <?php
    unset($_SESSION['dados']);
} else {
    $_SESSION['msg'] = "<div class='alert alert-danger'>Usuário não encontrada!</div>";
    $url_destino = pg . '/listar/list_usuario';
    header("Location: $url_destino");
}