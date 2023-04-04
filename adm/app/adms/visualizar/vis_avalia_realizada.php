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

$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
if (!empty($id)) {

   $result_vis_av = "SELECT user.*,
   paciente.nome_paciente,
   registrador.nome AS nome_cadastrador,   
   numero_andar.num_andar AS andar,
   numero_leito.leito_num,
   numero_sala.sala_num AS sala,
   resposta_1.descricao_resposta AS primeira,
   resposta_2.descricao_resposta AS segunda,
   resposta_3.descricao_resposta AS terceira,
   resposta_4.descricao_resposta AS quarta,
   resposta_5.descricao_resposta AS quinta,
   resposta_6.descricao_resposta AS sexta,
   resposta_7.descricao_resposta AS setima,
   resposta_8.descricao_resposta AS oitava,
   resposta_9.descricao_resposta AS nona,
   resposta_10.descricao_resposta AS decima
   FROM adms_leitos_questoes user
   INNER JOIN adms_paciente paciente ON paciente.id=user.adms_paciente_id
   INNER JOIN adms_leitos numero_andar ON numero_andar.id=user.adms_leito_id
   INNER JOIN adms_usuarios registrador ON registrador.id=user.cadastrador
   INNER JOIN adms_leitos numero_leito ON numero_leito.id=user.adms_leito_id
   INNER JOIN adms_leitos numero_sala ON numero_sala.id=user.adms_leito_id   
   INNER JOIN adms_resposta resposta_1 ON resposta_1.id=user.questao1
   INNER JOIN adms_resposta resposta_2 ON resposta_2.id=user.questao2
   INNER JOIN adms_resposta resposta_3 ON resposta_3.id=user.questao3
   INNER JOIN adms_resposta resposta_4 ON resposta_4.id=user.questao4
   INNER JOIN adms_resposta resposta_5 ON resposta_5.id=user.questao5
   INNER JOIN adms_resposta resposta_6 ON resposta_6.id=user.questao6
   INNER JOIN adms_resposta resposta_7 ON resposta_7.id=user.questao7
   INNER JOIN adms_resposta resposta_8 ON resposta_8.id=user.questao8
   INNER JOIN adms_resposta resposta_9 ON resposta_9.id=user.questao9
   INNER JOIN adms_resposta resposta_10 ON resposta_10.id=user.questao10
   WHERE user.id = $id LIMIT 1";

   $resultado_vis_av = mysqli_query($conn, $result_vis_av);
   if (($resultado_vis_av) and ($resultado_vis_av->num_rows != 0)) {
      $row_vis_av = mysqli_fetch_assoc($resultado_vis_av);
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
                        <h2 class="display-4 titulo">Detalhes da avaliação</h2>
                     </div>
                     <div class="p-2">
                        <span class="d-none d-md-block">
                           <?php
                           $btn_list = carregar_btn('listar/list_avaliacoes', $conn);
                           if ($btn_list) {
                              echo "<a href='" . pg . "/listar/list_avaliacoes' class='btn btn-outline-info btn-sm'>Voltar</a> ";
                           }
                           $btn_edit = carregar_btn('editar/edit_avalia_realizada', $conn);
                           if ($btn_edit) {
                              echo "<a href='" . pg . "/editar/edit_avalia_realizada?id=" . $row_vis_av['id'] . "' class='btn btn-outline-warning btn-sm'>Editar </a> ";
                           }
                           $btn_apagar = carregar_btn('processa/apagar/apagar_avalia_realizada', $conn);
                           if ($btn_apagar) {
                              echo "<a href='" . pg . "/processa/apagar/apagar_avalia_realizada?id=" . $row_vis_av['id'] . "' class='btn btn-outline-danger btn-sm' data-confirm='Tem certeza de que deseja excluir o item selecionado?'>Apagar</a> ";
                           }
                           ?>
                        </span>
                        <div class="dropdown d-block d-md-none">
                           <button class="btn btn-primary dropdown-toggle btn-sm" type="button" id="acoesListar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Ações
                           </button>
                           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="acoesListar">
                              <?php
                              if ($btn_list) {
                                 echo "<a class='dropdown-item' href='" . pg . "/listar/list_avaliacoes'>Listar</a>";
                              }
                              if ($btn_edit) {
                                 echo "<a class='dropdown-item' href='" . pg . "/editar/edit_avalia_realizada?id=" . $row_vis_av['id'] . "'>Editar</a>";
                              }
                              if ($btn_apagar) {
                                 echo "<a class='dropdown-item' href='" . pg . "/processa/apagar/apagar_avalia_realizada?id=" . $row_vis_av['id'] . "' data-confirm='Tem certeza de que deseja excluir o item selecionado?'>Apagar</a>";
                              }
                              ?>
                           </div>
                        </div>
                     </div>
                  </div>
                  <br>

                  <table class="table table-hover table-sm table-bordered">
                     <tbody>
                        <tr>

                        <tr>
                           <th class="col-sm-3">id</th>
                           <td class="col-sm-9"><?php echo $row_vis_av['id']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">Andarº</th>
                           <td class="col-sm-9"><?php echo $row_vis_av['andar'] . "º"; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">Sala</th>
                           <td class="col-sm-9"><?php echo $row_vis_av['sala']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">Leito</th>
                           <td class="col-sm-9"><?php echo $row_vis_av['leito_num']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">Nome paciente</th>
                           <td class="col-sm-9"><?php echo $row_vis_av['nome_paciente']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 1";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>

                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['primeira']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 2";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['segunda']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 3";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['terceira']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 4";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['quarta']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 5";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['quinta']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 6";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['sexta']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 7";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['setima']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 8";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['oitava']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 9";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['nona']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">
                              <?php
                              //ID igual a questão!
                              $result_pergunta = "SELECT * FROM adms_pergunta WHERE id = 10";
                              $resultado_pergunta = mysqli_query($conn, $result_pergunta);
                              $row_pergunta = mysqli_fetch_assoc($resultado_pergunta);
                              echo $row_pergunta['descricao_pergunta'];
                              ?>
                           </th>
                           <td class="col-sm-9"><?php echo $row_vis_av['decima']; ?></td>
                        </tr>

                        <tr>
                           <th class="col-sm-3">Nota avaliação</th>
                           <td class="col-sm-9"><?php echo $row_vis_av['nota_avaliacao']; ?></td>
                        </tr>

                        <tr>
                           <th scope="row">Data do cadastro</th>
                           <td>
                              <?php echo date('d/m/Y - H:i:s', strtotime($row_vis_av['created'])); ?>
                              <b> Cadastro feito por: </b> <?php echo $row_vis_av['nome_cadastrador'] ?>
                           </td>
                           </td>
                        </tr>

                        <tr>
                           <th scope="row">Data da alteração</th>
                           <td><?php
                                 if (!empty($row_vis_av['modified'])) {
                                    echo date('d/m/Y - H:i:s', strtotime($row_vis_av['modified']));
                                 }
                                 ?> <b>Última edição feita por:</b> <?php echo $row_vis_av['editor'] ?>
                           </td>
                        </tr>
                        </tr>

                        </tr>
                     </tbody>
                  </table>
                  <?php include_once 'app/adms/include/print_tela.php'; ?>
               </div>

            </div>
            <?php
            include_once 'app/adms/include/rodape_lib.php';
            ?>

         </div>


      </body>
<?php
   } else {
      $_SESSION['msg'] = "<div class='alert alert-danger'>Registro não encontrado!!!!!!!!!!</div>";
      $url_destino = pg . '/listar/list_avaliacoes';
      header("Location: $url_destino");
   }
} else {
   $_SESSION['msg'] = "<div class='alert alert-danger'>Página não encontrada!</div>";
   $url_destino = pg . '/acesso/login';
   header("Location: $url_destino");
}
