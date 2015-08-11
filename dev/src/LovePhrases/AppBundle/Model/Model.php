<?php

namespace LovePhrases\AppBundle\Model;

use Symfony\Component\HttpFoundation\Request;

class Model
{

    /* @diegotorres50: la idea es que sea el modelo de negocio para conectar y gestionar la base de datos */
    protected $conexion;

    public function __construct($dbname,$dbuser,$dbpass,$dbhost)
    {
        $mvc_bd_conexion = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

        if (mysqli_connect_errno()) {
            die('No ha sido posible realizar la conexión con la base de datos: '
              . mysqli_connect_error());
        }
         
        $this->conexion = $mvc_bd_conexion;
    }

    public function bd_conexion()
    {

    }

    public function getArticleTags($article_id)
    {
        //@diegotorres50: metodo que consulta todos los articulos del home
        //
       
        $sql = array();

        //Query para consultas
        $sql[] = "SELECT tags.tag_alias, tags.tag_label, tags.tag_path";
        $sql[] = "FROM tags, article_tags, articles";
        $sql[] = "where tags.tag_alias = article_tags.tag_alias and";
        $sql[] = "article_tags.article_id = articles.article_id and";
        $sql[] = "articles.article_id = " . $article_id;
        $sql[] = "order by 1;";

        //Armamos la consulta completa con espacios entre los segmentos del query
        $sql = implode(" ", $sql);

        $result = mysqli_query($this->conexion, $sql);

        if(!$result) {

            return array('errorMsg' => 'No ha sido posible realizar la consulta de parametros por articulo: ' . mysqli_error($this->conexion));
        }


        // Numeric array
        //$row=mysqli_fetch_array($result,MYSQLI_NUM);
        //printf ("%s (%s)\n",$row[0],$row[1]);

        // Associative array
        //$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
        //printf ("%s (%s)\n",$row["user_id"],$row["user_role"]);

        $rows_found = array();

        while ($row = mysqli_fetch_assoc($result))
        {

            //$row es un array de columnas
            $row = array_filter($row); //Esto evita que se filtren valores nulos, con un solo valor nulo anula otro array al concatenarse

            $rows_found[] = $row; //Solo valores no nulos
        }

        // Free result set
        mysqli_free_result($result);  
        
        //mysqli_close($this->conexion); No cerremos la conexion para reusarla    

        $data = array($rows_found); //Todas las filas

        return $data;

    }

    public function getArticleParameters($article_id)
    {
        //@diegotorres50: metodo que consulta todos los articulos del home
        //
       
        $sql = array();

        //Query para consultas
        $sql[] = "SELECT article_params.param_alias, article_params.param_value FROM parameters, article_params, articles";
        $sql[] = "where parameters.param_alias = article_params.param_alias and";
        $sql[] = "article_params.article_id = articles.article_id and";
        $sql[] = "articles.article_id = " . $article_id;
        $sql[] = "order by 1;";

        //Armamos la consulta completa con espacios entre los segmentos del query
        $sql = implode(" ", $sql);

        $result = mysqli_query($this->conexion, $sql);

        if(!$result) {

            return array('errorMsg' => 'No ha sido posible realizar la consulta de parametros por articulo: ' . mysqli_error($this->conexion));
        }


        // Numeric array
        //$row=mysqli_fetch_array($result,MYSQLI_NUM);
        //printf ("%s (%s)\n",$row[0],$row[1]);

        // Associative array
        //$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
        //printf ("%s (%s)\n",$row["user_id"],$row["user_role"]);

        $rows_found = array();

        while ($row = mysqli_fetch_assoc($result))
        {

            //$row es un array de columnas
            $row = array_filter($row); //Esto evita que se filtren valores nulos, con un solo valor nulo anula otro array al concatenarse

            $rows_found[$row['param_alias']] = $row['param_value']; //Solo valores no nulos
        }

        // Free result set
        mysqli_free_result($result);  
        
        //mysqli_close($this->conexion); No cerremos la conexion para reusarla    

        $data = array($rows_found); //Todas las filas

        return $data;

    }

