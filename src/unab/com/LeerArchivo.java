package unab.com;

import java.io.IOException;
import java.io.RandomAccessFile;

class LeerArchivo {

public static void main( String args[] ) throws IOException 
	//public static void main (String args[] )
	//public void salvaTextoEnFichero(String mensaje)
        //throws FileNotFoundException, MessagingException, IOException
    {
       RandomAccessFile miRAFile;
       String linea = "";
       String s = "";
       // Abrimos el fichero de acceso aleatorio
       miRAFile = new RandomAccessFile( "c:/Tomcat 5.0/webapps/LaPalmera/jsp/mail/bodeguero.mail","r" );
       // Leemos el archivo
       while ( (linea = miRAFile.readLine()) != null) 
       {
           s = s + linea + "\n";
       }
       System.out.print(s);
       
        /*String mensaje = "hola";
        FileInputStream fichero = new FileInputStream("c:/bodeguero.html");
        byte b[] = new byte[1024];
        int i;
        i = fichero.read( b );
        String s;
        s = new String( b,0 );
        s = s.trim();
        System.out.print(s);
        System.out.print(s.length());
        */
    }
}


