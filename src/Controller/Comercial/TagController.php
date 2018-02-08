<?php
namespace App\Controller\Comercial;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use League\Fractal\Manager;
use League\Fractal\Resource\Collection;
use App\Service\Comercial\Tag;

class TagController extends Controller
{
    
    public function postTag(Request $objRequest)
    {
        try {
            $objComercialTag = $this->get('comercial.tag');
            if(!$objComercialTag instanceof Tag){
                return new JsonResponse(['message'=> 'Class "App\Service\Comercial\Tag not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
            
            $objTag = $objComercialTag->create($objRequest);
            
            return new JsonResponse(['id' => $objTag->getId()], Response::HTTP_OK);
        } catch (\RuntimeException $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
        } catch (\Exception $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
    
    public function getTag(int $id)
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
    
    public function getTags(Request $objRequest)
    {
        return new JsonResponse(['reports'=>['getTags']], Response::HTTP_OK);
    }
    
    public function deleteTag(int $id)
    {
        return new JsonResponse(['id'=>['deleteTag']], Response::HTTP_OK);
    }
    
    public function putTag(int $id)
    {
        return new JsonResponse(['id'=>['putTag']], Response::HTTP_OK);
    }
    
    public function patchTag(int $id)
    {
        return new JsonResponse(['id'=>['patchTag']], Response::HTTP_OK);
    }
}
