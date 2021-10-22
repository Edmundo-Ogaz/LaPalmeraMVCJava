package cl.laPalmera.modifica;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.ComunaDTO;

public class ModificaComuna extends HttpServlet
{

    public ModificaComuna()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
        String opcion = httpservletrequest.getParameter("Enviar");
        String filcomuna = httpservletrequest.getParameter("filcomuna");
        String filciudad = httpservletrequest.getParameter("filciudad");
       
      	String enviara = "";
	    if (opcion.equals("Enviar"))
	    { 
	    enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaComuna.jsp&titulo=Listado Comuna";
        enviara = enviara + "&filcomuna="+filcomuna;
        enviara = enviara + "&filciudad="+filciudad;   
          
            ComunaDTO comuna = new ComunaDTO();
            comuna.setCodigoComuna(httpservletrequest.getParameter("codigo"));
            comuna.setNombreComuna(httpservletrequest.getParameter("nombre"));
            comuna.setCodigoCiudad(httpservletrequest.getParameter("ciudad"));
            comuna.modificar();
       } 
	          
		httpservletresponse.sendRedirect(enviara);

        //httpservletresponse.sendRedirect("http://localhost:8080/LaPalmera/jsp/comuna.jsp");
        //RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/jsp/home.jsp");
        //requestdispatcher.forward(httpservletrequest, httpservletresponse);
    }
}