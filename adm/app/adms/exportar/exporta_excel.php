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

                $resul_name_file = "SELECT * FROM adms_leitos_questoes";
                $resul_name_file = mysqli_query($conn, $resul_name_file);
                $row_name_file = mysqli_fetch_assoc($resul_name_file);
                $arquivo = 'Avaliações - doc.xls';


                $html = '';
                $html .= '<table border="3">';
                $html .= '<tr>';
                $html .= '<td><b>Andarº</b></td>';
                $html .= '<td><b>Sala</b></td>';
                $html .= '<td><b>Leito</b></td>';
                $html .= '<td><b>Paciente</b></td>';
                $html .= '<td><b>Recepção</b></td>';
                $html .= '<td><b>Organização e limpeza</b></td>';
                $html .= '<td><b>Estrutura física (Acomodação, iluminação, climatização)</b></td>';
                $html .= '<td><b>Equipe Médica</b></td>';
                $html .= '<td><b> Equipe de Enfermagem</b></td>';
                $html .= '<td><b>Equipe Multidisciplinar (assistente social, fisioterapia, psicólogo, nutricionista, fonoaudiólogo, dentista, farmacêutico)</b></td>';
                $html .= '<td><b>Assistência Farmacêutica</b></td>';
                $html .= '<td><b>Equipe de coleta (exame de laboratório)</b></td>';
                $html .= '<td><b>Realização de outros exames</b></td>';
                $html .= '<td><b>Qualidade da alimentação</b></td>';
                $html .= '<td><b>Nota final</b></td>';
                $html .= '<td><b>Data - Criação</b></td>';
                $html .= '<td><b>Cadastrador</b></td>';
                $html .= '</tr>';



                $resul_lista_pc = "SELECT pacientes. *, user_paciente.nome_paciente,                
                numero_andar.num_andar AS andar,
                numero_sala.sala_num AS sala,
                numero_leito.leito_num AS leito,
                resposta1.descricao_resposta respondido1,
                resposta1.descricao_resposta respondido2,
                resposta1.descricao_resposta respondido3,
                resposta1.descricao_resposta respondido4,
                resposta1.descricao_resposta respondido5,
                resposta1.descricao_resposta respondido6,
                resposta1.descricao_resposta respondido7,
                resposta1.descricao_resposta respondido8,
                resposta1.descricao_resposta respondido9,
                resposta1.descricao_resposta respondido10,
                cadastrado_usuario.nome nome_usuario
                FROM adms_leitos_questoes pacientes                
                LEFT JOIN adms_leitos numero_andar ON numero_andar.id=pacientes.adms_leito_id
                LEFT JOIN adms_leitos numero_sala ON numero_sala.id=pacientes.adms_leito_id
                LEFT JOIN adms_leitos numero_leito ON numero_leito.id=pacientes.adms_leito_id
                LEFT JOIN adms_paciente user_paciente ON user_paciente.id=pacientes.adms_paciente_id
                LEFT JOIN adms_resposta resposta1 ON resposta1.id=pacientes.questao1
                LEFT JOIN adms_usuarios cadastrado_usuario ON cadastrado_usuario.id=pacientes.cadastrador";
                $resultado_lista_pc = mysqli_query($conn, $resul_lista_pc);
                while ($row_lista_pc = mysqli_fetch_assoc($resultado_lista_pc)) {

                    $html .= '<tr class="text-center">';
                    $html .= '<td>' . $row_lista_pc["andar"] . "º" . '</td>';
                    $html .= '<td>' . $row_lista_pc["sala"] . '</td>';
                    $html .= '<td>' . $row_lista_pc["leito"] . '</td>';
                    $html .= '<td>' . $row_lista_pc["nome_paciente"] . '</td>';
                    $html .= '<td>' . $row_lista_pc["respondido1"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido2"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido3"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido4"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido5"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido6"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido7"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido8"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido9"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["respondido10"] . ' </td>';
                    $html .= '<td>' . $row_lista_pc["nota_avaliacao"] . '</td>';
                    $html .= '<td>' . $row_lista_pc["created"] . '</td>';
                    $html .= '<td>' . $row_lista_pc["nome_usuario"] . '</td>';
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
                <br><br>
            </div>
        </div>
    </div>
    </div>
    <?php
    include_once 'app/adms/include/rodape_lib.php';
    ?>
</body>