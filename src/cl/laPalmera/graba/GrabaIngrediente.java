package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.IngredienteDTO;

public class GrabaIngrediente extends HttpServlet
{

    public GrabaIngrediente()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filproducto = httpservletrequest.getParameter("filproducto");
        String filinsumo = httpservletrequest.getParameter("filinsumo");
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaIngrediente.jsp&titulo=Listado Ingrediente";
          enviara = enviara + "&filproducto="+filproducto;
          enviara = enviara + "&filinsumo="+filinsumo;  
        
          IngredienteDTO ingrediente = new IngredienteDTO();
          ingrediente.setCodigoProducto(httpservletrequest.getParameter("producto"));
          ingrediente.setCodigoInsumo(httpservletrequest.getParameter("insumo"));
          ingrediente.setCarga(httpservletrequest.getParameter("carga"));
          ingrediente.setCantidadInsumo(httpservletrequest.getParameter("cantidadinsumo"));
          ingrediente.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));
          ingrediente.grabar();
          } 
	            
		httpservletresponse.sendRedirect(enviara);
        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/ingrediente.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}