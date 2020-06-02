package bizirkel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cookieCartServlet
 */
@WebServlet("/fillCartCookie")
public class cookieCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cookieCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cartitems = request.getParameter("cart");;
		
		Cookie cart = new Cookie("cart", cartitems);
		response.addCookie(cart);
		
		//delete cookie
		cart.setMaxAge(0);
		response.addCookie(cart);
		
		//get cookie
		Cookie cookies[]=request.getCookies();
		cookies[0].getName();
		cookies[0].getValue();
		
		request.setAttribute("decideCart", "true");
		request.setAttribute("page", "impressum");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
