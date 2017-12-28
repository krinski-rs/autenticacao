<?php
namespace App\Util\Fractal;

use League\Fractal\Serializer\ArraySerializer;

class CoreArraySerializer extends ArraySerializer
{
    private $total;
    private $totalPaginas;
    
    public function __construct(int $total = 0, int $totalPaginas = 0)
    {
        $this->totalPaginas = $totalPaginas;
        $this->total         = $total;
    }
    
    public function collection($resourceKey, array $data)
    {
        if($resourceKey) {
            $dados = [ $resourceKey => $data ];
            if( ($resourceKey == 'items') && ($this->total !== 0) ) {
                $dados['total'] = $this->total;
                $dados['totalPaginas'] = $this->totalPaginas;
            }
            return $dados;
        } else {
            return $data;
        }
    }
}
