<?php
include ("connect.php");
//esta es la clase USUARIOS que hereda la clase conexionBD, contiene funciones como: autenticacion , getperfil y registrar.
class usuarios extends conexionBD
{

    /**
     * Funcion para autenticarse
     * 
     * @parametro $opc escoge la opcion a mostrar. $correo = correo del usuario. $contraseña= contraseña del usuario
     * con esos parametros se realizara la utenticacion del usuario.
     * 
     */

    public static function iniciarSesion($opc, $correo = null, $contraseña = null) //funcion de autenticacion, la funcion es publica y estatica contiene los parametros $opc, $correo, $contraseña. 
    {

        $conexion = conexionBD::getConexion(); //variable conexion donde llama a la clase conexionBD y el metodo getConexion

        $sql = "select t1.id_usuario, count(*) FROM usuarios t1 WHERE correo = '$correo' AND contraseña = '$contraseña'; ";//script sql, selecciona datos de la tabla usuarios y cuenta cuantas veces aparece el valor de id_usuario donde correo cumpla con una condicion.

        $resultado = $conexion->query($sql); //variable resultado donde ejecuta una consulta SQL utilizando la conexión $conexion y guarda el resultado en $resultado para su procesamiento posterior.

        $r = 0; // r= resultado inicializada en 0 

        while ($fila = $resultado->fetch_array()) { // ciclo while donde fila sea igual a la variable resultado de la conexcion y el fetch array para mostrar informacion de la base de datos.
            if ($opc == 0) {  // condicion
                $r = $fila[1]; //resultado de la condicion donde muestra la fila 1 
            } elseif ($opc == 1) { //sino se cumple la condicion ejecuta otra mediante el 1 
                $r = $fila[0]; //resultado de la condicion, donde mostrara la fila 0
            }
        }

        return $r; //retorno de la funcion 
    }


    /* funcion getPerfil donde se mostrara en la interfaz de mi perfil, la informacion del usuario traida desde la base de datos. 
     * 
     * 
     * @parametros $opc= escoge la opcion a mostrar. $correoU= correo del usuario donde se utilizara como identificador
     *
     * */

    public static function getPerfil($opc, $correoU) //funcion llamada getPerfil donde contiene parametros $opc, $correoU
    {
        $conexion = self::getConexion(); //obtiene una conexión utilizando un método estático llamando al metodo getConexion

        $sql = "select t1.nombre, t1.apellido, t1.correo, t1.contraseña, t1.peso_actual, t1.altura_actual, t1.pr, t1.telefono, t2.genero ";
        $sql .= "FROM usuarios t1 JOIN genero t2 ON t1.id_genero = t2.id_genero WHERE correo = '$correoU'"; //script sql realiza una consulta SQL que selecciona información detallada de usuarios y su género a partir de una unión entre tablas, filtrando por el correo electrónico proporcionado en $correoU.

        $resultado = $conexion->query($sql); //variable resultado donde ejecuta una consulta SQL utilizando la conexión $conexion y guarda el resultado en $resultado para su procesamiento posterior.

        while ($fila = $resultado->fetch_array()) { //ciclo while recorre cada fila del resultado obtenido de una consulta, asignando cada fila a la variable
            $r = ''; //inicializa la variable

            switch ($opc) { //utiliza una estructura llamada switch para seleccionar y juntar valores  especificos de la lista llamada datos dependiendo de la opc
                case 0: //

                    $r .= $fila[0];

                    break;
                case 1:

                    $r .= $fila[1];

                    break;
                case 5:

                    $r .= $fila[5];

                    break;
                case 4:

                    $r .= $fila[4];

                    break;
                case 8:

                    $r .= $fila[8];

                    break;
                case 6:

                    $r .= $fila[6];

                    break;
                case 2:

                    $r .= $fila[2];

                    break;
                case 7:

                    $r .= $fila[7];

                    break;
            }


        }

        return $r; //retorno de la funcion 
    }


    public static function registrar($nombres, $apellidos, $telefono, $correoElectronico, $contraseña, $pesoActual, $altura, $genero)
    {
        $conexion = self::getConexion();

        $sql = "insert into usuarios (nombre, apellido, telefono, correo, contraseña, peso_actual, altura_actual, id_genero, fecha_registro)";
        $sql .= "values ('$nombres' ,'$apellidos', $telefono, '$correoElectronico', '$contraseña', $pesoActual ,$altura, $genero, now())";
        $resultado = $conexion->query($sql);

        $affected_rows = $conexion->affected_rows;

        $conexion->close();

    }

}