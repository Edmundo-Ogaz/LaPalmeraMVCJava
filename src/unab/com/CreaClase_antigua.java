package unab.com;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Vector;
public class CreaClase_antigua
{
public static String ponenombrefuncion(String valor)
  {
    String resultado=valor;
    if (valor.substring(0,1).equals("a"))
	resultado = "A"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("b"))
	resultado = "B"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("c"))
	resultado = "C"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("d"))
	resultado = "D"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("e"))
	resultado = "E"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("f"))
	resultado = "F"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("g"))
	resultado = "G"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("h"))
	resultado = "H"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("i"))
	resultado = "I"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("j"))
	resultado = "J"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("k"))
	resultado = "K"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("l"))
	resultado = "L"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("m"))
	resultado = "M"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("n"))
	resultado = "N"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("o"))
	resultado = "O"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("p"))
	resultado = "P"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("q"))
	resultado = "Q"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("r"))
	resultado = "R"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("s"))
	resultado = "S"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("t"))
	resultado = "T"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("u"))
	resultado = "U"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("v"))
	resultado = "V"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("w"))
	resultado = "W"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("x"))
	resultado = "X"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("y"))
	resultado = "Y"+valor.substring(1,valor.length());
    if (valor.substring(0,1).equals("z"))
	resultado = "Z"+valor.substring(1,valor.length()-1);
    return resultado;
   }
