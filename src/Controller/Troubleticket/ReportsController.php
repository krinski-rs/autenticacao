<?php
namespace App\Controller\Troubleticket;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use League\Fractal\Manager;
use League\Fractal\Resource\Collection;
use App\Service\Troubleticke\Reports as ReportService;

class ReportsController extends Controller
{
    
    public function postReport(Request $objRequest)
    {
        $objTroubleTickeReports = $this->get('troubleticket.reports');
        if(!$objTroubleTickeReports instanceof ReportService){
            return new JsonResponse(['message'=> 'Class "App\Service\Troubleticke\Reports not found."'], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
        
        $objTroubleTickeReports->create($objRequest);
        
        return new JsonResponse(['id'=>['postReport']], Response::HTTP_OK);
    }
    
    public function getReport(int $idBA)
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
    
    public function getReports(Request $objRequest)
    {
        return new JsonResponse(['reports'=>['getReports']], Response::HTTP_OK);
    }
    
    public function deleteReport(int $idBA)
    {
        return new JsonResponse(['id'=>['deleteReport']], Response::HTTP_OK);
    }
    
    public function putReport(int $idBA)
    {
        return new JsonResponse(['id'=>['putReport']], Response::HTTP_OK);
    }
    
    public function patchReport(int $idBA)
    {
        return new JsonResponse(['id'=>['patchReport']], Response::HTTP_OK);
    }
}

