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
include_once 'app/adms/include/head_login.php';
?>

<body class="text-center">
    <form class="form-signin" method="POST" action="<?php echo pg . '/acesso/valida'; ?>">
        <img class="mb-4" src="<?php echo pg; ?>/assets/imagens/logo_login/leito_icon.png" alt="Leito" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">Área Restrita <br> Pesquisa de satisfação leitos</h1>
        <?php
        if (isset($_SESSION['msg'])) {
            echo $_SESSION['msg'];
            unset($_SESSION['msg']);
        }
        if (isset($_SESSION['msgcad'])) {
            echo $_SESSION['msgcad'];
            unset($_SESSION['msgcad']);
        }
        ?>
        <div class="form-group">
            <input name="usuario" type="text" class="form-control" placeholder="Digite o usuário" required>
        </div>
        <div class="form-group">
            <input name="senha" type="password" class="form-control" placeholder="Digite a senha" required>
        </div>
        <input type="submit" class="btn btn-lg btn-primary btn-block" value="Acessar" name="SendLogin">

    </form>
</body>