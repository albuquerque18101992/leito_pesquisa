<?php
if(!isset($seg)){
    exit;
}
$url_host = filter_input(INPUT_SERVER, 'HTTP_HOST');
define('pg', "http://$url_host/leito_pesquisa/adm");
define('pgsite', "http://$url_host/leito_pesquisa/site");
//define('pg', "http://menu_dominio.com.br/celke/adm");