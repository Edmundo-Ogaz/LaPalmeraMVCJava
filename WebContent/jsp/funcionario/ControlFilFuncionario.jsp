<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaFuncionario.jsp&titulo=Listado de Funcionario";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Funcionario"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoFuncionario.jsp&titulo=Nuevo Funcionario";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>

