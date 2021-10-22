package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.FichaTecnicaDTO;

public class EliminaFichaTecnica extends HttpServlet
{

    public EliminaFichaTecnica()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
        String filproducto = httpservletrequest.getParameter("filproducto");
        String filconceptotecnico = httpservletrequest.getParameter("filconceptotecnico");
        String enviara = "";
        
	    if (opcion.equals("Eliminar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaFichaTecnica.jsp&titulo=Listado Ficha Tecnica";
	      enviara = enviara + "&filproducto="+filproducto;
          enviara = enviara + "&filconceptotecnico="+filconceptotecnico; 
          
          String productoconceptotecnico = httpservletrequest.getParameter("seleccion");
          String producto = productoconceptotecnico.substring(0,productoconceptotecnico.indexOf("/"));
          String conceptotecnico = productoconceptotecnico.substring(productoconceptotecnico.indexOf("/")+1,productoconceptotecnico.length());
          
          FichaTecnicaDTO fichaTecnica = new FichaTecnicaDTO();
          fichaTecnica.setCodigoProducto(producto);
          fichaTecnica.setCodigoConceptoTecnico(conceptotecnico);
          fichaTecnica.eliminar();
          } 
	                   
        httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/fichatecnica.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}