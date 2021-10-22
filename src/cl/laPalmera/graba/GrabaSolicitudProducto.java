package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import unab.com.Mail;
import cl.laPalmera.DTO.CabezaPedidoDTO;
import cl.laPalmera.DTO.ConfirmacionPedidoDTO;
import cl.laPalmera.DTO.DespachoPedidoDTO;
import cl.laPalmera.DTO.DetallePedidoDTO;
import cl.laPalmera.DTO.InsumoDTO;
import cl.laPalmera.DTO.OrdenFabricacionDTO;
import cl.laPalmera.DTO.ProductoLineaDTO;
import cl.laPalmera.DTO.ProgramaProduccionDTO;
import cl.laPalmera.DTO.StockDTO;

public class GrabaSolicitudProducto extends HttpServlet
{

    public GrabaSolicitudProducto()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
        {
            
            int query = 1;
            boolean rollback = false;
            String mensaje = "";
            String opcion = httpservletrequest.getParameter("Enviar");
      		String enviara = "";
	      	if (opcion.equals("Enviar Pedido"))
	        { 
	          String numeropedido = "";
	          CabezaPedidoDTO cabezaPedido = new CabezaPedidoDTO();
	          DetallePedidoDTO detallePedido = new DetallePedidoDTO();
	          DespachoPedidoDTO despachoPedido = new DespachoPedidoDTO();
	          ConfirmacionPedidoDTO confirmacionPedido = new ConfirmacionPedidoDTO();
	          StockDTO stock = new StockDTO();
	          OrdenFabricacionDTO ordenFabricacion = new OrdenFabricacionDTO();
	          ProgramaProduccionDTO programaProduccion= new ProgramaProduccionDTO();
	                 	      
	          //CabezaPedido cabezaPedido = new CabezaPedido();
			  cabezaPedido.setNombreCliente("Pastelería La Palmera");
			  cabezaPedido.setFechaPedido(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
			  cabezaPedido.setHoraPedido(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
			  cabezaPedido.setPrecioTotalPedido("0");
			  cabezaPedido.setConfirmacionPedido("C");
			  cabezaPedido.setDedicatoriaPedido(httpservletrequest.getParameter("dedicatoria"));
			  cabezaPedido.setObservacionPedido(httpservletrequest.getParameter("comentario"));
			  //cabezaPedido.grabar();
			  query = cabezaPedido.grabar();
			  if (query == 0){
			     rollback = true;				
			  }else{
			     numeropedido = cabezaPedido.buscarUltimo();
			  }
			  			   
			  int i = Integer.parseInt(httpservletrequest.getParameter("ultimafilaproducto"));
        		for(int j = 1; j < i; j++)
        		{
				  //DetallePedido detallePedido = new DetallePedido();
				  detallePedido.setNumeroPedido(numeropedido);
				  detallePedido.setCodigoProducto(httpservletrequest.getParameter("producto" + j));
				  detallePedido.setPrecioProducto("0");
				  detallePedido.setCantidadProducto(httpservletrequest.getParameter("cantidadproducto" + j));
				  //detallePedido.grabar();
				  if (rollback == false){
				     query = detallePedido.grabar();
	 			     if (query == 0){
	 			        rollback = true;
				     }
				   }  
				}
			
			//DespachoPedido despachoPedido = new DespachoPedido();
			despachoPedido.setNumeroPedido(numeropedido);
			despachoPedido.setDireccionDespacho("Venta");
			despachoPedido.setFechaEntregaDespacho(httpservletrequest.getParameter("fechaentrega"));
			despachoPedido.setHoraEntregaDespacho(httpservletrequest.getParameter("horaentrega"));
			//despachoPedido.grabar();
		    if (rollback == false){
		       query = despachoPedido.grabar();
	 		   if (query == 0){
	 		   	  rollback = true;	
			   }
			}
			    
			//ConfirmacionPedido confirmacionPedido = new ConfirmacionPedido();
			confirmacionPedido.setNumeroPedido(numeropedido);
			confirmacionPedido.setNombreCliente("Pastelera La Palmera");
			confirmacionPedido.setApellidoCliente("Pastelera La Palmera");
			confirmacionPedido.setDireccionCliente("Ventas");
			confirmacionPedido.setTelefonoCliente("268898");
			//confirmacionPedido.grabar();
	        if (rollback == false){
	           query = confirmacionPedido.grabar();
	 		   if (query == 0){
	 		      rollback = true;	
	           }
	        }   
	                		
			int h = Integer.parseInt(httpservletrequest.getParameter("ultimafilaproducto"));
        	for(int j = 1; j < h; j++)
        	{
        		
			//OrdenFabricacion ordenFabricacion = new OrdenFabricacion();
			ordenFabricacion.setCodigoOrdenFabricacion(numeropedido+"-"+String.valueOf(j));
			ordenFabricacion.setFechaIngresoOrdenFabricacion(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
			ordenFabricacion.setHoraIngresoOrdenFabricacion(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
			ordenFabricacion.setNumeroPedido(numeropedido); 
			ordenFabricacion.setCodigoProducto(httpservletrequest.getParameter("producto"+j));
			ordenFabricacion.setCantidadProducto(httpservletrequest.getParameter("cantidadproducto"+j));
			//ordenFabricacion.grabar();
        	if (rollback == false){
        	   query = ordenFabricacion.grabar();
	 		   if (query == 0){
	 		      rollback = true;
        	   }
        	}
       	   
        	//ProgramaProduccion programaProduccion= new ProgramaProduccion();
			programaProduccion.setCodigoOrdenFabricacion(numeropedido+"-"+String.valueOf(j));
			programaProduccion.setFechaProgramaProduccion(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
			programaProduccion.setHoraProgramaProduccion(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
			programaProduccion.setCodigoProducto(httpservletrequest.getParameter("producto"+j)); 
			
			ProductoLineaDTO productoLinea = new ProductoLineaDTO();
			productoLinea.setCodigoProducto(httpservletrequest.getParameter("producto"+j));
			if (productoLinea.buscar())
			  {
				String lineaproduccion = productoLinea.getCodigoLineaProduccion();
				programaProduccion.setCodigoLineaProduccion(lineaproduccion);
			  }
			
			programaProduccion.setCantidadProgramada(httpservletrequest.getParameter("cantidadproducto"+j));
			programaProduccion.setCantidadFabricada("0");
			programaProduccion.setSaldoPorFabricar(httpservletrequest.getParameter("cantidadproducto"+j));
			programaProduccion.setEstadoOrdenFabricacion("A");
			//programaProduccion.grabar();
        	if (rollback == false){
        	   query = programaProduccion.grabar();
	 		   if (query == 0){
	 		      rollback = true;
  			   }
  			}   	      	
       	
        	}
        	        	
            int filai = Integer.parseInt(httpservletrequest.getParameter("ultimafilaproducto"));
        	for(int k = 1; k < filai; k++)
        	{
        	int filaj = Integer.parseInt(httpservletrequest.getParameter("ultimafila"+k));
        	for(int j = 1; j <= filaj; j++)
        	{
        	//Stock stock = new Stock();
			stock.setCodigoProducto(httpservletrequest.getParameter("insumo"+k+""+j));
			if (stock.buscar())
			{
			  String stockdisponible = String.valueOf(Float.parseFloat(stock.getStockDisponible())-Float.parseFloat(httpservletrequest.getParameter("cantidadinsumo"+k+""+j)));
			  stock.setStockDisponible(stockdisponible);
			  String stockcomprometido = String.valueOf(Float.parseFloat(stock.getStockComprometido())+Float.parseFloat(httpservletrequest.getParameter("cantidadinsumo"+k+""+j)));
			  stock.setStockComprometido(stockcomprometido);
			  //stock.modificar();
			  if (rollback == false){
			     query = stock.modificar();
	 		     if (query == 0){
	 		        rollback = true;
			     }
			  }   
			  InsumoDTO insumo = new InsumoDTO();
			  insumo.setCodigoInsumo(httpservletrequest.getParameter("insumo"+k+""+j));
			  if (insumo.buscar())
			  {
			  	if (Float.parseFloat(stockdisponible) <= Float.parseFloat(insumo.getStockCriticoInsumo()))
			  	{
			  		Mail mail = new Mail();
			  		mail.enviar("bodeguero","Stock Critico "+insumo.getNombreInsumo());
			  	    mensaje = mensaje + insumo.getNombreInsumo()+" Producto con Stock Critico \\n";
			  	}
			  }
			}
        	}
        	}
            
            
            if ((rollback == true) && (!numeropedido.equals(""))) {
               cabezaPedido.setNumeroPedido(numeropedido);
               cabezaPedido.eliminar();
               detallePedido.setNumeroPedido(numeropedido);
               detallePedido.eliminar();
               despachoPedido.setNumeroPedido(numeropedido);
               despachoPedido.eliminar();
               confirmacionPedido.setNumeroPedido(numeropedido);
               confirmacionPedido.eliminar();
               //stock.eliminar();
               int hh = Integer.parseInt(httpservletrequest.getParameter("ultimafilaproducto"));
        	   for(int jj = 1; jj < hh; jj++)
        	   {
                  ordenFabricacion.setCodigoOrdenFabricacion(numeropedido+"-"+String.valueOf(jj));
                  ordenFabricacion.eliminar();
                  programaProduccion.setCodigoOrdenFabricacion(numeropedido+"-"+String.valueOf(jj));
                  programaProduccion.eliminar();	
               }
            }
            	
	        
	        enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaSolicitudProducto.jsp&titulo=Listado Solicitud Producto";     
       	    enviara = enviara + "&filnumeropedido="+numeropedido;
            enviara = enviara + "&mensaje="+mensaje;	        
	     }           
		
		
		HttpSession session = httpservletrequest.getSession();
		session.removeAttribute("arraySolicitudProducto");
					      
		httpservletresponse.sendRedirect(enviara);	
        
    }
}