public static void main(String args[]) {
	Vector vec = new Vector();
	String nombreClase = "";
	nombreClase = Leer.leer("ingrese nombre de clase:");
	System.out.println("Ingrese nombre de campo y tipo de datos asociado en Base de Datos");
	System.out.println("Para finalizar ingrese #");
	String nombre ="";
	String tipodato ="";
	nombre = Leer.leer("ingrese nombre de campo:");
	while (!nombre.equals("#"))
         {
	 tipodato = Leer.leer("ingrese tipo de campo (i entero, d fecha, s texto:");
	 Elementos e = new Elementos();
	 e.setNombre(nombre);
	 e.setTipoDeDatos(tipodato);
	 vec.addElement(e);
	 nombre = Leer.leer("ingrese nombre de campo:");
         }
	//Crea Clase
        try 
	 {
	  FileWriter flujosa = new FileWriter(nombreClase+".java");
	  BufferedWriter lineasalida = new BufferedWriter(flujosa);
	  lineasalida.write("import java.sql.*;");
          lineasalida.newLine();
	  lineasalida.write("class "+nombreClase);
          lineasalida.newLine();
	  lineasalida.write("  { ");
          lineasalida.newLine();
 	  Enumeration lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();
  	     lineasalida.write("      private String "+e.getNombre()+"=\"\";");
  	     lineasalida.newLine();
   	     lineasalida.flush();	
	    }		

 	  lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();
  	     lineasalida.write("      public void set"+ponenombrefuncion(e.getNombre())+" (String x)");
  	     lineasalida.newLine();
  	     lineasalida.write("        {");
  	     lineasalida.newLine();
  	     lineasalida.write("            "+e.getNombre()+" = x;");
  	     lineasalida.newLine();
  	     lineasalida.write("        }");
  	     lineasalida.newLine();
  	     lineasalida.newLine();
   	     lineasalida.flush();	
	    }	

 	  lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();
  	     lineasalida.write("      public String get"+ponenombrefuncion(e.getNombre())+" ()");
  	     lineasalida.newLine();
  	     lineasalida.write("        {");
  	     lineasalida.newLine();
  	     lineasalida.write("            return "+e.getNombre()+";");
  	     lineasalida.newLine();
  	     lineasalida.write("        }");
  	     lineasalida.newLine();
  	     lineasalida.newLine();
   	     lineasalida.flush();	
	    }

 	     lineasalida.write("      public void grabar()");
  	     lineasalida.newLine();
  	     lineasalida.write("        {");
  	     lineasalida.newLine();
  	     lineasalida.write("      	 try {");
  	     lineasalida.newLine();
  	     lineasalida.write("              Class.forName(\"sun.jdbc.odbc.JdbcOdbcDriver\");");
  	     lineasalida.newLine();
  	     lineasalida.write("              Connection connection =");
  	     lineasalida.write(" DriverManager.getConnection(\"jdbc:odbc:holabase\", \"\", \"\");");
  	     lineasalida.newLine();
  	     lineasalida.write("              Statement s = connection.createStatement();");
  	     lineasalida.newLine();
  	     lineasalida.write("              String sql = \"insert into ");
  	     lineasalida.write(nombreClase +" values (\";");
  	     lineasalida.newLine();

	  int elementos = vec.size();
 	  lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();

	     if (--elementos!= 0)
               {
 	        if (e.getTipoDeDatos().equals("s") || e.getTipoDeDatos().equals("S") || 
		 e.getTipoDeDatos().equals("c") || e.getTipoDeDatos().equals("C"))
		 {
		 lineasalida.write("              ");
	  	 lineasalida.write("sql = sql + \"'\"+"+e.getNombre()+" +\"',\";");
                  }
	        else
		 {
		 lineasalida.write("              ");
	  	 lineasalida.write("sql = sql + "+ e.getNombre()+" +\",\";");
                 }
	        lineasalida.newLine();
		}	
	     else
		{
	         if (e.getTipoDeDatos().equals("s") || e.getTipoDeDatos().equals("S") || 
		 e.getTipoDeDatos().equals("c") || e.getTipoDeDatos().equals("C"))
		  {
		   lineasalida.write("              ");
	  	   lineasalida.write("sql = sql + \"'\"+"+e.getNombre()+" +\"')\";");
	  	   }
	         else
		  {
		   lineasalida.write("              ");
	  	   lineasalida.write("sql = sql + "+ e.getNombre()+" +\")\";");
                   }
		 }
  	     lineasalida.flush();	
	    }
  	     lineasalida.newLine();

  	     lineasalida.write("              int i = s.executeUpdate(sql);");
  	     lineasalida.newLine();
  	     lineasalida.write("              s.close();");
  	     lineasalida.newLine();
  	     lineasalida.write("              connection.close();");
  	     lineasalida.newLine();
  	     lineasalida.write("             }");
  	     lineasalida.newLine();
  	     lineasalida.write("         catch (Exception e) {LOGGER.error(e,e);}");
  	     lineasalida.newLine();
  	     lineasalida.write("        }");
  	     lineasalida.newLine();
             lineasalida.write("  } ");
             lineasalida.newLine();
    	     lineasalida.close();	   
 	} catch (IOException e)
	  {System.out.println("Error de lectura");}
	//Crea Manejador
        try 
	 {
	  FileWriter flujosa = new FileWriter("Manejador"+nombreClase+".java");
	  BufferedWriter lineasalida = new BufferedWriter(flujosa);
	  lineasalida.write("import java.sql.*;");
          lineasalida.newLine();
	  lineasalida.write("import java.util.*;");
          lineasalida.newLine();
	  lineasalida.write("class Manejador"+nombreClase);
          lineasalida.newLine();
	  lineasalida.write("  { ");
          lineasalida.newLine();
 	  Enumeration lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();
  	     lineasalida.write("      private String "+e.getNombre()+"=\"\";");
  	     lineasalida.newLine();
   	     lineasalida.flush();	
	    }		

 	  lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();
  	     lineasalida.write("      public void set"+ponenombrefuncion(e.getNombre())+" (String x)");
  	     lineasalida.newLine();
  	     lineasalida.write("        {");
  	     lineasalida.newLine();
  	     lineasalida.write("            "+e.getNombre()+" = x;");
  	     lineasalida.newLine();
  	     lineasalida.write("        }");
  	     lineasalida.newLine();
  	     lineasalida.newLine();
   	     lineasalida.flush();	
	    }	

 	  lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();
  	     lineasalida.write("      public String get"+ponenombrefuncion(e.getNombre())+" ()");
  	     lineasalida.newLine();
  	     lineasalida.write("        {");
  	     lineasalida.newLine();
  	     lineasalida.write("            return "+e.getNombre()+";");
  	     lineasalida.newLine();
  	     lineasalida.write("        }");
  	     lineasalida.newLine();
  	     lineasalida.newLine();
   	     lineasalida.flush();	
	    }
 	     lineasalida.write("      public Vector listar()");
  	     lineasalida.newLine();
  	     lineasalida.write("        {");
  	     lineasalida.newLine();
  	     lineasalida.write("        Vector vec = new Vector();");
  	     lineasalida.newLine();
  	     lineasalida.write("      	 try {");
  	     lineasalida.newLine();
  	     lineasalida.write("              Class.forName(\"sun.jdbc.odbc.JdbcOdbcDriver\");");
  	     lineasalida.newLine();
  	     lineasalida.write("              Connection connection =");
  	     lineasalida.write(" DriverManager.getConnection(\"jdbc:odbc:holabase\", \"\", \"\");");
  	     lineasalida.newLine();
  	     lineasalida.write("              Statement s = connection.createStatement();");
  	     lineasalida.newLine();
  	     lineasalida.write("              String sql = \"select * from "+nombreClase+" where 1 = 1 \";");
  	     lineasalida.newLine();

 	  lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();
  	     lineasalida.write("              ");
	     lineasalida.write("if (!"+e.getNombre()+".equals(\"\"))");
             lineasalida.newLine();
             if (e.getTipoDeDatos().equals("s") || e.getTipoDeDatos().equals("S") || 
		 e.getTipoDeDatos().equals("c") || e.getTipoDeDatos().equals("C"))
		 {
		 lineasalida.write("              ");
	  	 lineasalida.write("sql = sql +"+ "\"     and "+e.getNombre()+" = '\"+"+e.getNombre()+"+\"'\";");
                  }
	     else
		 {
		 lineasalida.write("              ");
	  	 lineasalida.write("sql = sql +"+ "\"     and "+e.getNombre()+" = \"+"+e.getNombre()+";");                
	         lineasalida.newLine();
		 }
             lineasalida.newLine();
  	     lineasalida.flush();	
	    }
  	     lineasalida.newLine();
  	     lineasalida.write("              ResultSet rs = s.executeQuery(sql);");
  	     lineasalida.newLine();
  	     lineasalida.write("              while (rs.next())");
  	     lineasalida.newLine();
  	     lineasalida.write("                {");
  	     lineasalida.newLine();
  	     lineasalida.write("              "+nombreClase+" puntero = new "+nombreClase+"();");
  	     lineasalida.newLine();
	  int numero = 1;
 	  lista = vec.elements();
	  while (lista.hasMoreElements())
           {
	     Elementos e = (Elementos) lista.nextElement();
	     lineasalida.write("              puntero.set"+ponenombrefuncion(e.getNombre())+"(rs.getString("+numero+"));");
  	     lineasalida.newLine();
	     numero++;
  	     lineasalida.flush();	
	    }
  	     lineasalida.write("              vec.addElement(puntero);");
  	     lineasalida.newLine();
  	     lineasalida.write("                 }");
  	     lineasalida.newLine();
  	     lineasalida.write("           }");
  	     lineasalida.newLine();
  	     lineasalida.write("         catch (Exception e) {LOGGER.error(e,e);}");
  	     lineasalida.newLine();
	     lineasalida.write("               return vec;");
  	     lineasalida.newLine();
  	     lineasalida.write("        }");
  	     lineasalida.newLine();
             lineasalida.write("  } ");
             lineasalida.newLine();


	lineasalida.close();	   
 	} catch (IOException e)
	  {System.out.println("Error de lectura");}

   }	
}