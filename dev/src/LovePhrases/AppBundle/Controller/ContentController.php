<?php

namespace LovePhrases\AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route; //@diegotorres50: necesario para las anotaciones de rutas 
use Symfony\Component\HttpFoundation\Request; //@diegotorres50: necesario para el formulario
use Symfony\Component\HttpFoundation\Response; //@diegotorres50: para el response hello world
use LovePhrases\AppBundle\Model\Model; //@diegotorres50: la logica del negocio para trabajar con mysql
use Symfony\Component\HttpFoundation\JsonResponse; //@diegotorres50 para responder un json

//The Filesystem class is the unique endpoint for filesystem operations:
use Symfony\Component\Filesystem\Filesystem; //@diegotorres50 para tratamiento de archivos
use Symfony\Component\Filesystem\Exception\IOExceptionInterface; //@diegotorres50 manejo de erroes con archivos

class ContentController extends Controller
{
	 /**
     * @Route("/content/home/{var}", defaults={"var" = "development"}, name="lovephrases_content_home") 
     */
    public function homeAction(Request $request, $var)
    {

        $thereIsError = FALSE;
        $errorsList = array();


        //Defini el array del json
        $data = array();

        $datetime = new \DateTime("now");

        if(!empty($var) && $var != 'production') $data['env'] = $var; //Para mostrar que esta en caliente el json pero no se esta guardando

        $data['datetime'] = $datetime->format('Y-m-d H:i:s');
        $data['alias'] = 'home';
        $data['label'] = 'Portada';
        $data['path'] = '/';

        //Instanciamos el modelo de conexion mysql usando el modelo de conexion
        $m = new Model(
            $this->container->getParameter('database_name'), 
            $this->container->getParameter('database_user'),
            $this->container->getParameter('database_password'),
            $this->container->getParameter('database_host')
        );

        //Seteamos en un array los parametros del query para mysql
        $values = array();

        //Seteamos que tabla vamos a consultar
        $values['TABLE'] = 'sections';

        //Seteamos los alias de los campos de deseamos traer en el query y un lbl para la vista
        $values['FIELDS'] = array( //identificador_campo => aliascustomizado_campo
            'section_alias' => 'alias',
            'section_name' => 'name',
            'section_path' => 'path'
            );

        //Seteamos el ordenamiento por defecto del query
        $values['ORDER_BY'] = array( 
            'section_order asc' //ordenar por id para traerlo alfabeticamente
            );

        //Seteamos el paginador de la consulta para mysql
        $values['LIMIT'] = array( 
            'OFFSET' => 0, //Desde la fila que se desea mostrar. Esto es un parametro de la ruta
            'ROW_COUNT' => 1000 //Cantidad maximo de registros a traer. Esto es un parametro de la ruta
            );

        //Tratamos de consultar la lista de usuarios en la tabla de mysql
        $getSections = $m->getDataFromSingleTable($values);

        //Si el query falla mostramos un error
        if (!empty($getSections) && is_array($getSections) && isset($getSections['errorMsg'])) {
            $thereIsError = TRUE;
            $errorsList[]['error'] = $getSections['errorMsg'];
        } else if (isset($getSections['rows_found']) && empty($getSections['rows_found'])) { //Si no hay registros, mostramos un warning
            $thereIsError = TRUE;
            $errorsList[]['error'] = 'No sections';
        } else $data['sections'] = $getSections['rows_found'];

        //Tratamos de consultar la lista de articulos en la tabla de mysql
        $getHomePrimaryArticles = $m->getHomePrimaryArticles();

        //var_dump($getHomePrimaryArticles); exit;

        //Si el query falla mostramos un error
        if (!empty($getHomePrimaryArticles) && is_array($getHomePrimaryArticles) && isset($getHomePrimaryArticles['errorMsg'])) {
            $thereIsError = TRUE;
            $errorsList[]['error'] = $getHomePrimaryArticles['errorMsg'];
        } else if (isset($getHomePrimaryArticles['rows_found']) && empty($getHomePrimaryArticles['rows_found'])) { //Si no hay registros, mostramos un warning
            $thereIsError = TRUE;
            $errorsList[]['error'] = 'No articles';
        } else  {

            //$data['articles'] = $getHomePrimaryArticles[0]; //ojo, el array que devuelve la consulta no debe contener ni un solo valor nulo pues un valor nulo anula todo el array 

            $_articles = array();

            $_i = 0;

            foreach ($getHomePrimaryArticles[0] as $article) {
                //Tratamos de consultar la lista de parametros por articulo en la tabla de mysql
                $_articles[$_i] = $article;
                $_parameter = $m->getArticleParameters($article['article_id']);  //OJO FALTA VALIDAR EL RESULTADO DE LA FUNCION  
                $_tag = $m->getArticleTags($article['article_id']);  //OJO FALTA VALIDAR EL RESULTADO DE LA FUNCION     
                $_articles[$_i]['parameters'] = $_parameter[0];
                $_articles[$_i]['tags'] = $_tag[0];
                $_i ++;        
            }   
            
            $data['articles'] = $_articles;

        }

        //
        if($thereIsError) $data = $errorsList;

        //JSON response: http://symfony.com/doc/current/components/http_foundation/introduction.html   
        //@diegotorres50 prefiero no usar este metodo porque me ponen textos de cabacere, usare json_encode() 
        //$response = new JsonResponse();
        //$response->setData($data);

        //Codificamos el array en formato json
        $response = json_encode($data);

        //Si en la url llega el parametro con el valor 'production' generamos el archivo fisico del feed
        if($var == 'production') {
            // 
            //Preparamos el filesystem para guardar el json en un archivo fisico
            $fs = new Filesystem();

            //Ruta del directorio de contenido
            $content_path = $this->container->getParameter('kernel.root_dir') . '/../web/bundles/lovephrasesapp/content/';

            //Nombre del archivo home
            $json_file = 'home.json';

            try {
                //Con el metodo dumpfile() guardamos el responseen un archivo
                $fs->dumpFile($content_path . $json_file, $response);
            } catch (IOExceptionInterface $e) {
                echo "An error occurred while creating your directory at ".$e->getPath();
            }
        }
            
        return new Response($response);
        //
        //return $response; @diegotorres50 use esto si usa JsonResponse()
    }

}