import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        if (userId.equals("user001") && password.equals("password123")) {
            response.sendRedirect("welcome.jsp");
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            request.setAttribute("error", "Invalid username or password");
            dispatcher.forward(request, response);
        }
    }
}