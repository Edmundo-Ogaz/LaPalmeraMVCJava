package unab.com;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class Leer
{
public static String leer(String mensaje)
    {
     String lectura ="";
     //leyendo de teclado
	InputStreamReader flujo = new InputStreamReader(System.in);
	BufferedReader texto = new BufferedReader(flujo);
	try
		{	if (!mensaje.equals(""))
			   System.out.println(mensaje);
			lectura = texto.readLine();	
		} catch (IOException e)
			{System.out.println("Error de lectura");
			}
     return lectura;
     }
 }		