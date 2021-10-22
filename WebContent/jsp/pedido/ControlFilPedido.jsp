<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaPedido.jsp&titulo=Listado de Pedidos";
	} 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
