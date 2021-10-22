package cl.laPalmera.control;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlFilPedido extends HttpServlet
  { 
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
      { 
      String opcion = request.getParameter("Enviar");
      String enviara = "";
	      if (opcion.equals("Buscar"))
	        { 
	        enviara = "/jsp/UsoSistema.jsp?destino=ListaPedido.jsp&titulo=Listado de Pedido";
	        } 
	      else 
	        { 
	         enviara = "/jsp/index.jsp";
	        } 
      RequestDispatcher envio = getServletContext().getRequestDispatcher(enviara);
      envio.forward(request, response);
      }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
      { 
      doGet(request, response); 
      } 
  } 
