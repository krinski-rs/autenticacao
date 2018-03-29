<?php
namespace App\Controller\Redes;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use League\Fractal\Manager;
use League\Fractal\Resource\Collection;
use App\Service\Redes\Switches as SwitchesService;

class SwitchController extends Controller
{
    
    public function postSwitch(Request $objRequest)
    {
        try {
            $objRedesSwitch = $this->get('redes.switch');
            if(!$objRedesSwitch instanceof SwitchesService){
                return new JsonResponse(['message'=> 'Class "App\Service\Redes\Switches not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
            
            $objSwitches = $objRedesSwitch->create($objRequest);
            
            return new JsonResponse(['id'=>$objSwitches->getId()], Response::HTTP_OK);
        } catch (\RuntimeException $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
        } catch (\Exception $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
    
    public function postSwitchPorta(int $id, Request $objRequest)
    {
        try {
            $objRedesSwitch = $this->get('redes.switch');
            if(!$objRedesSwitch instanceof SwitchesService){
                return new JsonResponse(['message'=> 'Class "App\Service\Redes\Switches not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
            
            $objPorta = $objRedesSwitch->postSwitchPorta($id, $objRequest);
            return new JsonResponse(['id'=>$objPorta->getId()], Response::HTTP_OK);
        } catch (\RuntimeException $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
        } catch (\Exception $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
    
    public function getSwitch(int $id)
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
    
    public function getSwitchs(Request $objRequest)
    {        
        return new JsonResponse(['type'=>['getSwitchs']], Response::HTTP_OK);
    }
    
    public function deleteSwitch(int $id)
    {
        return new JsonResponse(['id'=>['deleteSwitch']], Response::HTTP_OK);
    }
    
    public function putSwitch(int $id)
    {
        return new JsonResponse(['id'=>['putSwitch']], Response::HTTP_OK);
    }
    
    public function patchSwitch(int $id)
    {
        return new JsonResponse(['id'=>['patchSwitch']], Response::HTTP_OK);
    }
    
    public function status(int $id)
    {
        try {
            $objRedesSwitch = $this->get('redes.switch');
            if(!$objRedesSwitch instanceof SwitchesService){
                return new JsonResponse(['message'=> 'Class "App\Service\Redes\Switches not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
            
            $arrayStatus = $objRedesSwitch->status($id);
            return new JsonResponse($arrayStatus, Response::HTTP_OK);
        } catch (\RuntimeException $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
        } catch (\Exception $e) {
            return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
    
    public function putSwitchPorta(int $id)
    {
        $objRedesSwitch = $this->get('redes.switch');
        if(!$objRedesSwitch instanceof SwitchesService){
            return new JsonResponse(['message'=> 'Class "App\Service\Redes\Switches not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
        
        $arrayStatus = $objRedesSwitch->updateSwitchPorta($id);
        
        return new JsonResponse($arrayStatus, Response::HTTP_OK);
    }
}

