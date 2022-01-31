<?php

namespace App\Controller\Admin;

use App\Entity\Stuff;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Form\Type\FileUploadType;

class StuffCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Stuff::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name'),
            TextEditorField::new('description'),
            ImageField::new('pictureFilename')
            ->setBasePath('img/')
            ->setUploadDir('public/img/')
            ->setFormType(FileUploadType::class)
            ->setUploadedFileNamePattern('[randomhash].[extension]')
            ->setRequired(false),
            AssociationField::new('owner'),
            AssociationField::new('category'),



        ];
    }
    
}
