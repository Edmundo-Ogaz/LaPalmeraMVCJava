package cl.laPalmera.elimina;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.laPalmera.DTO.ClienteDTO;

public class EliminaCliente extends HttpServlet
{

    public EliminaCliente()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
       String opcion = httpservletrequest.getParameter("Enviar");
       String filrut = httpservletrequest.getParameter("filrut");
       String filnombre = httpservletrequest.getParameter("filnombre");
       String fildireccion = httpservletrequest.getParameter("fildireccion");
       String filcomuna = httpservletrequest.getParameter("filcomuna");
       String filtelefono = httpservletrequest.getParameter("filtelefono");
       String filfechanacimiento = httpservletrequest.getParameter("filfechanacimiento");
       String filemail = httpservletrequest.getParameter("filemail");
       String filpaginaweb = httpservletrequest.getParameter("filpaginaweb");
       String filtipocliente = httpservletrequest.getParameter("filtipocliente");
       String filobservacion = httpservletrequest.getParameter("filobservacion");
       String enviara = "";
	   
	   if (opcion.equals("Eliminar"))
	     { 
	     enviara = "http://localhost:8080/LaPalmera/jsp/UsoSistema.jsp?destino=ListaCliente.jsp&titulo=Listado  Cliente";
         enviara = enviara + "&filrut="+filrut;
         enviara = enviara + "&filnombre="+filnombre; 
         enviara = enviara + "&fildireccion="+fildireccion;
         enviara = enviara + "&filcomuna="+filcomuna; 
         enviara = enviara + "&filtelefono="+filtelefono;
         enviara = enviara + "&filfechanacimiento="+filfechanacimiento; 
         enviara = enviara + "&filemail="+filemail;
         enviara = enviara + "&filpaginaweb="+filpaginaweb; 
         enviara = enviara + "&filtipocliente="+filtipocliente;
         enviara = enviara + "&filobservacion="+filobservacion;
         
         ClienteDTO cliente = new ClienteDTO();
         cliente.setRutCliente(httpservletrequest.getParameter("seleccion"));
         cliente.eliminar();
         } 
	          
		httpservletresponse.sendRedirect(enviara);
    }
}