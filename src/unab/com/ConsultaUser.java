package unab.com;

public class ConsultaUser
{
   static int validador = 0;
   static 
   static 
   static 

   //public static void main(String[] args) throws Exception
   public static int consultaruser(String username, String passwordbd) throws Exception
   {
      
      try
      {
         ConnectionLaPalmera connLaPalmera = new ConnectionLaPalmera();
         Connection conn = connLaPalmera.conectionMySql();


         if (conn != null)
         {
            Statement stmt = conn.createStatement();
            ResultSet res  = stmt.executeQuery("SELECT * FROM usuario");

            //System.out.println("\nNOMBRE \t\t EMAIL \t\t\t TELEFONO \n");

            while(res.next())
            {
               String login = res.getString("loginusuario");
               String rut = res.getString("rutfuncionario");
               String passwordusuario = res.getString("passwordusuario");

               
               //if ((login.equals("administrador")) && (password.equals("jochua"))){
               if ((login.equals(username)) && (passwordusuario.equals(passwordbd))){	
               validador = 1;
               //System.out.println("usario registrado");
              }
            }
            
            //System.out.println("no usario registrado");

            res.close();
            stmt.close();
            conn.close();
         }
       }
       catch(SQLException ex)
       {
          System.out.println(ex);
       }
       catch(ClassNotFoundException ex)
       {
          System.out.println(ex);
       }
       return validador;
   }
}