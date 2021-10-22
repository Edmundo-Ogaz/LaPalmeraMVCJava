package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.FichaTecnicaDTO;

public class ModificaFichaTecnica extends HttpServlet
{

    public ModificaFichaTecnica()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
        String filproducto = httpservletrequest.getParameter("filproducto");
        String filconceptotecnico = httpservletrequest.getParameter("filconceptotecnico");
        String enviara = "";
        
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaFichaTecnica.jsp&titulo=Listado Ficha Tecnica";
	      enviara = enviara + "&filproducto="+filproducto;
          enviara = enviara + "&filconceptotecnico="+filconceptotecnico; 
          
          FichaTecnicaDTO fichaTecnica = new FichaTecnicaDTO();
          fichaTecnica.setCodigoProducto(httpservletrequest.getParameter("producto"));
          fichaTecnica.setCodigoConceptoTecnico(httpservletrequest.getParameter("conceptotecnico"));
          fichaTecnica.setDescripcionFichaTecnica(httpservletrequest.getParameter("descripcion"));
          fichaTecnica.modificar();
         } 
	                   
            
            						       
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/fichatecnica.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}