<?php
namespace App\Service\Autorizacao\UsuarioRegra;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use Doctrine\ORM\EntityManager;
use App\Entity\Autorizacao\UsuarioRegra;
use App\Entity\Autorizacao\Usuario;
use App\Entity\Autorizacao\Regra;

class Create
{
    private $objEntityManager   = NULL;
    private $objUsuarioRegra    = NULL;
    private $objUsuario         = NULL;
    private $objRegra           = NULL;
    
    public function __construct(EntityManager $objEntityManager)
    {
        $this->objEntityManager = $objEntityManager;
    }
    
    public function setUsuario(Usuario $objUsuario)
    {
        $this->objUsuario = $objUsuario;
        return $this;
    }
    
    public function setRegra(Regra $objRegra)
    {
        $this->objRegra = $objRegra;
        return $this;
    }
    
    public function getUsuarioRegra()
    {
        return $this->objUsuarioRegra;
    }
    
    public function create(Request $objRequest)
    {
        try {
            $this->validate($objRequest);
            
            $this->objUsuarioRegra = new UsuarioRegra();
            $this->objUsuarioRegra->setRegra($this->objRegra);
            $this->objUsuarioRegra->setUsuario($this->objUsuario);
            $this->objUsuarioRegra->setValor($objRequest->get('valor', NULL));
        } catch (\RuntimeException $e){
            throw $e;
        } catch (\Exception $e){
            throw $e;
        }
        return $this;
    }
    
    private function validate(Request $objRequest)
    {
        ini_set("display_errors", "on");
//         include('functions.php');
        $snmpwalk_rs=snmpwalk('189.45.61.60	', "stechtelecom","mib-2.47.1.2.1.1.2");
        $rows=count($snmpwalk_rs);
        
        $x=0;
        
        while ($snmpwalk_rs && $x != $rows){
            $vlanid_rs=split('n',$snmpwalk_rs[$x]);
            $vlanid_rs=split('"',$vlanid_rs[1]);
            $vlanid_rsfinal[$x]=$vlanid_rs[0];
            $x++;
        }
        sort($vlanid_rsfinal);
        $rows=count($vlanid_rsfinal);
        
        for($x=0;$x<=$rows;$x++){
            echo $vlanid_rsfinal[$x];
            echo '</br>';
            //$flag_vlan_existe=0;
            //dbconnect('fast_airsw');
            //$sql_qry=mysql_query('SELECT DISTINCT idvlan, idportavlan FROM portasvlan WHERE idswitch = '.$switchid);
            //while ( $sql_rs=mysql_fetch_array($sql_qry)){
            //	$flag_vlan_nao_existe=0;
                //	if ($vlanid_rsfinal[$x] == $sql_rs['idvlan']) $flag_vlan_existe=1;
                //	for ($count=0;$count<=$rows;$count++){
                //		if ($sql_rs['idvlan'] == $vlanid_rsfinal[$count]) $flag_vlan_nao_existe=1;
                //	}
                //	if ( $flag_vlan_nao_existe==0 ) mysql_query('DELETE FROM portasvlan WHERE idportavlan = "'.$sql_rs['idportavlan'].'"') or die (mysql_error());
                //	}
                //if ( $flag_vlan_existe==0 ) mysql_query('INSERT INTO portasvlan(idvlan,idswitch,nome) VALUES('.$vlanid_rs[1].','.$switchid.',"VLAN_'.$vlanid_rs[1].'")') or die (mysql_error());
                $x++;
            }
        exit("\nTeste\n");
        $objNotNull = new Assert\NotNull();
        $objNotNull->message = "Esse valor não deve ser nulo.";
        $objNotBlank = new Assert\NotBlank();
        $objNotBlank->message = "Esse valor não deve estar em branco.";
        
        $objRange = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 99999999,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
        $objRangeValor = new Assert\Range(
            [
                "min" => 1,
                "minMessage" => "Esse valor deve ser '{{ limit }}' ou mais.",
                "max" => 15,
                "maxMessage" => "Esse valor deve ser '{{ limit }}' ou menor."
            ]
        );
        
        $objType = new Assert\Type(
            [
                "type" => 'numeric',
                "message" => "O valor '{{ value }}' não é válido '{{ type }}'."
            ]
        );
        
        $objRecursiveValidator = Validation::createValidatorBuilder()->getValidator();
        
        $objCollection = new Assert\Collection(
            [
                'fields' => [
                    'idUsuario' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'idRegra' => new Assert\Optional( [
                            $objRange
                        ]
                    ),
                    'valor' => new Assert\Required( [
                            $objNotNull,
                            $objNotBlank,
                            $objRangeValor
                        ]
                    )
                ]
            ]
        );

        $data = [
            'idUsuario'  => $objRequest->get('idUsuario', NULL),
            'idRegra'  => $objRequest->get('idRegra', NULL),
            'valor'  => $objRequest->get('valor', NULL)
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
        
        if(!($this->objUsuario instanceof Usuario)){
            $this->objUsuario = $this->objEntityManager->getRepository('App\Entity\Autorizacao\Usuario')->find($objRequest->get('idUsuario', NULL));
            if(!($this->objUsuario instanceof Usuario)){
                throw new \RuntimeException("Usuário não encontrado.");
            }
        }
        
        if(!($this->objRegra instanceof Regra)){
            $this->objRegra = $this->objEntityManager->getRepository('App\Entity\Autorizacao\Regra')->find($objRequest->get('idRegra', NULL));
            if(!($this->objRegra instanceof Regra)){
                throw new \RuntimeException("Regra não encontrada.");
            }
        }
    }
    
    public function save()
    {
        $this->objEntityManager->persist($this->objUsuarioRegra);
        $this->objEntityManager->flush();
        return $this->objUsuarioRegra;
    }
}

