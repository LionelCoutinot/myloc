<?php

namespace App\Controller;


use App\Entity\Stuff;
use App\Entity\Loan;
use App\Entity\User;
use App\Entity\Category;
use App\Form\LoanStuffType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Controller\Admin\FileUploadType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StuffController extends AbstractController
{   
    
 /**
     * @Route("/stuff/{id}", name="stuff")
     */
    public function single(ManagerRegistry $doctrine, $id): Response
    {
	$stuff=$doctrine->getRepository(Stuff::class)->find($id);    
	$category=$stuff ->getCategory();
    $loan=$stuff->getLoans();
	    /* dump($Stuff); */
        return $this->render('stuff/index.html.twig', [
            'controller_name' => 'StuffController',
			'stuff'=>$stuff,
			'category' =>$category,
            'loans' => $loan,
        ]);
    }
   /**
     * @Route("/stuff/{id}/loan", name="loanstuff_add")
     */
public function add(ManagerRegistry $doctrine, Request $request, $id): Response
{
    /*$em =$doctrine->getManager();*/
    $newloan = new Loan;
    $stuff=$doctrine->getRepository(Stuff::class)->find($id);  
    $catPoints=$stuff ->getCategory() ->getCatPoints();
    $owner= $stuff->getOwner();
    $ownerPoints= $owner->getPoints();
    dump($catPoints);
    dump($ownerPoints);
   
    $form = $this->createForm(LoanStuffType::class, $newloan); 
    $form ->handleRequest($request);    
    if($form->isSubmitted()&& $form->isValid()){
      
        $newownerpoints= $owner->setPoints($catPoints+$ownerPoints);
        $newloan = $form->getData();
        $newloan->setStuff($stuff); // On ne veux pas faire apparaitre ses 2 champs donc on les inscrit en "dur" 
        $newloan->setBorrower($this->getUser());
        $em = $doctrine->getManager();
        $em->persist($newloan); // 
        $em->flush(); // C'est le moment ou l'on envoie l'objet en bdd
        $this->addFlash(
            'notice',
            'Réservation enregistrée !'
        );
        $this->redirectToRoute('profile');
    }
        
    return $this->renderForm('loan/add.html.twig', [
             'form' => $form, 
             'stuff'=> $stuff,
            
             
    ]);
 
}

}


  
   

