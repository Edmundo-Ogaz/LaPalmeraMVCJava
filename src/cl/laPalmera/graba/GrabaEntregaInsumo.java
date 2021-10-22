package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import unab.com.Mail;
import cl.laPalmera.DTO.DetalleEntregaInsumoDTO;
import cl.laPalmera.DTO.EntregaInsumoDTO;
import cl.laPalmera.DTO.InsumoDTO;
import cl.laPalmera.DTO.StockDTO;
import cl.laPalmera.DTO.UbicacionDTO;

public class GrabaEntregaInsumo extends HttpServlet
{

    public GrabaEntregaInsumo()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        
        String mensaje = "";
        String opcion = httpservletrequest.getParameter("Enviar");
        String filordenfabricacion = httpservletrequest.getParameter("filordenfabricacion");
      	String ordenfabricacion = httpservletrequest.getParameter("ordenfabricacion");
      	String enviara = "";
	    if (opcion.equals("Enviar Entrega"))
	    { 
	    		
		EntregaInsumoDTO entregaInsumo = new EntregaInsumoDTO();
		entregaInsumo.setCodigoOrdenFabricacion(httpservletrequest.getParameter("ordenfabricacion"));
        entregaInsumo.setFechaEntregaInsumo(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
        entregaInsumo.setHoraEntregaInsumo(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
        entregaInsumo.setRutFuncionario(httpservletrequest.getParameter("funcionario"));
        entregaInsumo.setObservacion(httpservletrequest.getParameter("observacion"));
        entregaInsumo.grabar();
		
		String correlativoentregainsumo = entregaInsumo.buscarUltimo();
		
		DetalleEntregaInsumoDTO detalleEntregaInsumo = new DetalleEntregaInsumoDTO();
		StockDTO stock = new StockDTO();
		UbicacionDTO ubicacion= new UbicacionDTO();
		
		int i = Integer.parseInt(httpservletrequest.getParameter("cantidadentregainsumo"));
        for(int j = 1; j < i; j++)
        {
         detalleEntregaInsumo.setCorrelativoEntregaInsumo(correlativoentregainsumo);
         detalleEntregaInsumo.setCodigoInsumo(httpservletrequest.getParameter("insumo"+j));
         detalleEntregaInsumo.setCantidadEntregaInsumo(httpservletrequest.getParameter("cantidadinsumo"+j));
         detalleEntregaInsumo.setCodigoUnidadMedida(httpservletrequest.getParameter("unidadmedida"+j));
         detalleEntregaInsumo.grabar();
            
         stock.setCodigoProducto(httpservletrequest.getParameter("insumo"+j));
		 if (stock.buscar())
		 {
		   String stockcomprometido = String.valueOf(Float.parseFloat(stock.getStockComprometido())-Float.parseFloat(httpservletrequest.getParameter("cantidadinsumo"+j)));
		   stock.setStockComprometido(stockcomprometido);
		   stock.modificar();
		   InsumoDTO insumo = new InsumoDTO();
		   insumo.setCodigoInsumo(httpservletrequest.getParameter("insumo"+j));
		   if (insumo.buscar())
		   {
		      if (Float.parseFloat(stockcomprometido) < 0)
			  {
			     Mail mail = new Mail();
			  	 mail.enviar("bodeguero","Stock Comprometido Negativo \n"+insumo.getNombreInsumo());
			  	 mensaje = mensaje + insumo.getNombreInsumo()+" Producto con Stock Comprometido Negativo \\n";
			  }
		   } 
		 }
             
          ubicacion.setCodigoProducto(httpservletrequest.getParameter("insumo"+j));
		  int filaj = Integer.parseInt(httpservletrequest.getParameter("ultimafila"+j));
          for(int k = 1; k <= filaj; k++)
		  {
		    ubicacion.setCodigoBodega(httpservletrequest.getParameter("bodega"+j+""+k));
		    ubicacion.setFechaVencimiento(httpservletrequest.getParameter("fechavencimiento"+j+""+k));
		    ubicacion.setFechaIngreso(httpservletrequest.getParameter("fechaingreso"+j+""+k));
		    ubicacion.setHoraIngreso(httpservletrequest.getParameter("horaingreso"+j+""+k));
		    if (ubicacion.buscar())
		    {
		      String cantidadubicacion = String.valueOf(Float.parseFloat(ubicacion.getCantidad())-Float.parseFloat(httpservletrequest.getParameter("cantidadbodega"+j+""+k)));
			  if (Float.parseFloat(cantidadubicacion) <= 0 )
		      {
		   	    ubicacion.eliminar();
			  }else{
			    ubicacion.setCantidad(cantidadubicacion);
			    ubicacion.modificar();
			  }
		    }
          }
         }
      
        enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaEntregaInsumo.jsp&titulo=Listado Entrega de Insumos";
        enviara = enviara + "&filordenfabricacion="+filordenfabricacion;
        enviara = enviara + "&seleccion="+ordenfabricacion;    
		enviara = enviara + "&mensaje="+mensaje;
		
      } 
	    
	    
	    
	    
	    //HttpSession session = httpservletrequest.getSession();
		//session.invalidate();				       
	    
	    httpservletresponse.sendRedirect(enviara);
        
//httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=FilProducto.jsp&titulo=Filtrado de Productos");
//RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
//requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}