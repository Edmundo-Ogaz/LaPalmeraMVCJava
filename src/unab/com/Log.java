package unab.com;
import java.io.IOException;
import java.io.RandomAccessFile;

// Cada vez que ejecutemos este programita, se incorporara una nueva
// linea al fichero de log que se crea la primera vez que se ejecuta
//
class Log {
    public static void main( String args[] ) throws IOException 
    {
    	RandomAccessFile miRAFile;
        String linea = "";
        String fecha = new java.text.SimpleDateFormat("yyy-MM-dd").format(new java.util.Date());
	    String hora = new java.text.SimpleDateFormat("hh:mm:ss").format(new java.util.Date());
	    //String s = "Mail2 para el Bodeguero Stock Critico Producto\n";
		String s = fecha+"\n"+hora+"\n"+"Mail2 para el Bodeguero Stock Critico Producto\n";
		s = s + "---------------------------------------------------\n";
        // Abrimos el fichero de acceso aleatorio
        miRAFile = new RandomAccessFile( "c:/Tomcat 5.0/webapps/LaPalmera/jsp/mail/bodeguero.mail","rw" );
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
    }
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