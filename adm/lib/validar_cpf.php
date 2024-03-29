<?php

function validaCPF($cpf)
{
    // Verifica se o número foi informado
    if (empty($cpf)) {
        return "O CPF é obrigatório";
    }

    // Elimina possível máscara
    $cpf = preg_replace('/[^0-9]/', '', $cpf);
    $cpf = str_pad($cpf, 11, '0', STR_PAD_LEFT);

    // Verifica se o número de dígitos informados é igual a 11
    if (strlen($cpf) != 11) {
        return "O CPF deve conter 11 dígitos";
    }
    // Verifica se nenhuma das sequências inválidas abaixo
    // foi digitada. Caso afirmativo, retorna falso
    else if (
        $cpf == '00000000000' ||
        $cpf == '11111111111' ||
        $cpf == '22222222222' ||
        $cpf == '33333333333' ||
        $cpf == '44444444444' ||
        $cpf == '55555555555' ||
        $cpf == '66666666666' ||
        $cpf == '77777777777' ||
        $cpf == '88888888888' ||
        $cpf == '99999999999'
    ) {
        return "CPF inválido";
        // Calcula os dígitos verificadores para verificar se o
        // CPF é válido
    } else {

        for ($t = 9; $t < 11; $t++) {

            for ($d = 0, $c = 0; $c < $t; $c++) {
                $d += $cpf[$c] * (($t + 1) - $c);
            }
            $d = ((10 * $d) % 11) % 10;
            if ($cpf[$c] != $d) {
                return "CPF inválido";
            }
        }

        return "CPF válido";
    }
}
