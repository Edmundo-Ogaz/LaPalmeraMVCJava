package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.UbicacionDTO;

public class EliminaUbicacion extends HttpServlet
{

    public EliminaUbicacion()
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
	    
	     if (opcion.equals("Eliminar"))
	       { 
	       enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaUbicacion.jsp&titulo=Listado Ubicacion";
           enviara = enviara + "&filproducto="+filproducto;
           enviara = enviara + "&filbodega="+filbodega; 
           enviara = enviara + "&filtipoproducto="+filtipoproducto;
           enviara = enviara + "&filfechaingresoinicio="+filfechaingresoinicio; 
           enviara = enviara + "&filfechaingresotermino="+filfechaingresotermino;
           enviara = enviara + "&filfechavencimientoinicio="+filfechavencimientoinicio; 
           enviara = enviara + "&filfechavencimientotermino="+filfechavencimientotermino; 
           
           /*String productobodegafechavencimiento = httpservletrequest.getParameter("seleccion");
		   String producto = productobodegafechavencimiento.substring(0,productobodegafechavencimiento.indexOf("/"));
		   String bodega = productobodegafechavencimiento.substring(productobodegafechavencimiento.indexOf("/")+1,productobodegafechavencimiento.lastIndexOf("/"));
		   String fechavencimiento = productobodegafechavencimiento.substring(productobodegafechavencimiento.lastIndexOf("/")+1,productobodegafechavencimiento.length());
           */
           String seleccion = httpservletrequest.getParameter("seleccion");

           String producto = seleccion.substring(0,seleccion.indexOf("/"));
		   seleccion = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
		   String bodega = seleccion.substring(0,seleccion.indexOf("/"));
		   seleccion = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
		   String fechaingreso = seleccion.substring(0,seleccion.indexOf("/"));
		   seleccion = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
		   String horaingreso = seleccion.substring(0,seleccion.indexOf("/"));
		   seleccion = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
		   String fechavencimiento = seleccion.substring(seleccion.indexOf("/")+1,seleccion.length());
           
           UbicacionDTO ubicacion = new UbicacionDTO();
           ubicacion.setCodigoProducto(producto);
           ubicacion.setCodigoBodega(bodega);
           ubicacion.setFechaIngreso(fechaingreso);
           ubicacion.setHoraIngreso(horaingreso);
           ubicacion.setFechaVencimiento(fechavencimiento);
           ubicacion.eliminar();
           } 
	                   
        httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/ubicacion.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}