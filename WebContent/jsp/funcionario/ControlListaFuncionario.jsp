<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Eliminar"))
    { 
    enviara = "/servlet/EliminaFuncionario";
	} 
  else 
    {
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaFuncionario.jsp&titulo=Modificar Funcionario";
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
