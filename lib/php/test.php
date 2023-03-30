<?php

class Constants
{
    //DATABASE DETAILS
    static $DB_SERVER='localhost';
    static $DB_NAME='users';
    static $USERNAME='root';
    static $PASSWORD='root'; //ou vide

    //STATEMENTS
    static $SQL_SELECT_ALL='SELECT * FROM `table_2`';

}

class Farms
{
    /*******************************************************************************************************************************************/
    /*
       1.CONNECT TO DATABASE.
       2. RETURN CONNECTION OBJECT
    */
    public function connect()
    {
        #$con=new mysqli(Constants::$DB_SERVER,Constants::$USERNAME,Constants::$PASSWORD,Constants::$DB_NAME);
        $con = mysqli_connect(Constants::$DB_SERVER,Constants::$USERNAME,Constants::$PASSWORD,Constants::$DB_NAME);
        if($con->connect_error)
        {
            print(Constants::$DB_SERVER);
            echo "Unable To Connect"; //- For debug
            return null;
        }else
        {
            echo "Connected"; //- For debug
            return $con;
        }
    }
    /*******************************************************************************************************************************************/
    /*
       1.SELECT FROM DATABASE.
    */
    public function select()
    {
        $con=$this->connect();
        if($con != null)
        {
            $result=$con->query(Constants::$SQL_SELECT_ALL);
            if($result->num_rows>0)
            {
                $farms=array();
                while($row=$result->fetch_array())
                {
                    //ADAPTER LES COLONNES DE LA BASE TABLE_2
                    array_push($farms, array("id"=>$row['id'],"nom"=>$row['Nom'],
                    "Producteurs"=>$row['Producteurs'],"categorie"=>$row['categorie'],
                    "Produits"=>$row['Produits'],"adresse"=>$row['adresse'],"mail"=>$row['mail'],
                    "tel"=>$row['tel'],"reseaux"=>$row['reseaux'],
                    "description"=>$row['description'],"horaire"=>$row['horaire'],"bio"=>$row['bio']));
                }
                print(json_encode(array_reverse($farms)));
            }else
            {
                print(json_encode(array("PHP EXCEPTION : CAN'T RETRIEVE FROM MYSQL. ")));
            }
            $con->close();

        }else{
            print(json_encode(array("PHP EXCEPTION : CAN'T CONNECT TO MYSQL. NULL CONNECTION.")));
        }
    }
}
$farms=new Farms();
$farms->select();

//end