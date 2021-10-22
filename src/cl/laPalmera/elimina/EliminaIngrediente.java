package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.IngredienteDTO;

public class EliminaIngrediente extends HttpServlet
{

    public EliminaIngrediente()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filproducto = httpservletrequest.getParameter("filproducto");
        String filinsumo = httpservletrequest.getParameter("filinsumo");
      	String enviara = "";
	    
	    if (opcion.equals("Eliminar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaIngrediente.jsp&titulo=Listado Ingrediente";
          enviara = enviara + "&filproducto="+filproducto;
          enviara = enviara + "&filinsumo="+filinsumo;  
          
          String productoinsumo = httpservletrequest.getParameter("seleccion");
       	  String producto = productoinsumo.substring(0,productoinsumo.indexOf("/"));
		  String insumo = productoinsumo.substring(productoinsumo.indexOf("/")+1,productoinsumo.length());
          
          IngredienteDTO ingrediente = new IngredienteDTO();
          ingrediente.setCodigoProducto(producto);
          ingrediente.setCodigoInsumo(insumo);
          ingrediente.eliminar();
          } 
	                   
        httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/ingrediente.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}