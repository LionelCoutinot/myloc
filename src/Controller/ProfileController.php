<?php

namespace App\Controller;
use App\Entity\Stuff;
use App\Form\StuffType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;

class ProfileController extends AbstractController
{
     /**
     * @Route("/profile/new", name="product_add")
     */
    public function add(ManagerRegistry $doctrine, Request $request, SluggerInterface $slugger): Response
    {
		$newStuff= new Stuff;
		$form = $this->createForm(StuffType::class, $newStuff);
		$form->handleRequest($request);
		if ($form->isSubmitted() && $form->isValid()) {
			 $pictureFile = $form->get('pictureFile')->getData();
		    // this condition is needed because the 'brochure' field is not required
            // so the PDF file must be processed only when a file is uploaded
            if ($pictureFile) {
                $originalFilename = pathinfo($pictureFile->getClientOriginalName(), PATHINFO_FILENAME);
                // this is needed to safely include the file name as part of the URL
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$pictureFile->guessExtension();

                // Move the file to the directory where brochures are stored
                try {
                    $pictureFile->move(
                        $this->getParameter('pictures_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }

                // updates the 'pictureFilename' property to store the PDF file name
                // instead of its contents
                $newStuff->setPictureFilename($newFilename);
            }

            $newProd = $form->getData();
			$em2=$doctrine->getManager();
			$em2->persist($newProd);
			$em2->flush();
			$this->addFlash(
                'notice',
                'Nouvel outil ajouté à la liste !'
        );
	    return $this->redirectToRoute('profile');
			
        }
        return $this->render('profile/add.html.twig', [          
		   'form' => $form->createView()
			 
        ]);
    }

    /**
     * @Route("/profile", name="profile")
     */
    public function index(): Response
    {
        $user = $this->getUser();	    
      //  $stuffs=$user ->getStuffs();
      //  dump($user);  
        return $this->render('profile/index.html.twig', [
            'user'=> $user,
        //    'stuffs'=> $stuffs,
        ]);
    }
}
