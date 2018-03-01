<?php
namespace App\Util\Traits\Regra;

trait Permissao
{
    /*
     * Leitura 	1 	($valor & 1) == 1
     * Inserir 	2 	($valor & 2) == 2
     * Editar 	4 	($valor & 4) == 4
     * Apagar 	8 	($valor & 8) == 8
     */
    public function getNivelPermissao(int $valor)
    {
        $nivel = [];
        if (($valor & 1) === 1)
            $nivel[] = '_VIEW';
        
        if (($valor & 2) === 2)
            $nivel[] = '_INSERT';
        
        if (($valor & 4) === 4)
            $nivel[] = '_EDIT';
        
        if (($valor & 8) === 8)
            $nivel[] = '_DELETE';
        
        return $nivel;
    }
    
    public function hasPermissao(array $arrayUserRoles, array $arrayRoles)
    {
        return (count(array_intersect($arrayUserRoles, $arrayRoles)) ? true : false);
    }
}
