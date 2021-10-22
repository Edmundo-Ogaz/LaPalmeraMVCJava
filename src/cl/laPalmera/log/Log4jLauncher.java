package cl.laPalmera.log;

import java.net.URL;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.xml.DOMConfigurator;

public class Log4jLauncher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		System.out.println("_________________________" + config.getInitParameter("nombre-app") + "_________________________");
		URL url= this.getClass().getResource("/Log_LaPalmera.xml");
		DOMConfigurator.configure(url);
	}

	/** Destruye el servlet.
	 */
	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) {
	}

}
