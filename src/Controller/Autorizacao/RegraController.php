<?php
namespace App\Controller\Autorizacao;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use League\Fractal\Manager;
use League\Fractal\Resource\Collection;
use App\Service\Autorizacao\Regra as RegraService;

class RegraController extends Controller
{
    
    public function postRegra(Request $objRequest)
    {
        try {
            $objAutorizacaoRegra = $this->get('autorizacao.regra');
            if(!$objAutorizacaoRegra instanceof RegraService){
                return new JsonResponse(['message'=> 'Class "App\Service\Autorizacao\Regra not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
            
            $objRegra = $objAutorizacaoRegra->create($objRequest);
            
            return new JsonResponse(['id'=>$objRegra->getId()], Response::HTTP_OK);
        } catch (\RuntimeException $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
        } catch (\Exception $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
    
    public function getRegra(int $id)
    {
        $fractal = new Manager();
        
        // Get data from some sort of source
        // Most PHP extensions for SQL engines return everything as a string, historically
        // for performance reasons. We will fix this later, but this array represents that.
        $books = [
            [
                'id' => '1',
                'title' => 'Hogfather',
                'yr' => '1998',
                'author_name' => 'Philip K Dick',
                'author_email' => 'philip@example.org',
            ],
            [
                'id' => '2',
                'title' => 'Game Of Kill Everyone',
                'yr' => '2014',
                'author_name' => 'George R. R. Satan',
                'author_email' => 'george@example.org',
            ]
        ];
        
        $resource = new Collection($books, function(array $book) {
            return [
                'id'      => (int) $book['id'],
                'title'   => $book['title'],
                'year'    => (int) $book['yr'],
                'author'  => [
                    'name'  => $book['author_name'],
                    'email' => $book['author_email'],
                ],
                'links'   => [
                    [
                        'rel' => 'self',
                        'uri' => '/books/'.$book['id'],
                    ]
                ]
            ];
        });
        
        $array = $fractal->createData($resource)->toArray();
        return new JsonResponse($array, Response::HTTP_OK);
    }
    
    public function getRegras(Request $objRequest)
    {
        return new JsonResponse(['regra'=>['getRegras']], Response::HTTP_OK);
    }
    
    public function deleteRegra(int $id)
    {
        return new JsonResponse(['id'=>['deleteRegra']], Response::HTTP_OK);
    }
    
    public function putRegra(int $id)
    {
        return new JsonResponse(['id'=>['putRegra']], Response::HTTP_OK);
    }
    
    public function patchRegra(int $id)
    {
        return new JsonResponse(['id'=>['patchRegra']], Response::HTTP_OK);
    }
}

