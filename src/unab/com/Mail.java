package unab.com;

import java.io.IOException;
import java.io.RandomAccessFile;

public class Mail {
		
	public void enviar (String usuario, String mensaje )throws IOException
	{
	//public static void main( String args[] ) throws IOException
	//{
    //String mensaje = "Mail2 para el Bodeguero Stock Critico Producto\n";
	//String usuario = "bodeguero";
    
       RandomAccessFile miRAFile;
       String linea = "";
       String fecha = new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date());
	   String hora = new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date());
	   String s = fecha+"\n"+hora+"\n"+mensaje+"\n";		
       s = s + "---------------------------------------------------\n";       
       // Abrimos el fichero de acceso aleatorio
       miRAFile = new RandomAccessFile( "c:/Tomcat 5.0/webapps/LaPalmera/jsp/mail/"+usuario+".mail","rw" );
       // Leemos el archivo
       while ( (linea = miRAFile.readLine()) != null) 
        {
           s = s + linea + "\n";
        }
       // Nos vamos al principio del fichero
       miRAFile.seek( 0 );
       // Incorporamos la cadena al fichero     
       miRAFile.writeBytes( s );
       // Cerramos el fichero
       miRAFile.close();
    }
    
    public String leer (String usuario) throws IOException 
    {
       RandomAccessFile miRAFile;
       String linea = "";
       String s = "";
       // Abrimos el fichero de acceso aleatorio
       miRAFile = new RandomAccessFile( "c:/Tomcat 5.0/webapps/LaPalmera/jsp/mail/"+usuario+".mail","r" );
       // Leemos el archivo
       while ( (linea = miRAFile.readLine()) != null) 
       {
           s = s + linea;
       }
       //System.out.print(s);
       return (s);
    }
}
