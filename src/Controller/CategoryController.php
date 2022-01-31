<?php

namespace App\Controller;
use  App\Entity\Category;
use  App\Entity\Stuff;
use  App\Entity\Loan;
use App\Form\CategoryType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CategoryController extends AbstractController
{
   
    /**
     * @Route("/category/new", name="category_add")
     */
    public function add(ManagerRegistry $doctrine, Request $request): Response
    {
		$newCat= new Category;
		$form = $this->createForm(CategoryType::class, $newCat);
		$form->handleRequest($request);
		if ($form->isSubmitted() && $form->isValid()) {
		     dump($request);
            $newCat = $form->getData();
			$em=$doctrine->getManager();
			$em->persist($newCat);
			$em->flush();
            $this->addFlash(
                'notice',
                'Nouvelle categorie ajoutée à la liste !'
        );
	    return $this->redirectToRoute('product_add');
        } 
		return $this->render('category/add.html.twig', [          
		   'form' => $form->createView()
        ]);
    }
   
    /**
     * @Route("/category/{id}", name="category")
     */
    public function show(ManagerRegistry $doctrine, $id): Response
    {
		$category=$doctrine->getRepository(Category::class)->find($id);
		$stuffs=$doctrine->getRepository(Stuff::class)->findBy(array('category' => $category),
                                     array(),
                                     100,
                                     0);          
        return $this->render('category/index.html.twig', [
            'controller_name' => 'CategoryController',
			'category'=>$category,
			'stuffs'=>$stuffs,  
        ]);
    }
}
