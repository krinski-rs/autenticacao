<?php
namespace App\Controller\Engenharia;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use League\Fractal\Manager;
use League\Fractal\Resource\Collection;
use App\Service\Engenharia\Point as PointService;

class PointController extends Controller
{
    
    public function postPoint(Request $objRequest)
    {
        try {
            $objEngenhariaPoint = $this->get('engenharia.point');
            if(!$objEngenhariaPoint instanceof PointService){
                return new JsonResponse(['message'=> 'Class "App\Service\Engenharia\Point not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            $objPoint = $objEngenhariaPoint->create($objRequest);
            
            return new JsonResponse(['id'=>$objPoint->getId()], Response::HTTP_OK);
        } catch (\RuntimeException $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
        } catch (\Exception $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
    
    public function getPoint(int $id)
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
    
    public function getPoints(Request $objRequest)
    {
        return new JsonResponse(['type'=>['getPoints']], Response::HTTP_OK);
    }
    
    public function deletePoint(int $id)
    {
        return new JsonResponse(['id'=>['deletePoint']], Response::HTTP_OK);
    }
    
    public function putPoint(int $id)
    {
        return new JsonResponse(['id'=>['putPoint']], Response::HTTP_OK);
    }
    
    public function patchPoint(int $id)
    {
        return new JsonResponse(['id'=>['patchPoint']], Response::HTTP_OK);
    }
}

