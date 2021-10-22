package cl.laPalmera.graba;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.FuncionarioDTO;

public class GrabaFuncionario extends HttpServlet
{

    public GrabaFuncionario()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filrut = httpservletrequest.getParameter("filrut");
        String filnombre = httpservletrequest.getParameter("filnombre");
        String filapellidopaterno = httpservletrequest.getParameter("filapellidopaterno");
        String filapellidomaterno = httpservletrequest.getParameter("filapellidomaterno");
        String filcargo = httpservletrequest.getParameter("filcargo");
        String filarea = httpservletrequest.getParameter("filarea");
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaFuncionario.jsp&titulo=Listado Funcionario";
	      enviara = enviara + "&filrut="+filrut;
          enviara = enviara + "&filnombre="+filnombre;
          enviara = enviara + "&filapellidopaterno="+filapellidopaterno;
          enviara = enviara + "&filapellidomaterno="+filapellidomaterno;
          enviara = enviara + "&filcargo="+filcargo;
          enviara = enviara + "&filarea="+filarea;
	    
	      FuncionarioDTO funcionario = new FuncionarioDTO();
          funcionario.setRutFuncionario(httpservletrequest.getParameter("rut"));
          funcionario.setNombreFuncionario(httpservletrequest.getParameter("nombre"));
          funcionario.setApellidoPaternoFuncionario(httpservletrequest.getParameter("apellidopaterno"));
          funcionario.setApellidoMaternoFuncionario(httpservletrequest.getParameter("apellidomaterno"));
          funcionario.setCodigoCargo(httpservletrequest.getParameter("cargo"));
          funcionario.setCodigoArea(httpservletrequest.getParameter("area"));
          funcionario.grabar();
          } 
	                   
            
            						       
		httpservletresponse.sendRedirect(enviara);


        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/funcionario.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}