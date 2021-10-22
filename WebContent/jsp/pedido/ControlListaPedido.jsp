<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Consultar Pedido"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ConsultarPedido.jsp&titulo=Datos del Pedido";
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
