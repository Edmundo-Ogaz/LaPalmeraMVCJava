<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Pasteler�a La Palmera</title>
</head>
<body>
<%String opcion = request.getParameter("Enviar");
  String enviara = "";
  if (opcion.equals("Consultar Captura Producci�n"))
    { 
    enviara = "/jsp/UsoSistema.jsp?destino=ListaInformeCapturaProduccion.jsp&titulo=Listado Informe Captura Producci�n";
	} 
  /*else 
    { 
    if (opcion.equals("Modificar"))
      { 
      enviara = "/jsp/UsoSistema.jsp?destino=ModificaProgramaProduccion.jsp&titulo=Modificar Programa de Producci�n";
      }
	  else 
      { 
      if (opcion.equals("Volver"))
        { 
        enviara = "/jsp/UsoSistema.jsp?destino=FilProgramaProduccion.jsp&titulo=Filtrado Programa de Producci�n";
        } 
      }
	}*/ 
%>
   <jsp:forward page="<%=enviara%>"/>

</body>
</html>
