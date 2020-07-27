<?php
	
    date_default_timezone_set('America/Mexico_City');
    $host="localhost";
    $user="root";
    $pass="";
    $db="eva_pec2";
    $con=mysqli_connect($host, $user, $pass, $db);
    if($con->connect_error){
            die("Connection failed: ".$con->connect_error);
    }
    //echo 'Hola';

    //Tablas Usuarios
    $tUsers = "usuarios";
    $tUPerfil = "perfiles"; //[Director, Administrativo, Profesor, Alumno, Tutor]
    $tEdos = "estados"; //[Activo, Desactivo]
    $tInfo = "usuarios_informacion";
    $tGrade = "banco_niveles_grados";
    $tMats = "banco_materias";
    $tPerInfo = "periodo_info";
    $tPerFecha = "periodo_fecha";
    $tGInfo = "grupos_info";
    $tTurn = "banco_nivel_turnos";
    $tPlanEst = "planes_estudios";
    $tGMatProf = "grupos_mat_prof";
    $tGAlum = "grupos_alumnos";
    $tGMatAlum = "grupos_mat_alum";
    // $tPerMatProm = "";
    $tRubInfo = "rubrica_info";
    $tRubInfoCalif = "rubrica_info_calif";
    $tRubDetCalif = "rubrica_detalles_calif";
    // $tPerRubCalif = "";

?>