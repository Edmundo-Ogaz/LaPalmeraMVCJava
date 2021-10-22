package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.CargoDTO;

public class ModificaCargo extends HttpServlet
{

    public ModificaCargo()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
      	String filcargo = httpservletrequest.getParameter("filcargo");
      	String enviara = "";
	    
	    if (opcion.equals("Enviar"))
	      { 
	      enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaCargo.jsp&titulo=Listado Cargo";
          enviara = enviara + "&filcargo="+filcargo; 
          
          CargoDTO cargo = new CargoDTO();
          cargo.setCodigoCargo(httpservletrequest.getParameter("codigo"));
          cargo.setNombreCargo(httpservletrequest.getParameter("nombre"));
          cargo.modificar();
          } 
	          
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/cargo.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}