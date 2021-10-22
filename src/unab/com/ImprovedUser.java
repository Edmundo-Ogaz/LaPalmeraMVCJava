package unab.com;

public class ImprovedUser extends Object implements java.io.Serializable {

  public ImprovedUser() {}

  private String username;
  private String password;

  public void setUsername(String name) {
    username = name;
  }

  public String getUsername() {
    return username;
  }

  public void setPassword(String pass) {
    password = pass;
  }

  //public void validateUser() throws Exception
   //{
   	//username = Leer.leer("Ingrese Nombre de usuario");
   	//password = Leer.leer("Ingrese su contraseña");
   	//ConsultaUser.consultaruser(username,password);
  //}

  public void validateUser() throws Exception, NullPointerException {
    if (username == null) {
      throw new UserException("no aa ingresado nombre de usuario!", null);
    }

    if (password == null) {
      throw new UserException("no aaa ingresado contraseña!", username);
    }

    /*if (!(username.equals("jochua") && password.equals("jochua"))) {
      throw new UserException("no se pudo validar la contraseña!", username);
    }*/
    int validador = ConsultaUser.consultaruser(username,password);
    if (validador == 0){
    	throw new UserException("nno se pudo validar la contraseña!", username);
    }
  }
}
