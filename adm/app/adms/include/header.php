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
$result_user_hd = "SELECT id, nome, imagem FROM adms_usuarios WHERE id='".$_SESSION['id']."' LIMIT 1";
$resultado_user_hd = mysqli_query($conn, $result_user_hd);
$row_user_hd = mysqli_fetch_assoc($resultado_user_hd);
$nome = explode(" ", $row_user_hd['nome']);
$prim_nome = $nome[0];
?>
<nav class="navbar navbar-expand navbar-dark bg-primary">
    <a class="sidebar-toggle text-light mr-3">
        <span class="navbar-toggler-icon"></span>
    </a>
    <a class="navbar-brand" href="<?php echo pg . '/visualizar/home'; ?>"><img src="<?php echo pg; ?>/assets/imagens/logo_barra/ints-logo-barra.png" title="INTS"></a>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle menu-header" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown">
                    <?php
                    if(!empty($row_user_hd['imagem'])){
                        echo "<img class='rounded-circle' src='".pg."/assets/imagens/usuario/".$row_user_hd['id']."/".$row_user_hd['imagem']."' width='20' height='20'>";
                    }else{
                        echo "<img class='rounded-circle' src='".pg."/assets/imagens/usuario/icone_usuario.png' width='20' height='20'>";
                    }
                    ?>
                     &nbsp;<span class="d-none d-sm-inline"><?php echo $prim_nome; ?></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo pg .'/visualizar/vis_perfil'; ?>"><i class="fas fa-user"></i> Perfil</a>
                    <a class="dropdown-item" href="<?php echo pg; ?>/acesso/sair"><i class="fa fa-power-off"></i> Sair</a>
                </div>
            </li>
        </ul>                
    </div>
</nav>