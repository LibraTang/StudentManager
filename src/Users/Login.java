package Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        List<String> info = new ArrayList<>(); //用一个list保存登录结果

        if(name == null || name.equals("")) { //用户名格式问题
            info.add("用户名不能为空");
            System.out.println("用户名不能为空");
        }

        if(password == null || password.equals("")) { //密码格式问题
            info.add("密码不能为空");
            System.out.println("密码不能为空");
        }

        if(info.size() == 0) {
            User user = new User();

            user.setName(name);
            user.setPassword(password);

            Proxy proxy = new Proxy();

            try {
                if (proxy.findLogin(user)) {
                    info.add("登录成功");
                }
                else {
                    info.add("登录失败，用户名或密码错误");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        //保存信息并跳转
        req.setAttribute("info", info);
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
