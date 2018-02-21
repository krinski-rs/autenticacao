<?php
namespace App\Service\Autorizacao\Usuario;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use Doctrine\ORM\EntityManager;
use App\Entity\Autorizacao\Usuario;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoder;

class Create
{
    private $objEntityManager   = NULL;
    private $objUsuario           = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function create(Request $objRequest, UserPasswordEncoder $objUserPasswordEncoder)
    {
        try {
            $this->validate($objRequest);
            $this->objUsuario = new Usuario();
            $this->objUsuario->setAtivo($objRequest->get('ativo', NULL));
            $this->objUsuario->setDataCadastro(new \DateTime());
            $this->objUsuario->setNome(trim($objRequest->get('nome', NULL)));
            $this->objUsuario->setSalt(uniqid(mt_rand()));
            
            $password = $objUserPasswordEncoder->encodePassword($this->objUsuario, trim($objRequest->get('password', NULL)).$this->objUsuario->getSalt());
            $this->objUsuario->setPassword($password);
            
            $this->objUsuario->setUsername(trim($objRequest->get('username', NULL)));
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
    }
    
    private function validate(Request $objRequest)
    {
        $objNotNull = new Assert\NotNull();
        $objNotNull->message = "Esse valor não deve ser nulo.";
        $objNotBlank = new Assert\NotBlank();
        $objNotBlank->message = "Esse valor não deve estar em branco.";
        
        $objLength = new Assert\Length(
            [
                "min" => 2,
                "max" => 100,
                "minMessage" => "O campo deve ter pelo menos {{ limit }} caracteres.",
                "maxMessage" => "O campo não pode ser maior do que {{ limit }} caracteres."
            ]
        );
        
        $objType = new Assert\Type(
            [
                "type" => 'bool',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'ativo' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objType
                        ]
                        ),
                    'nome' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLength
                        ]
                    ),
                    'password' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLength
                        ]
                    ),
                    'username' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objLength
                        ]
                    )
                ]
            ]
        );

        $data = [
            'nome'  => trim($objRequest->get('nome', NULL)),
            'ativo'  => $objRequest->get('ativo', NULL),
            'password'  => trim($objRequest->get('password', NULL)),
            'username'  => trim($objRequest->get('username', NULL))
        ];
        
        $objConstraintViolationList = $objRecursiveValidator->validate($data, $objCollection);
        
        if($objConstraintViolationList->count()){
            $objArrayIterator = $objConstraintViolationList->getIterator();
            $objArrayIterator->rewind();
            $mensagem = "";
            while($objArrayIterator->valid()){
                if($objArrayIterator->key()){
                    $mensagem.= "\n";
                }
                $mensagem.= $objArrayIterator->current()->getPropertyPath().': '.$objArrayIterator->current()->getMessage();
                $objArrayIterator->next();
            }
            throw new \RuntimeException($mensagem);
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objUsuario);
        $this->objEntityManager->flush();
        return $this->objUsuario;
    }
}

