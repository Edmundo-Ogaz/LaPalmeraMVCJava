package unab.com;

public class UserException extends Exception {

  /**
    * 
    */
	private static final long serialVersionUID = -7915341025767883183L;
	
    private String userValue = "null";

    public  String getUserValue() {
    	return userValue;   
    }

    public void setUserValue(String as_value) {
    	if (as_value == null) {
    		as_value="null";
    	}
    	userValue = as_value;
    }

    public String toString() {
    	return (super.toString() + ": El User es " + this.getUserValue());
    }

    public UserException() {}

    public UserException(String msg) {
    	super(msg);
    }

    public UserException(String msg, String as_user) {
    	super(msg); 
    	setUserValue(as_user);
    }
}
