import com.assessment.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/StudentServlet")
public class StudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students = new ArrayList<>();
        students.add(new Student("S1", "Aldo", "Dep 1", 35));
        students.add(new Student("S2", "Budi", "Dep 1", 70));
        students.add(new Student("S3", "Candra", "Dep 1", 60));
        students.add(new Student("S4", "Dudi", "Dep 1", 90));
        students.add(new Student("S5", "Edi", "Dep 2", 30));
        students.add(new Student("S6", "Firman", "Dep 3", 32));
        students.add(new Student("S7", "Gilang", "Dep 3", 70));
        students.add(new Student("S8", "Hilman", "Dep 3", 20));

        request.setAttribute("students", students);

        RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
        dispatcher.forward(request, response);
    }
}