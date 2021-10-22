package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.ProductoDTO;

public class EliminaProducto extends HttpServlet
{

    public EliminaProducto()
    {
    }
    
	public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filcodigo = httpservletrequest.getParameter("filcodigo");
        String filnombre = httpservletrequest.getParameter("filnombre");
        String filtipoproducto = httpservletrequest.getParameter("filtipoproducto");
        String filfamilia = httpservletrequest.getParameter("filfamilia");
        String filsubfamilia = httpservletrequest.getParameter("filsubfamilia");
      	String enviara = "";
	    
	    if (opcion.equals("Eliminar"))
	    { 
	    enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProducto.jsp&titulo=Listado Producto";
        enviara = enviara + "&filcodigo="+filcodigo;
        enviara = enviara + "&filnombre="+filnombre; 
        enviara = enviara + "&filtipoproducto="+filtipoproducto;
        enviara = enviara + "&filfamilia="+filfamilia; 
        enviara = enviara + "&filsubfamilia="+filsubfamilia;  
        
        ProductoDTO producto = new ProductoDTO();
        producto.setCodigoProducto(httpservletrequest.getParameter("seleccion"));
        producto.eliminar();
        } 
	                   
        httpservletresponse.sendRedirect(enviara);

        //RequestDispatcher dispatcher = sc.getRequestDispatcher("/servlet/request_imagen");
        //dispatcher.forward(request, response);
        //ServletContext.getRequestDispatcher("/jsp/Fin.jsp").forward(request,response);
        //response.sendRedirect("/jsp/Fin.jsp");
        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/FilProducto.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}