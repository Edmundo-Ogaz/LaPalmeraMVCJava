package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.ConceptoTecnicoDTO;

public class EliminaConceptoTecnico extends HttpServlet
{

    public EliminaConceptoTecnico()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
       String opcion = httpservletrequest.getParameter("Enviar");
        String filcodigo = httpservletrequest.getParameter("filcodigo");
        String filnombre = httpservletrequest.getParameter("filnombre");
       
      	String enviara = "";
	    if (opcion.equals("Eliminar"))
	    { 
	    enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaConceptoTecnico.jsp&titulo=Listado Concepto Técnico";
        enviara = enviara + "&filcodigo="+filcodigo;
        enviara = enviara + "&filnombre="+filnombre; 
        
        ConceptoTecnicoDTO conceptoTecnico = new ConceptoTecnicoDTO();
        conceptoTecnico.setCodigoConceptoTecnico(httpservletrequest.getParameter("seleccion"));
        conceptoTecnico.eliminar();
        } 
	          
		httpservletresponse.sendRedirect(enviara);
    }
}