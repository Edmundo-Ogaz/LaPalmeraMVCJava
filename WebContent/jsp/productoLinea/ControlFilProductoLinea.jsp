<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaProductoLinea.jsp&titulo=Listado Productos por Linea de Produccion";
	} 
  else 
    { 
    if (opcion.equals("Nuevo Producto por Linea de Producción"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoProductoLinea.jsp&titulo=Nuevo Producto por Linea de Producción";	
      } 
    } 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
