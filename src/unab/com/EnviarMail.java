
/*
 * Fichero: EnviarMail.java
 * Autor: Chuidiang
 * Fecha: 5/04/07 18:14
 */
//package chuidiang.ejemplos.mail;
package unab.com;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 * Ejemplo de envio de correo simple con JavaMail
 *
 * @author Chuidiang
 *
  */
public class EnviarMail
{
    /**
     * main de prueba
     * @param args Se ignoran.
     */
    //public static void main(String[] args)
    public void stockCritico(String insumo) 
    {
        try
        {
            // Propiedades de la conexin
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", "e.jeshua@gmail.com");
            props.setProperty("mail.smtp.auth", "true");

            // Preparamos la sesion
            Session session = Session.getDefaultInstance(props);

            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("yo@yo.com"));
            message.addRecipient(Message.RecipientType.TO,new InternetAddress("e.jeshua@gmail.com"));
            message.setSubject("Hola");
            message.setText("Stock Critico " + insumo );

            // Lo enviamos.
            Transport t = session.getTransport("smtp");
            t.connect("e.jeshua@gmail.com", "jochua");
            t.sendMessage(message, message.getAllRecipients());

            // Cierre.
            t.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
