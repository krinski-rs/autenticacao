<?php
namespace App\Controller\Home;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
// use Symfony\Component\HttpFoundation\Request;
use League\Fractal\Manager;
use League\Fractal\Resource\Collection;
// use App\Service\Comercial\Chance;

class IndexController extends Controller
{
    
//     public function postChance(Request $objRequest)
//     {
//         try {
//             $objComercialChance = $this->get('comercial.chance');
//             if(!$objComercialChance instanceof Chance){
//                 return new JsonResponse(['message'=> 'Class "App\Service\Comercial\Chance not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
//             }
            
//             $objChance = $objComercialChance->create($objRequest);
            
//             return new JsonResponse(['id' => $objChance->getId()], Response::HTTP_OK);
//         } catch (\RuntimeException $e) {
//             return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
//         } catch (\Exception $e) {
//             return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
//         }
//     }
    
    public function getIndex()
    {
        $this->render('hello/index.html.twig');
    }
    
//     public function getChances(Request $objRequest)
//     {
//         return new JsonResponse(['reports'=>['getChances']], Response::HTTP_NOT_IMPLEMENTED);
//     }
    
//     public function deleteChance(int $id)
//     {
//         return new JsonResponse(['id'=>['deleteChance']], Response::HTTP_NOT_IMPLEMENTED);
//     }
    
//     /*
//      * ALTERAÇÃO COMPLETA
//      */
//     public function putChance(int $id, Request $objRequest)
//     {
//         return new JsonResponse(['id'=>['putChance']], Response::HTTP_OK);
//     }
    
//     public function putChanceLost(int $id, Request $objRequest)
//     {
//         try {
//             $objComercialChance = $this->get('comercial.chance');
//             if(!$objComercialChance instanceof Chance){
//                 return new JsonResponse(['message'=> 'Class "App\Service\Comercial\Chance not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
//             }
            
//             $objComercialChance->lost($id, $objRequest);
            
//             return new JsonResponse(['id' => 'lost'], Response::HTTP_OK);
//         } catch (\RuntimeException $e) {
//             return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
//         } catch (\Exception $e) {
//             return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
//         }
//     }
    
//     public function putChanceInactive(int $id, Request $objRequest)
//     {
//         try {
//             $objComercialChance = $this->get('comercial.chance');
//             if(!$objComercialChance instanceof Chance){
//                 return new JsonResponse(['message'=> 'Class "App\Service\Comercial\Chance not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
//             }
//             echo "\nputChanceInactive";
//             $objComercialChance->inactive($id, $objRequest);
            
//             return new JsonResponse(['id' => 'inactive'], Response::HTTP_OK);
//         } catch (\RuntimeException $e) {
//             return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_PRECONDITION_FAILED);
//         } catch (\Exception $e) {
//             return new JsonResponse(['mensagem'=>$e->getMessage()], Response::HTTP_INTERNAL_SERVER_ERROR);
//         }
//     }
    
//     /*
//      * ALTERAÇÃO PARCIAL
//      */
//     public function patchChance(int $id, Request $objRequest)
//     {
//         return new JsonResponse(['id'=>['patchChance']], Response::HTTP_NOT_IMPLEMENTED);
//     }
}
