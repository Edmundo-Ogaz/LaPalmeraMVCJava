package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.ProgramaProduccionDTO;


public class GrabaProgramaProduccion extends HttpServlet
{

    public GrabaProgramaProduccion()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
        {
            
            String opcion = httpservletrequest.getParameter("Enviar");
      		String enviara = "";
	      	if (opcion.equals("Enviar"))
	          { 
	          enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProgramaOrdenFabricacion.jsp&titulo=Pedidos para Confirmar";
	          

				ProgramaProduccionDTO programaProduccion= new ProgramaProduccionDTO();
				programaProduccion.setCodigoOrdenFabricacion(httpservletrequest.getParameter("ordenfabricacion"));
				programaProduccion.setFechaProgramaProduccion(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
				programaProduccion.setHoraProgramaProduccion(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
				programaProduccion.setCodigoProducto(httpservletrequest.getParameter("producto")); 
				programaProduccion.setCodigoLineaProduccion(httpservletrequest.getParameter("lineaproduccion"));
				//programaProduccion.setRutFuncionario(httpservletrequest.getParameter("funcionario"));
				programaProduccion.setCantidadProgramada(httpservletrequest.getParameter("cantidadprogramada"));
				programaProduccion.setCantidadFabricada("0");
				programaProduccion.setSaldoPorFabricar(httpservletrequest.getParameter("cantidadprogramada"));
				programaProduccion.setEstadoOrdenFabricacion("I");
				programaProduccion.grabar();
				
				
 				} 
	          /*else 
	            { 
	            if (opcion.equals("Volver"))
	              { 
	              enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaPedido.jsp&titulo=Listado Pedidos";
	              } 
	              
	             }*/             
            
            
			
			
			
			//HttpSession session = request.getSession();
			//session.invalidate();				       
		httpservletresponse.sendRedirect(enviara);	
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}