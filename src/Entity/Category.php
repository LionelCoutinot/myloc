<?php

namespace App\Entity;

use App\Repository\CategoryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;


/**
 * @ORM\Entity(repositoryClass=CategoryRepository::class)
 *   @ApiResource()  
 */
class Category
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="integer")
     */
    private $catPoints;

    /**
     * @ORM\OneToMany(targetEntity=Stuff::class, mappedBy="category")
     */
    private $stuffs;

    public function __construct()
    {
        $this->stuffs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getCatPoints(): ?int
    {
        return $this->catPoints;
    }

    public function setCatPoints(int $catPoints): self
    {
        $this->catPoints = $catPoints;

        return $this;
    }

    /**
     * @return Collection|Stuff[]
     */
    public function getStuffs(): Collection
    {
        return $this->stuffs;
    }

    public function addStuff(Stuff $stuff): self
    {
        if (!$this->stuffs->contains($stuff)) {
            $this->stuffs[] = $stuff;
            $stuff->setCategory($this);
        }

        return $this;
    }

    public function removeStuff(Stuff $stuff): self
    {
        if ($this->stuffs->removeElement($stuff)) {
            // set the owning side to null (unless already changed)
            if ($stuff->getCategory() === $this) {
                $stuff->setCategory(null);
            }
        }

        return $this;
    }
    public function __toString(){
		return $this -> name;
	}
}
