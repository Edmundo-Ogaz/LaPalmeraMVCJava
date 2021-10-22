<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Confirmar Pedido"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ConfirmarPedido.jsp&titulo=Confirmar Pedido";
	} 
  else 
    { 
      if (opcion.equals("Refrescar"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=ListaConfirmarPedido.jsp&titulo=Pedidos para Confirmar";
        }  	
	} 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