    public function getHomePrimaryArticles()
    {
        //@diegotorres50: metodo que consulta todos los articulos del home
        //
       
        $sql = array();

        //Query para consultas
        $sql[] = "SELECT articles.article_id, articles.article_modified, articles.article_created, articles.article_title, articles.article_alias, articles.article_lead, articles.article_description, articles.article_section, sections.section_name, sections.section_path, articles.article_img, articles.article_type, articles.article_author, articles.article_credit"; 
        $sql[] = "FROM articles, article_params, parameters, sections";
        $sql[] = "where articles.article_id = article_params.article_id and";
        $sql[] = "article_params.param_alias = parameters.param_alias and";
        $sql[] = "sections.section_alias = articles.article_section and";
        $sql[] = "article_params.param_alias = 'home' and";
        $sql[] = "article_params.param_value = 1 and";
        $sql[] = "articles.article_status = 'PUBLISHED' and";
        $sql[] = "articles.article_position = 'PRIMARY'";
        $sql[] = "order by articles.article_modified desc, articles.article_home_order asc;";

        //Armamos la consulta completa con espacios entre los segmentos del query
        $sql = implode(" ", $sql);

        $result = mysqli_query($this->conexion, $sql);

        if(!$result) {

            return array('errorMsg' => 'No ha sido posible realizar la consulta del home: ' . mysqli_error($this->conexion));
        }


        // Numeric array
        //$row=mysqli_fetch_array($result,MYSQLI_NUM);
        //printf ("%s (%s)\n",$row[0],$row[1]);

        // Associative array
        //$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
        //printf ("%s (%s)\n",$row["user_id"],$row["user_role"]);

        $rows_found = array();

        while ($row = mysqli_fetch_assoc($result))
        {

            //$row es un array de columnas
            $row = array_filter($row); //Esto evita que se filtren valores nulos, con un solo valor nulo anula otro array al concatenarse

            $rows_found[] = $row; //Solo valores no nulos
        }

        // Free result set
        mysqli_free_result($result);  
        
        //mysqli_close($this->conexion); No cerremos la conexion para reusarla    

        $data = array($rows_found); //Todas las filas

        return $data;

    }

