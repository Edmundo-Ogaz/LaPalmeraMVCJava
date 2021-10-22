package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.UbicacionDTO;

public class ModificaUbicacion extends HttpServlet
{

    public ModificaUbicacion()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
         String opcion = httpservletrequest.getParameter("Enviar");
      	 String filproducto= httpservletrequest.getParameter("filproducto");
         String filbodega= httpservletrequest.getParameter("filbodega");
         String filtipoproducto= httpservletrequest.getParameter("filtipoproducto");
         String filfechaingresoinicio= httpservletrequest.getParameter("filfechaingresoinicio");
         String filfechaingresotermino= httpservletrequest.getParameter("filfechaingresotermino");
         String filfechavencimientoinicio= httpservletrequest.getParameter("filfechavencimientoinicio");
         String filfechavencimientotermino= httpservletrequest.getParameter("filfechavencimientotermino");
         String enviara = "";
	    
	     if (opcion.equals("Enviar"))
	       { 
	       enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaUbicacion.jsp&titulo=Listado Ubicacion";
           enviara = enviara + "&filproducto="+filproducto;
           enviara = enviara + "&filbodega="+filbodega; 
           enviara = enviara + "&filtipoproducto="+filtipoproducto;
           enviara = enviara + "&filfechaingresoinicio="+filfechaingresoinicio; 
           enviara = enviara + "&filfechaingresotermino="+filfechaingresotermino;
           enviara = enviara + "&filfechavencimientoinicio="+filfechavencimientoinicio; 
           enviara = enviara + "&filfechavencimientotermino="+filfechavencimientotermino; 
           
           
           UbicacionDTO ubicacion = new UbicacionDTO();
           ubicacion.setCodigoProducto(httpservletrequest.getParameter("producto"));
           ubicacion.setCodigoBodega(httpservletrequest.getParameter("bodega"));
           ubicacion.setFechaVencimiento(httpservletrequest.getParameter("fechavencimiento"));
           ubicacion.setTipoProducto(httpservletrequest.getParameter("tipoproducto"));
		   ubicacion.setFechaIngreso(httpservletrequest.getParameter("fechaingreso"));
		   ubicacion.setHoraIngreso(httpservletrequest.getParameter("horaingreso"));
		   ubicacion.setCantidad(httpservletrequest.getParameter("cantidad"));
		   ubicacion.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida")); 
		   ubicacion.setObservacion(httpservletrequest.getParameter("observacion"));            
           ubicacion.modificar();
         } 
	            
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/ubicacion.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}