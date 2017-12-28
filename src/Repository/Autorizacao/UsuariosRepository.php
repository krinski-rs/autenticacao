<?php 

namespace App\Repository\Autorizacao;

use Doctrine\ORM\EntityRepository;
// use Doctrine\ORM\QueryBuilder;
use Symfony\Bridge\Doctrine\Security\User\UserLoaderInterface;

class UsuariosRepository extends EntityRepository implements UserLoaderInterface
{
    public function loadUserByUsername($username)
    {
        return $this->createQueryBuilder('u')
        ->where('u.username = :username')
        ->setParameter('username', $username)
        ->getQuery()
        ->getOneOrNullResult();
    }
// 	public function listChances($offset = 0, $limit = 10, $arrayWhere = array(), $orderBy = array('chan.id' => 'ASC'), $groupBy = array(), $column = 'chan.id')
// 	{
// 		$query = $this->createQueryBuilder("chan");
// 		$query->select($column);
// 		$this->buildJoins($query);
// 		if (count($arrayWhere) > 0) {
// 			$this->buildWhereQuery($arrayWhere, $query);	
// 		}
// 		if (is_array($groupBy) && count($groupBy)) {
// 			foreach ($groupBy as $group) {
// 				$query->addGroupBy($group);
// 			}
// 		}
// 		if (is_array($orderBy) && count($orderBy)) {
// 			foreach ($orderBy as $order => $sort) {
// 				$query->addOrderBy($order, $sort);
// 			}
// 		}
// 		if ($offset) {
// 			$query->setFirstResult($offset);
// 		}
// 		if ($limit) {
// 			$query->setMaxResults($limit);
// 		}
		
// 		return $query->getQuery()
// 					 ->getArrayResult();
// 	}

// 	public function countChances($arrayWhere = array(), $orderBy = array('chan.id' => 'ASC'), $groupBy = array('chan.id'))
// 	{
// 		$column = 'COUNT(DISTINCT chan.id) AS total';
// 		$query = $this->createQueryBuilder("chan");
// 		$query->select($column);
// 		$this->buildJoins($query);
// 		if (is_array($groupBy) && count($groupBy)) {
// 			foreach ($groupBy as $group) {
// 				$query->addGroupBy($group);
// 			}
// 		}
// 		if (is_array($orderBy) && count($orderBy)) {
// 			foreach ($orderBy as $order => $sort) {
// 				$query->addOrderBy($order, $sort);
// 			}
// 		}
// 		return $query->getQuery()
// 					 ->execute();
// 	}

// 	private function buildJoins(QueryBuilder $query)
// 	{
// 		return $query->innerJoin("chan.idProspect", "pros")
// 			  		 ->innerJoin("chan.idProduct", "serv")
// 			  		 ->innerJoin("pros.idWallet", "wall")
// 			  		 ->leftJoin("chan.followup", "foll")
// 			  		 ->leftJoin("chan.idFollowup", "lastFoll")
// 			  		 ->leftJoin("chan.idTag", "tag", 'WITH', 'tag.status = TRUE')
// 			  		 ->leftJoin("lastFoll.status", "chanstat")
// 			  		 ->leftJoin("chan.viable", "viab")
// 			  		 ->leftJoin("chan.chanceInactive", "chanInactive")
// 			  		 ->leftJoin("chan.lastProposal", "lastProposal")
// 			  		 ->leftJoin("chan.canalChance", "canachan")
// 			  		 ->leftJoin("canachan.canaCodigoid", "cana")
// 			  		 ->leftJoin("lastProposal.viable", "viableLastProposal");
// 	}
	

// 	private function buildWhereQuery(array $arrayWhere, QueryBuilder $query) 
// 	{
// 		foreach ($arrayWhere as $where) {
// 			if (count($where) < 3) {
// 				throw new \RuntimeException('Invalid argument');
// 			}
// 			$bind_parameter = 'a'.rand(0, 999999);
// 			if (strtoupper(trim($where[1])) == 'IS NOT') {
// 				$query->andWhere($where[0].' IS NOT '.$where[2]);
// 			} elseif (strtoupper(trim($where[1])) == 'IS') {
// 				$query->andWhere($where[0].' IS '.$where[2]);
// 			} elseif (strtoupper(trim($where[1])) == 'IN' && (count($where[2]) || count(explode(',', $where[2])))) {
// 				if (!is_array($where[2])) {
// 					$where[2] = explode(',', $where[2]);
// 				}
// 				$query->andWhere(trim($where[0]).' '.trim($where[1]).' (:'.$bind_parameter.')');
// 				$values = array_values($where[2]);
// 				if (is_integer($values[0])) {
// 					$query->setParameter(':'.$bind_parameter, array_values($where[2]), \Doctrine\DBAL\Connection::PARAM_INT_ARRAY);
// 				} else {
// 					$query->setParameter(':'.$bind_parameter, array_values($where[2]), \Doctrine\DBAL\Connection::PARAM_STR_ARRAY);
// 				}
// 			} elseif (strtoupper(trim($where[1])) == 'NOT IN' && (count($where[2]) || count(explode(',', $where[2])))) {
// 				if (!is_array($where[2])) {
// 					$where[2] = explode(',', $where[2]);
// 				}
// 				$query->andWhere(trim($where[0]).' '.trim($where[1]).' (:'.$bind_parameter.')');
// 				$values = array_values($where[2]);
// 				if (is_integer($values[0])) {
// 					$query->setParameter(':'.$bind_parameter, array_values($where[2]), \Doctrine\DBAL\Connection::PARAM_INT_ARRAY);
// 				} else {
// 					$query->setParameter(':'.$bind_parameter, array_values($where[2]), \Doctrine\DBAL\Connection::PARAM_STR_ARRAY);
// 				}
// 			} elseif (strtoupper(trim($where[1])) == 'OR' && count($where[2])) {
// 				$query->andWhere($where[0]);
// 				while ($whereOr = current($where[2])) {
// 					$query->setParameter(key($where[2]), $whereOr);
// 					next($where[2]);
// 				}
// 			} else {
// 				$query->andWhere($where[0].' '.$where[1].' :'.$bind_parameter);
// 				$query->setParameter($bind_parameter, $where[2]);
// 			}
// 		}
// 	}
}