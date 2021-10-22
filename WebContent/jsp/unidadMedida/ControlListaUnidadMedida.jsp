<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
 if (opcion.equals("Eliminar"))
    { 
    enviara = "/servlet/EliminaUnidadMedida";
	} 
  else 
    { 
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaUnidadMedida.jsp&titulo=Modificar Unidad de Medida";
      }
	  /*else 
      { 
      if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilUnidadMedida.jsp&titulo=Filtrado Unidad de Medida";
        } 
      }*/
	} 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
