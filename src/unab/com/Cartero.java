//Esto es un servlet que manda un email, autentificandose como POP antes de enviarlo:
//Cartero.java
package unab.com;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class Cartero{
  
  //public static void main(String[] args){
  //public static boolean enviarMensaje(String destinatario,String asunto,String cuerpo){
  public boolean enviarMensaje(String destinatario,String asunto,String cuerpo){
    //String destinatario = "e.jeshua@gmail.com";
    //String asunto = "asunto";
    //String cuerpo = "cuerpo";		
    try{
      Properties props = new Properties();
      props.setProperty("mail.smtp.host", "smtp.gmail.com");
      props.setProperty("mail.smtp.starttls.enable", "true");
      props.setProperty("mail.smtp.port", "587");
      props.setProperty("mail.smtp.user", "e.jeshua@gmail.com");
      props.setProperty("mail.smtp.auth", "true");
           
      Session sesion = Session.getDefaultInstance(props);
      
      // Tanto el usuario como la clave son de la cuenta de correo que enva el mensaje.
      //sesion.setPasswordAuthentication(new URLName("URL_DOMINIO_DE_ORIGEN"), new PasswordAuthentication("USUARIO_MAIL","CLAVE_MAIL"));
      
      MimeMessage mensaje = new MimeMessage(sesion);
      mensaje.setFrom(new InternetAddress("e.jeshua@gmail.com"));
      mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
      mensaje.setSubject(asunto);
      mensaje.setText(cuerpo);

      try{
        Transport mta = sesion.getTransport("smtp");
        mta.connect("e.jeshua@gmail.com", "jochua");
        try{
            mta.sendMessage(mensaje, mensaje.getAllRecipients());
        }catch(SendFailedException ex){
        	return false;
        	}
        mta.close();
      }catch(Exception ex){
        System.out.println("Cartero: Error al enviar "+ex.toString());
      }
    }catch(Exception ex){
    	return false;
    	}

    return true;
  }
}
