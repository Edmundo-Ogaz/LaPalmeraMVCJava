<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
 if (opcion.equals("Eliminar"))
    { 
    enviara = "/servlet/EliminaIngrediente";
	} 
  else 
    {  
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaIngrediente.jsp&titulo=Modificar Ingrediente";
      }
	  /*else 
      { 
      if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilIngrediente.jsp&titulo=Filtrado de Ingrediente";
        } 
      }*/
	} 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
