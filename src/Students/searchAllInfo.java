package Students;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class searchAllInfo extends HttpServlet {

    static final String DB_URL = "jdbc:mysql://localhost/students" + "?serverTimezone=GMT%2B8" + "&useSSL=false";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        Connection conn = null;
        Statement stmt = null;
        String sql;
        ResultSet rs;

        List<Map> list = new ArrayList<>();

        try {
            Class.forName(context.getInitParameter("JDBC_DRIVER"));
            conn = DriverManager.getConnection(DB_URL, context.getInitParameter("USER"), context.getInitParameter("PASS"));
            stmt = conn.createStatement();
            sql = "SELECT * FROM INFORMATION";
            rs = stmt.executeQuery(sql);

            searchInfo.toList(rs, list);

            req.setAttribute("list", list);
            req.getRequestDispatcher("/information.jsp").forward(req, resp);

            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if(stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if(conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
