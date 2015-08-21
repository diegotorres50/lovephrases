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
    
    /**
     * @Route(
     *     "/{section}",
     *     requirements={
     *         "section"= "for-making-love|for-boyfriend|for-broken-heart|for-her|for-him"
     *     },
     *     name= "lovephrases_default_section"
     * )
     */    
    public function sectionAction(Request $request, $section)
    {
        $path = 'bundles/lovephrasesapp/content/love-phrases/' . $section . '/home.json';
        $content = file_get_contents($path);
        $json = json_decode($content, true);

        //var_dump($json); exit;

        return $this->render('LovePhrasesAppBundle:Default:section.html.twig', array('data' => $json));
    }

     /**
     * @Route("/show-more-phrases/{tag}/{offset}/{row_count}/{position}", requirements={"offset" = "\d+", "row_count" = "\d+"}, defaults={"offset" = 0, "row_count" = 5, "position" = ""}, name="lovephrases_loadmorearticles") 
     */
    public function loadmorearticlesAction(Request $request, $tag, $offset, $row_count, $position)
    {

        $domain = $_SERVER['HTTP_HOST'];
        $prefix = 'http://';

        $path = $prefix . $domain . '/content/tags/'. $tag .'/' . $offset . '/' . $row_count . '/Secundary.json';

        //@diegotorres50: los json al vuelo no se pueden tratar con file_get_contents(), en vez de eso se debe usar curl de php cuando no hay archivo fisico

        //$content = file_get_contents($path);
        //$json = json_decode($content, true);

        // Crea un nuevo recurso cURL
        $ch = curl_init();

        // Establece la URL y otras opciones apropiadas
        curl_setopt($ch, CURLOPT_URL, $path);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //Esto evita que la salida se transfiera directamente al navegador y asi controlar todo en una variable posteriortemente

        // Captura la URL y la envía al navegador
        $_json = curl_exec($ch);

        $json = json_decode($_json, true);

        // Cierrar el recurso cURLy libera recursos del sistema
        curl_close($ch);

        //var_dump($json); exit;

        return $this->render('LovePhrasesAppBundle:Common:morearticles.html.twig', array('data' => $json));
    }

    /**
     * @Route(
     *     "/tags/{tag}",
     *     name= "lovephrases_default_landingtag"
     * )
     */
    public function landingtagAction(Request $request, $tag)
    {

        $domain = $_SERVER['HTTP_HOST'];
        $prefix = 'http://';

        $path = $prefix . $domain . '/content/tags/'. $tag .'/0/5';

        //@diegotorres50: los json al vuelo no se pueden tratar con file_get_contents(), en vez de eso se debe usar curl de php cuando no hay archivo fisico

        //$content = file_get_contents($path);
        //$json = json_decode($content, true);

        // Crea un nuevo recurso cURL
        $ch = curl_init();

        // Establece la URL y otras opciones apropiadas
        curl_setopt($ch, CURLOPT_URL, $path);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //Esto evita que la salida se transfiera directamente al navegador y asi controlar todo en una variable posteriortemente

        // Captura la URL y la envía al navegador
        $_json = curl_exec($ch);

        $json = json_decode($_json, true);

        // Cierrar el recurso cURLy libera recursos del sistema
        curl_close($ch);

        //var_dump($json); exit;

        return $this->render('LovePhrasesAppBundle:Default:landingtag.html.twig', array('data' => $json));
    }

    /**
     * @Route(
     *     "/search",
     *     name= "lovephrases_default_search"
     * )
     */    
    public function searchAction(Request $request)
    {
        // retrieve GET and POST variables respectively
        $query_s = $request->query->get('s');
        //$request->request->get('bar', 'default value if bar does not exist');
        //
        
        $query_id = $request->query->get('id');

        $domain = $_SERVER['HTTP_HOST'];
        $prefix = 'http://';

        if (isset($query_id) && !empty($query_id)) {

            $path = $prefix . $domain . '/content/article/'. $query_id;

        } else if (isset($query_s) && !empty($query_s)) {

            $path = $prefix . $domain . '/content/search/'. $query_s;

        }    
        //@diegotorres50: los json al vuelo no se pueden tratar con file_get_contents(), en vez de eso se debe usar curl de php cuando no hay archivo fisico

        //$content = file_get_contents($path);
        //$json = json_decode($content, true);

        // Crea un nuevo recurso cURL
        $ch = curl_init();

        // Establece la URL y otras opciones apropiadas
        curl_setopt($ch, CURLOPT_URL, $path);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //Esto evita que la salida se transfiera directamente al navegador y asi controlar todo en una variable posteriortemente

        // Captura la URL y la envía al navegador
        $_json = curl_exec($ch);

        $json = json_decode($_json, true);

        // Cierrar el recurso cURLy libera recursos del sistema
        curl_close($ch);

        //var_dump($json); exit;



        /*
        $path = 'bundles/lovephrasesapp/content/love-phrases/' . $section . '/home.json';
        $content = file_get_contents($path);
        $json = json_decode($content, true);

        //var_dump($json); exit;
        */
       
       //var_dump($json); exit;
        return $this->render('LovePhrasesAppBundle:Default:article.html.twig', array('data' => $json));
        
    }
}