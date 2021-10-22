package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.CapturaProduccionDTO;
import cl.laPalmera.DTO.ProduccionFuncionarioDTO;
import cl.laPalmera.DTO.ProgramaProduccionDTO;

public class GrabaCapturaProduccion extends HttpServlet
{

    public GrabaCapturaProduccion()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        
        
        
        String opcion = httpservletrequest.getParameter("Enviar");
      	String ordenfabricacion = httpservletrequest.getParameter("ordenfabricacion");
      	String filordenfabricacion = httpservletrequest.getParameter("filordenfabricacion");
      	String enviara = "";
	    if (opcion.equals("Enviar Captura"))
	    { 
	    enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaCapturaProduccion.jsp&titulo=Listado Captura Producción";
        enviara = enviara + "&seleccion="+ordenfabricacion;
        enviara = enviara + "&filordenfabricacion="+filordenfabricacion;
            
        CapturaProduccionDTO capturaProduccion = new CapturaProduccionDTO();
        
        //capturaProduccion.setCorrelativoProduccion(httpservletrequest.getParameter("ordenfabricacion"));
        capturaProduccion.setCodigoOrdenFabricacion(httpservletrequest.getParameter("ordenfabricacion"));
        capturaProduccion.setFechaCapturaProduccion(new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
        capturaProduccion.setHoraCapturaProduccion(new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date()));
        capturaProduccion.setCodigoProducto(httpservletrequest.getParameter("producto"));
        capturaProduccion.setCantidadProducto(httpservletrequest.getParameter("cantidad"));
        capturaProduccion.setObservacion(httpservletrequest.getParameter("observacion"));
        capturaProduccion.grabar();
            
        String correlativoproduccion = capturaProduccion.buscarUltimo();
            
        ProduccionFuncionarioDTO produccionFuncionario = new ProduccionFuncionarioDTO();
           
        String funcionario = httpservletrequest.getParameter("funcionario");
		if (!funcionario.equals("0"))
          {
           
          produccionFuncionario.setCorrelativoProduccion(correlativoproduccion);
          produccionFuncionario.setRutFuncionario(httpservletrequest.getParameter("funcionario"));
          produccionFuncionario.grabar();
          
          } 
            
            
         int i = Integer.parseInt(httpservletrequest.getParameter("cantidadfuncionario"));
         for(int j = 1; j < i; j++)
           {
            
            produccionFuncionario.setCorrelativoProduccion(correlativoproduccion);
            produccionFuncionario.setRutFuncionario(httpservletrequest.getParameter("funcionario"+j));
            produccionFuncionario.grabar();
            }
            
         ProgramaProduccionDTO programaProduccion = new ProgramaProduccionDTO();
         programaProduccion.setCodigoOrdenFabricacion(httpservletrequest.getParameter("ordenfabricacion"));
         if (programaProduccion.buscar())
           {
			String cantidadfabricada = String.valueOf(Integer.parseInt(programaProduccion.getCantidadFabricada())+Integer.parseInt(httpservletrequest.getParameter("cantidad")));
			String saldoporfabricar = String.valueOf(Integer.parseInt(programaProduccion.getCantidadProgramada())-Integer.parseInt(cantidadfabricada));
			
        	programaProduccion.setCantidadFabricada(cantidadfabricada);
        	programaProduccion.setSaldoPorFabricar(saldoporfabricar);
            if (saldoporfabricar.equals("0"))
              {
          	  programaProduccion.setEstadoOrdenFabricacion("T");
              }
          	programaProduccion.modificar();
            }      
        } 
	    
	    //HttpSession session = httpservletrequest.getSession();
		//session.invalidate();				       
	    
	    httpservletresponse.sendRedirect(enviara);
        
//httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=FilProducto.jsp&titulo=Filtrado de Productos");
//RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
//requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}