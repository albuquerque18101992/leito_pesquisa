|<?php

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



    //Segurança para não consiguir acessa páginas indo direto na URL .
    if (!isset($seg)) {
        exit;
    }
    include_once 'app/adms/include/head.php';
    ?>

<body>
    <div class="d-flex">
        <div class="content p-1">
            <div class="list-group-item">
                <?php

                


                $resul_name_file = "SELECT * FROM adms_avaliacao_feita";
                $resulado_name_file = mysqli_query($conn, $resul_name_file);
                $row_name_file = mysqli_fetch_assoc($resulado_name_file);
                $arquivo = 'avaliacoes - doc.xls';

                $html = '';
                $html .= '<table border="2">';
                $html .= '<tr>';
                $html .= '<td colspan="7">Avaliações</tr>';
                $html .= '</tr>';



                $html .= '<td><b> Paciente </b></td>';
                //Perguntas
                $result_perguntas = "SELECT * FROM adms_pergunta";
                $resultado_perguntas = mysqli_query($conn, $result_perguntas);
                while ($row_perguntas = mysqli_fetch_assoc($resultado_perguntas)) {
                    $html .= '<td><b> ' . $row_perguntas['descricao_pergunta'] . '</b></td>';
                }
                $html .= '<td><b> Nota aplicada </b></td>';
                $html .= '<td><b> data - criação </b></td>';
                $html .= '<td><b> Cadastrador </b></td>';


                $result_resposta = "SELECT * FROM adms_resposta";
                $resultado_resposta = mysqli_query($conn, $resultado_resposta);
                $row_respota = mysqli_fetch_assoc($resultado_resposta);

                $row_respota['id'] = $_SESSION['resposta_id_1'];




                $resul_lista_cel = "SELECT * FROM adms_avaliacao_feita";
                $resultado_lista_cel = mysqli_query($conn, $resul_lista_cel);
                while ($row_lista_cel = mysqli_fetch_assoc($resultado_lista_cel)) {
                    $html .= '<tr>';
                    $html .= '<td>' . $row_lista_cel["adms_paciente_id"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta1"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta2"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta3"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta4"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta5"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta6"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta7"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta8"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta9"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta10"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["pergunta11"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["created"] . '</td>';
                    $html .= '<td>' . $row_lista_cel["cadastrador"] . '</td>';
                    $html .= '</tr>';
                }

                header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
                header("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
                header("Cache-Control: no-cache, must-revalidate");
                header("Pragma: no-cache");
                header("Content-type: application/x-msexcel");
                header("Content-Disposition: attachment; filename=\"{$arquivo}\"");
                header("Content-Description: PHP Generated Data");


                // Envia o conteúdo do arquivo
                echo $html;
                exit;
                ?>
            </div>
        </div>
    </div>
    </div>
    <?php
    include_once 'app/adms/include/rodape_lib.php';
    ?>
</body>