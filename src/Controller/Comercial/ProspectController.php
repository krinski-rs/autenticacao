<?php
namespace App\Controller\Comercial;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use League\Fractal\Manager;
use League\Fractal\Resource\Collection;
use App\Service\Comercial\Prospect;

class ProspectController extends Controller
{
    
    public function postProspect(Request $objRequest)
    {
        try {
            $objComercialProspect = $this->get('comercial.prospect');
            if(!$objComercialProspect instanceof Prospect){
                return new JsonResponse(['message'=> 'Class "App\Service\Comercial\Prospect not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
            
            $objProspect = $objComercialProspect->create($objRequest);
            
            return new JsonResponse(['id' => $objProspect->getId()], Response::HTTP_OK);
        } catch (\RuntimeException $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
        } catch (\Exception $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
    
    public function getProspect(int $id)
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
    
    public function getProspects(Request $objRequest)
    {
        return new JsonResponse(['reports'=>['getProspects']], Response::HTTP_OK);
    }
    
    public function deleteProspect(int $id)
    {
        return new JsonResponse(['id'=>['deleteProspect']], Response::HTTP_OK);
    }
    
    public function putProspect(int $id)
    {
        return new JsonResponse(['id'=>['putProspect']], Response::HTTP_OK);
    }
    
    public function patchProspect(int $id)
    {
        return new JsonResponse(['id'=>['patchProspect']], Response::HTTP_OK);
    }
}
