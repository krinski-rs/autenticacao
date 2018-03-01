<?php
namespace App\Service\Autorizacao;

use Doctrine\Bundle\DoctrineBundle\Registry;
use Symfony\Component\HttpFoundation\Request;
use App\Service\Autorizacao\Usuario\Create;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoder;
use App\Entity\Autorizacao\Usuario as EntityUsuario;

class Usuario
{
    private $objEntityManager   = NULL;
    
    public function __construct(Registry $objRegistry)
    {
        $this->objEntityManager = $objRegistry->getManager('trouble');
    }
    
    public function create(Request $objRequest, UserPasswordEncoder $objUserPasswordEncoder)
    {
        try {
            $objAutorizacaoUsuarioCreate = new Create($this->objEntityManager);
            $objAutorizacaoUsuarioCreate->create($objRequest, $objUserPasswordEncoder);
            return $objAutorizacaoUsuarioCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
    public function addRegra(int $id, Request $objRequest)
    {
        try {
            
            $objUsuario = $this->objEntityManager->getRepository('App\Entity\Autorizacao\Usuario')->find($id);
            if(!($objUsuario instanceof EntityUsuario)){
                throw new \RuntimeException("Usuário não encontrado.");
            }
            $objAutorizacaoUsuarioRegraCreate = new \App\Service\Autorizacao\UsuarioRegra\Create($this->objEntityManager);
            $objAutorizacaoUsuarioRegraCreate->setUsuario($objUsuario);
            $objAutorizacaoUsuarioRegraCreate->create($objRequest);
            return $objAutorizacaoUsuarioRegraCreate->save();
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
}

