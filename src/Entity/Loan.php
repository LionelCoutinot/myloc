<?php

namespace App\Entity;

use App\Repository\LoanRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use ApiPlatform\Core\Annotation\ApiResource;

/**
 * @ORM\Entity(repositoryClass=LoanRepository::class)
 * @ApiResource()
 */
class Loan
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=stuff::class, inversedBy="loans")
     * @ORM\JoinColumn(nullable=false)
     */
    private $stuff;

    /**
     * @ORM\Column(type="date")
     * @Assert\GreaterThan("today")
     */
    protected $start;

    /**
     * @ORM\Column(type="date")
     *  @Assert\GreaterThan("+1 day")
     */
    protected $end;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="loans")
     * @ORM\JoinColumn(nullable=false)
     */
    private $borrower;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStuff(): ?stuff
    {
        return $this->stuff;
    }

    public function setStuff(?stuff $stuff): self
    {
        $this->stuff = $stuff;

        return $this;
    }

    public function getStart(): ?\DateTimeInterface
    {
        return $this->start;
    }

    public function setStart(\DateTimeInterface $start): self
    {
        $this->start = $start;

        return $this;
    }

    public function getEnd(): ?\DateTimeInterface
    {
        return $this->end;
    }

    public function setEnd(\DateTimeInterface $end): self
    {
        $this->end = $end;

        return $this;
    }

    public function getBorrower(): ?User
    {
        return $this->borrower;
    }

    public function setBorrower(?User $borrower): self
    {
        $this->borrower = $borrower;

        return $this;
    }
}
