package cl.laPalmera.graba;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class GrabaServlet extends HttpServlet {

   public GrabaServlet()
   {
   }

   public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
      throws IOException, ServletException {
      
      /*Boolean correo = false;	    
	  Mail mail = new Mail();
	  if (mail.leer("bodeguero").length() > 0)
	  {
	      correo = true;   
	  }else{
	      correo = false;
	  }*/
	    
	   
	  /*enviara = "http://localhost:8080/LaPalmera/jsp/Respuesta.jsp?destino=&titulo=correcto&mail="+correo;
	  httpservletresponse.sendRedirect(enviara);*/		
	  
	  	
	  	//FileInputStream in = new FileInputStream(new File(m_fileName));  
	  	   
      	URL url = new URL("http://localhost:8080/LaPalmera/jsp/mail/bodeguero.mail");  
		URLConnection conn = url.openConnection();  
 		conn.setDoOutput(true);  
 		conn.setDoInput(true);  
 		
 		FileInputStream in = new FileInputStream("C:\\bodeguero.mail");  
 		OutputStream dos = conn.getOutputStream();  
 		byte[] buffer = new byte[2048];  
		   
 		int readLength;  
 		while ((readLength = in.read(buffer)) != -1) {  
     		dos.write(buffer, 0, readLength);  
     		dos.flush();  
 		}
 		
 		String enviara = "";
 		enviara = "http://localhost:8080/LaPalmera/jsp/Respuesta.jsp?destino=&titulo=correcto&mail=";
	  	httpservletresponse.sendRedirect(enviara);
   	}             
}

		/*FileOutputStream fichero = new FileOutputStream(
                "d:/" + unaParte.getFileName());
        InputStream imagen = unaParte.getInputStream();
        byte[] bytes = new byte[1000];
        int leidos = 0;

        while ((leidos = imagen.read(bytes)) > 0)
        {
            fichero.write(bytes, 0, leidos);
        }*/