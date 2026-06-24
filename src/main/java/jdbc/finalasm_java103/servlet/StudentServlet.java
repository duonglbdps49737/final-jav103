package jdbc.finalasm_java103.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jdbc.finalasm_java103.entity.Students;
import jdbc.finalasm_java103.helper.XDispcher;
import jdbc.finalasm_java103.helper.XHttp;
import jdbc.finalasm_java103.helper.XParam;
import jdbc.finalasm_java103.helper.XScope;
import jdbc.finalasm_java103.service.StudentService;
import jdbc.finalasm_java103.service.StudentServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet({
        "/detail/*",
        "/list",
        "/change-password",
        "/regiter"
})
public class StudentServlet extends HttpServlet {
    StudentService studentService = new StudentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var path = req.getServletPath();
        if(path.contains("detail")){
            var StudentEmail = XHttp.getStar();
            Students student = studentService.findByEmail(StudentEmail);
            XScope.setRequest("student", student);
            XDispcher.redirect("/auth/student-detail");
        }
         else if(path.contains("list")){
                List<Students> list = studentService.findAll();
                XScope.setRequest("list", list);
                XDispcher.forward("/auth/student-list.jsp");
         }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var path = req.getServletPath();
        var form = XParam.getBean(Students.class);
        var image = XParam.getFile("image", "/uploads/images");
        if (image != null) {
            assert form != null;
            form.setPhoto(image);
        } else {
            assert form != null;
            form.setPhoto(req.getParameter("oldImage"));
        }
        if(path.contains("/regiter")){
            studentService.create(form);
            XDispcher.redirect("/auth/regiter");
        }
        else if(path.contains("/change-password")){
            studentService.update(form);
            XDispcher.redirect("/auth/change-password");
        }
    }
}
