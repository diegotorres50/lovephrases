<?php

namespace LovePhrases\AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route; //@diegotorres50: necesario para las anotaciones de rutas 
use Symfony\Component\HttpFoundation\Response; //@diegotorres50: para el response hello world
use Symfony\Component\HttpFoundation\Request; //@diegotorres50: necesario para validar el login con sesiones

class DefaultController extends Controller
{
	 /**
     * @Route("/", name="lovephrases_default_homepage") 
     */
    public function indexAction(Request $request)
    {

        $path = 'bundles/lovephrasesapp/content/home.json';
		$content = file_get_contents($path);
		$json = json_decode($content, true);

		//var_dump($json); exit;

        return $this->render('LovePhrasesAppBundle:Default:index.html.twig', array('data' => $json));
    }
}