package cl.laPalmera.control;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import unab.com.Mail;
import cl.laPalmera.DTO.UsuarioDTO;

public class ControlUsuario extends HttpServlet {
	
	private static final Logger LOGGER = Logger.getLogger(ControlUsuario.class);
	
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
    	LOGGER.debug("ControlUsuario.doGet");
    	String enviara = "";
    	Boolean correo = new Boolean(false);
    	HttpSession sesion=request.getSession();
    	/*if (sesion.isNew()) {
            //enviara = "http://localhost:8080/LaPalmera/jsp/SinSesion.jsp";
            enviara = "/jsp/SinSesion.jsp";
  			RequestDispatcher envio = getServletContext().getRequestDispatcher(enviara);
			envio.forward(request, response);		
    	} else {*/
    	    String boton = request.getParameter("Enviar");
    	    enviara= "http://localhost:8080/LaPalmera/jsp/Invalido.jsp";
    	    String username = request.getParameter("username");
    	    String password = request.getParameter("password");
    	    UsuarioDTO usuario = new UsuarioDTO();	
    	    usuario.setLoginUsuario(username);
    	    usuario.setPasswordUsuario(password);
    	    if (usuario.validaUsuario()) 
    	    {
    	        if (usuario.getLoginUsuario().equals("bodeguero")) {
				    Mail mail = new Mail();
				    if (mail.leer("bodeguero").length() > 0) {
				        correo = Boolean.TRUE;         	
				    } else {
				        correo = Boolean.FALSE;
				    }
				}			   				      
				enviara = "http://localhost:8080/LaPalmera/jsp/pagina_inicio.jsp?mail="+correo;
                sesion.setAttribute("usuario",usuario);
            }
    	    else 
    	    {
    	    	LOGGER.debug("Usuario no encontrado");
    	    }
    	/*}*/        
	    response.sendRedirect(enviara);
	}   

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
    	LOGGER.debug("ControlUsuario.doPost");
    	doGet(request, response);
	}
}

