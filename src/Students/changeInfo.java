package Students;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class changeInfo extends HttpServlet {
    static final String DB_URL = "jdbc:mysql://localhost/students" + "?serverTimezone=GMT%2B8" + "&useSSL=false";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql;

        try {
            Class.forName(context.getInitParameter("JDBC_DRIVER"));
            conn = DriverManager.getConnection(DB_URL, context.getInitParameter("USER"), context.getInitParameter("PASS"));

            sql = "UPDATE information SET id=?, name=?, sex=?, age=?, college=?, major=?, phone=? WHERE id=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, req.getParameter("id"));
            pstmt.setString(2, req.getParameter("name"));
            pstmt.setString(3, req.getParameter("sex"));
            pstmt.setString(4, req.getParameter("age"));
            pstmt.setString(5, req.getParameter("college"));
            pstmt.setString(6, req.getParameter("major"));
            pstmt.setString(7, req.getParameter("phone"));
            pstmt.setString(8, req.getParameter("id"));

            pstmt.executeUpdate();

            resp.sendRedirect("success.jsp");

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if(pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
