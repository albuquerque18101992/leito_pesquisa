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
                        <h2 class="display-4 titulo">Cadastrar Usuário</h2>
                    </div>
                    <div class="p-2">
                        <?php
                        $btn_list = carregar_btn('listar/list_usuario', $conn);
                        if ($btn_list) {
                            echo "<a href='" . pg . "/listar/list_usuario' class='btn btn-outline-info btn-sm'>Voltar</a> ";
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
                <form method="POST" action="<?php echo pg; ?>/processa/cadastrar/proc_cad_usuario" enctype="multipart/form-data" autocomplete="off">  
                    <div class="form-row">
                        <div class="form-group col-md-4 was-validated">
                            <label>                                
                                Nome
                            </label>
                            <input name="nome" type="text" class="form-control is-valid" id="nome" placeholder="Nome do usuário completo" value="<?php
                            if (isset($_SESSION['dados']['nome'])) {
                                echo $_SESSION['dados']['nome'];
                            }
                            ?>" required>
                        </div>

                        <div class="form-group col-md-4 was-validated">
                            <label> E-mail</label>
                            <input name="email" type="email" class="form-control is-valid" id="email" placeholder="E-mail do usuário" value="<?php
                            if (isset($_SESSION['dados']['email'])) {
                                echo $_SESSION['dados']['email'];
                            }
                            ?>" required>
                        </div>

                        <div class="form-group col-md-4 was-validated">
                            <label> N° Crachá</label>
                            <input name="num_cracha" type="text" class="form-control is-valid" id="num_cracha" placeholder="Número do crachá" value="<?php
                            if (isset($_SESSION['dados']['num_cracha'])) {
                                echo $_SESSION['dados']['num_cracha'];
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
                            <label> Identificador </label>
                            <input name="apelido" type="text" class="form-control" id="apelido" placeholder="identificação do usuário" value="<?php
                            if (isset($_SESSION['dados']['apelido'])) {
                                echo $_SESSION['dados']['apelido'];
                            }
                            ?>">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6 was-validated">
                            <?php
                            $result_niv_ac = "SELECT id, nome FROM adms_niveis_acessos WHERE ordem >= '".$_SESSION['ordem']."' ORDER BY nome ASC";
                            $resultado_niv_ac = mysqli_query($conn, $result_niv_ac);
                            ?>
                            <label> Nível de Acesso </label>
                            <select name="adms_niveis_acesso_id" id="adms_niveis_acesso_id" class="form-control is-valid" required>
                                <option value="">SELECIONAR</option>
                                <?php
                                while ($row_niv_ac = mysqli_fetch_assoc($resultado_niv_ac)) {
                                    if (isset($_SESSION['dados']['adms_niveis_acesso_id']) AND ( $_SESSION['dados']['adms_niveis_acesso_id'] == $row_niv_ac['id'])) {
                                        echo "<option value='" . $row_niv_ac['id'] . "' selected>" . $row_niv_ac['nome'] . "</option>";
                                    } else {
                                        echo "<option value='" . $row_niv_ac['id'] . "'>" . $row_niv_ac['nome'] . "</option>";
                                    }
                                }
                                ?>
                            </select>
                        </div>

                        
                        <div class="form-group col-md-6 was-validated">
                            <?php
                            $result_sit_user = "SELECT id, nome FROM adms_sits_usuarios ORDER BY nome ASC";
                            $resultado_sit_user = mysqli_query($conn, $result_sit_user);
                            ?>
                            <label> Situação do Usuário </label>
                            <select name="adms_sits_usuario_id" id="adms_sits_usuario_id" class="form-control is-valid" required>
                                <option value="">SELECIONAR</option>
                                <?php
                                while ($row_sit_user = mysqli_fetch_assoc($resultado_sit_user)) {
                                    if (isset($_SESSION['dados']['adms_sits_usuario_id']) AND ( $_SESSION['dados']['adms_sits_usuario_id'] == $row_sit_user['id'])) {
                                        echo "<option value='" . $row_sit_user['id'] . "' selected>" . $row_sit_user['nome'] . "</option>";
                                    } else {
                                        echo "<option value='" . $row_sit_user['id'] . "'>" . $row_sit_user['nome'] . "</option>";
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    
                    <!--
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label> Foto </label>
                            <input type="file" name="imagem" onchange="previewImagem();">
                        </div>  
                        <div class="form-group col-md-6">
                            <img src="<?php //echo pg.'/assets/imagens/usuario/preview_img.png'; ?>" id="preview-user" class="img-thumbnail" style="width: 150px; height: 150px;">
                        </div>                       
                    </div>
                    -->
                    <br>
                    <input name="SendCadUser" type="submit" class="btn btn-success" value="Cadastrar">
                </form>
            </div>    
        </div>
        <?php
        unset($_SESSION['dados']);
        include_once 'app/adms/include/rodape_lib.php';
        ?>
        <script>
            function previewImagem(){
                var imagem = document.querySelector('input[name=imagem').files[0];
                var preview = document.querySelector('#preview-user');
                
                var reader = new FileReader();
                
                reader.onloadend = function(){
                    preview.src = reader.result;
                }
                
                if(imagem){
                    reader.readAsDataURL(imagem);
                }else{
                    preview.src = "";
                }
            }
        </script>        
    </div>
</body>


