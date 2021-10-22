<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Pastelería La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Buscar"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaInformeDeterminarInsumo.jsp&titulo=Listado Informe Determinar Insumo";
	} 
  /*else 
    { 
    if (opcion.equals("Nuevo Ingrediente"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=NuevoIngrediente.jsp&titulo=Nuevo Ingrediente";	
      } 
    }*/ 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>

