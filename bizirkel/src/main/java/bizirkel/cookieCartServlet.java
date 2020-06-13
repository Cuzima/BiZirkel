package bizirkel;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		String bikeid = request.getParameter("bikeid");
		boolean bikeInsert = true;
		
		for (Cookie bike : request.getCookies()) {
			String abc = bike.getName();
			if (bikeid.equals(abc)) {
				int valueBike = Integer.parseInt(bike.getValue()) + 1;
				String valueBikeNew = valueBike + "";
				bike.setValue(valueBikeNew);
				bikeInsert = false;
				response.addCookie(bike);
			}
		}

		if (bikeInsert) {
			Cookie bike = new Cookie(bikeid, "1");
			bike.setMaxAge(60 * 60 * 24);
			response.addCookie(bike);
		}

//		String date = request.getParameter("date");
//		String startdateString = "";
//		String enddateString = "";
//		Date startdate;
//		Date enddate;
//		if(date != null) {
//			startdateString = date.substring(0, 10);
//			enddateString = date.substring(10, 20);
//			try {
//				startdate = new SimpleDateFormat("yyyy/MM/dd").parse(startdateString);
//				enddate = new SimpleDateFormat("yyyy/MM/dd").parse(enddateString);
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			Cookie dateCookie = new Cookie("date", date);
//			dateCookie.setMaxAge(60 * 60 * 24);
//			response.addCookie(dateCookie);
//		}
		
		String setCk = (String) request.getParameter("setCk");
		request.getSession().setAttribute("decide", setCk);
		//request.setAttribute("decide", setCk);
		request.setAttribute("page", "bikeOverview");
		response.sendRedirect("bikeOverview");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
