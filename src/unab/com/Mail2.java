package unab.com;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail2 extends HttpServlet
{

    public Mail2()
    {
    }

    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
        throws IOException, ServletException
    {
    	
	  //configurar las propiedades del envo 
	  //servidor de correo que vamos a utilizar
	  //si el servidor requiere autentificacin 
	  //el tipo de transporte a utilizar	      
      
      //mail.smtp.host, representa el host que hace de servidor de correo
	  //mail.transport.protocol, es el protocolo de comunicacin que queremos utilizar para enviar el correo. En este caso es SMTP, pero podra ser mail.
	  //mail.smtp.auth, indica si se requiere de autentificacin de SMTP.
	  //mail.user, es el usuario de la conexin.
	  //mail.password, el el password de la conexin
      
      Properties props = new Properties();

      props.put("mail.smtp.host","mail.lineadecodigo.com");
	  props.put("mail.transport.protocol","smtp");
	  props.put("mail.smtp.auth", "true");
	  props.setProperty("mail.user", "myuser");
	  props.setProperty("mail.password", "mypwd");
	  
	  //establecer la sesin con el servidor de correo
	  
	  Session mailSession = Session.getInstance(props,null);
	  
	  //Sobre la sesin de correo vamos a crear un mensaje
	  
	  Message msg = new MimeMessage(mailSession);
	  
	  //El mensaje hay que rellenarlo con datos
	  //el subject del mensaje
	  //el usuario destino, 
	  //el texto del mensaje, 
	  
	  
	  msg.setSubject("Mensaje de Lnea de Cdigo");
	  msg.setFrom(new InternetAddress("web@lineadecodigo.com","Lnea de Cdigo"));
 	  msg.addRecipients(Message.RecipientType.TO, new InternetAddress[] { new InternetAddress("miamigo@gmail.com") });
	 	  
	  //setSubject(String) representa el subject del correo
	  //setFrom(Adress) direccin de email para los correos electrnicos
	  //constructor InternetAddress para crear una direccin de email
	  
	  //especificar los destinatarios
	  //addRecipients(Message.RecipientType,Adress[])
	  
	  //setDataHandler(DataHandler) 
	  //El handler tendr el texto que se va a enviar 
	  //y el tipo de codificacin que le queremos aplicar
	  	   
	  DataHandler dh = new DataHandler("Texto del mensaje","text/plain");
	  msg.setDataHandler(dh);
	  
	  //mensaje se enviar mediante la clase Transport. 
	  //send(Message) recibir el mensaje y lo enviar.
	  
	  javax.mail.Transport.send(msg);
    
        

    }
} 