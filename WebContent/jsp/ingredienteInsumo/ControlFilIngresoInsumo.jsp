<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaIngresoInsumo.jsp&titulo=Listado Ingreso de Insumo";
	} 
  /*else 
    { 
    if (opcion.equals("Nuevo Ingreso Insumo"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoIngresoInsumo.jsp&titulo=Nuevo IngresoInsumo";	
      } 
    }*/ 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>

