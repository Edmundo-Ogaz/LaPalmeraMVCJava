package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.ProductoDTO;

public class ModificaProducto extends HttpServlet
{

    public ModificaProducto()
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
	    if (opcion.equals("Enviar"))
	    { 
	    enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProducto.jsp&titulo=Listado Producto";
        enviara = enviara + "&filcodigo="+filcodigo;
        enviara = enviara + "&filnombre="+filnombre; 
        enviara = enviara + "&filtipoproducto="+filtipoproducto;
        enviara = enviara + "&filfamilia="+filfamilia; 
        enviara = enviara + "&filsubfamilia="+filsubfamilia;  
        
        ProductoDTO producto = new ProductoDTO();
        producto.setCodigoProducto(httpservletrequest.getParameter("codigo"));
        producto.setNombreProducto(httpservletrequest.getParameter("nombre"));
        producto.setCodigoFamilia(httpservletrequest.getParameter("familia"));
        producto.setCodigoSubfamilia(httpservletrequest.getParameter("subfamilia"));
        producto.setCodigoOtraCaracteristica(httpservletrequest.getParameter("otracaracteristica"));
        producto.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"));
        producto.setStockCriticoProducto(httpservletrequest.getParameter("stockcritico"));
            
        String valorcosto = httpservletrequest.getParameter("valorcosto");
        if (!valorcosto.equals(""))
          producto.setValorCostoProducto(valorcosto);
        else
          producto.setValorCostoProducto("-1");
            
        String valorventa = httpservletrequest.getParameter("valorventa");
        if (!valorventa.equals(""))
          producto.setValorVentaProducto(valorventa);
        else
          producto.setValorVentaProducto("-1");
            
        producto.setPreparacionProducto(httpservletrequest.getParameter("preparacion"));
        producto.setTipoProducto(httpservletrequest.getParameter("tipoproducto"));
        producto.setFotoProducto(httpservletrequest.getParameter("foto"));
        producto.setObservacionProducto(httpservletrequest.getParameter("observacion"));
        producto.modificar();
        } 
	          
		httpservletresponse.sendRedirect(enviara);

		//RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("file:///C|/Tomcat 5.0/webapps/LaPalmera/jsp/images/logo pasteleria la palmera.png");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/Tomcat 5.0/webapps/LaPalmera/jsp/home.jsp");
        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=FilProducto.jsp&titulo=Filtrado de Productos");
        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/FilProducto.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }

}