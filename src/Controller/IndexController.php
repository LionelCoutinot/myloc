<?php

namespace App\Controller;
use App\Entity\Stuff;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(ManagerRegistry $doctrine): Response
    {
		 $repository=$doctrine->getRepository(Stuff::class);
		 $stuffs=$repository->findAll();
		 
		
		 
        return $this->render('index/index.html.twig', [
            'stuffs'=>$stuffs,
        ]);
    }
}