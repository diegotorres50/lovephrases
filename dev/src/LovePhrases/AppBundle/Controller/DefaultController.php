<?php

namespace LovePhrases\AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('LovePhrasesAppBundle:Default:index.html.twig', array('name' => $name));
    }
}