    public function getDataFromSingleTable($values)
    {
        //@diegotorres50: metodo que consulta una unica tabla, reusable
        //
        
        if(!isset($values) || empty($values) || !is_array($values)) 
            return array('errorMsg' => 'Se esperaba un objeto como parámetro del método');

        /* Estructura del parametro esperado
        $values['TABLE'] = 'Users';

        $values['FIELDS'] = array( //identificador_campo => aliascustomizado_campo
            'user_id' => 'id',
            'user_document' => 'documento',
            'user_status' => 'estado',
            'user_name' => 'nombre',
            'user_mail' => 'mail',
            'user_language' => 'idioma',
            'user_lastactivation' => 'activado_desde',
            'user_role' => 'perfil'
            );

        $values['WHERE'] = 'WHERE user_id = \'diegotorres50\'';

        $values['ORDER_BY'] = array( 
            'user_id desc'
            );

        $values['LIMIT'] = array( 
            'OFFSET' => 0, //Desde la fila
            'ROW_COUNT' => 1 //Cantidad
            );        

        */
       
        $sql = array();
        $sql_rows_total = array();

        //Query para consultas
        $sql[] = "SELECT";
        $sql_rows_total[] = "SELECT COUNT(*) AS TOTAL";

        //Si se especifica paginar la consulta
        if(isset($values['FIELDS']) && !empty($values['FIELDS']) && is_array($values['FIELDS'])) {
            $values['FIELDS'] = implode(",", array_keys($values['FIELDS']));
            $sql[] = $values['FIELDS'];
        } else {
            $sql[] = "*"; //Por defecto trae todos los campos
        }   
        
        $sql[] = "FROM";
        $sql_rows_total[] = "FROM";

        $sql[] = $values['TABLE'];
        $sql_rows_total[] = $values['TABLE'];

        //Si se especifica criterios de consulta
        if(isset($values['WHERE']) && !empty($values['WHERE'])) {
            $sql[] = $values['WHERE'];
            $sql_rows_total[] = $values['WHERE'];
        }        

        //Si se especifica ordenar la consulta
        if(isset($values['ORDER_BY']) && !empty($values['ORDER_BY']) && is_array($values['ORDER_BY'])) {
            $values['ORDER_BY'] = implode(",", $values['ORDER_BY']);
            $sql[] = 'ORDER BY ' . $values['ORDER_BY'];
        } else {
            $sql[] = 'ORDER BY 1 DESC'; //Ordenar por defecto por la primera columna descendente
        }

        //Si se especifica paginar la consulta
        if(isset($values['LIMIT']) && !empty($values['LIMIT']) && is_array($values['LIMIT'])) {
            $sql[] = "LIMIT " . $values['LIMIT']['OFFSET'] . ", " . $values['LIMIT']['ROW_COUNT'];
        }         

        //Armamos la consulta completa con espacios entre los segmentos del query
        $sql = implode(" ", $sql);
        $sql_rows_total = implode(" ", $sql_rows_total);

        $result = mysqli_query($this->conexion, $sql);
        $result_sql_rows_total = mysqli_query($this->conexion, $sql_rows_total);

        if(!$result || !$result_sql_rows_total) {

            return array('errorMsg' => 'No ha sido posible realizar la consulta de ' . $values['TABLE'] . ': ' . mysqli_error($this->conexion));
        }


        // Numeric array
        //$row=mysqli_fetch_array($result,MYSQLI_NUM);
        //printf ("%s (%s)\n",$row[0],$row[1]);

        // Associative array
        //$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
        //printf ("%s (%s)\n",$row["user_id"],$row["user_role"]);

        $rows_found = array();
        while ($row = mysqli_fetch_assoc($result))
        {
           $rows_found[] = $row;
        }

        // Free result set
        mysqli_free_result($result);

        $rows_total=mysqli_fetch_array($result_sql_rows_total,MYSQLI_ASSOC);

        // Free result set
        mysqli_free_result($result_sql_rows_total);        
        
        //mysqli_close($this->conexion); No cerremos la conexion para reusarla    

        $data = array(
            'rows_found' => $rows_found, //Todas las filas
            'total' => $rows_total["TOTAL"] //La cantidad de filas
            );

        return $data;
     }

    /*

    @diegotorres50: estos son metodos dummy
     public function dameAlimentos()
     {
         $sql = "select * from alimentos order by energia desc";

         $result = mysql_query($sql, $this->conexion);

         $alimentos = array();
         while ($row = mysql_fetch_assoc($result))
         {
             $alimentos[] = $row;
         }

         return $alimentos;
     }

     public function buscarAlimentosPorNombre($nombre)
     {
         $nombre = htmlspecialchars($nombre);

         $sql = "select * from alimentos where nombre like '" . $nombre . "' order
 by energia desc";

         $result = mysql_query($sql, $this->conexion);

         $alimentos = array();
         while ($row = mysql_fetch_assoc($result))
         {
             $alimentos[] = $row;
         }

         return $alimentos;
     }

     public function dameAlimento($id)
     {
         $id = htmlspecialchars($id);

         $sql = "select * from alimentos where id=".$id;

         $result = mysql_query($sql, $this->conexion);

         $alimentos = array();
         $row = mysql_fetch_assoc($result);

         return $row;

     }

     public function insertarAlimento($n, $e, $p, $hc, $f, $g)
     {
         $n = htmlspecialchars($n);
         $e = htmlspecialchars($e);
         $p = htmlspecialchars($p);
         $hc = htmlspecialchars($hc);
         $f = htmlspecialchars($f);
         $g = htmlspecialchars($g);

         $sql = "insert into alimentos (nombre, energia, proteina, hidratocarbono,
 fibra, grasatotal) values ('" .
                 $n . "'," . $e . "," . $p . "," . $hc . "," . $f . "," . $g . ")";

         $result = mysql_query($sql, $this->conexion);

         return $result;
     }
     */
 }