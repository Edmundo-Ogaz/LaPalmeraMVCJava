package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.ProgramaProduccionDTO;


public class ModificaProgramaProduccion extends HttpServlet
{

    public ModificaProgramaProduccion()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
        {
            
            String opcion = httpservletrequest.getParameter("Enviar");
      		String enviara = "";
	      	if (opcion.equals("Enviar"))
	          { 
	          String filordenfabricacion = httpservletrequest.getParameter("filordenfabricacion");
	          String filfechainicio = httpservletrequest.getParameter("filfechainicio");
	          String filfechatermino = httpservletrequest.getParameter("filfechatermino");
	          String fillineaproduccion = httpservletrequest.getParameter("fillineaproduccion");
	          String filestadoprograma = httpservletrequest.getParameter("filestadoprograma");
	          
	          enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaProgramaProduccion.jsp&titulo=Listado Programa Producción";
	          enviara = enviara + "&filordenfabricacion="+filordenfabricacion;
	          enviara = enviara + "&filfechainicio="+filfechainicio;
	          enviara = enviara + "&filfechatermino="+filfechatermino;
	          enviara = enviara + "&fillineaproduccion="+fillineaproduccion;
	          enviara = enviara + "&filestadoprograma="+filestadoprograma;
	          

				ProgramaProduccionDTO programaProduccion= new ProgramaProduccionDTO();
				programaProduccion.setCodigoOrdenFabricacion(httpservletrequest.getParameter("ordenfabricacion"));
				programaProduccion.setFechaProgramaProduccion(httpservletrequest.getParameter("fecha"));
				programaProduccion.setHoraProgramaProduccion(httpservletrequest.getParameter("hora"));
				programaProduccion.setCodigoProducto(httpservletrequest.getParameter("producto")); 
				programaProduccion.setCodigoLineaProduccion(httpservletrequest.getParameter("lineaproduccion"));
				programaProduccion.setCantidadProgramada(httpservletrequest.getParameter("cantidadprogramada"));
				programaProduccion.setCantidadFabricada(httpservletrequest.getParameter("cantidadfabricada"));
								
				int cantidadprogramada = Integer.parseInt(httpservletrequest.getParameter("cantidadprogramada"));
				int cantidadfabricada = Integer.parseInt(httpservletrequest.getParameter("cantidadfabricada"));
				if (cantidadprogramada == cantidadfabricada){
				   programaProduccion.setSaldoPorFabricar("0");
				   programaProduccion.setEstadoOrdenFabricacion("T");
				}else{
				   programaProduccion.setSaldoPorFabricar(httpservletrequest.getParameter("saldoporfabricar"));   
				   programaProduccion.setEstadoOrdenFabricacion(httpservletrequest.getParameter("estado"));
				}
				programaProduccion.modificar();
			  } 

		httpservletresponse.sendRedirect(enviara);	
		//HttpSession session = request.getSession();
		//session.invalidate();				       
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/Fin.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}