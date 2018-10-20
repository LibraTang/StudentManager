package Students;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class deleteInfo extends HttpServlet {

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

            sql = "DELETE FROM information WHERE id=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, req.getParameter("id")); //要修改
            pstmt.executeUpdate();

            resp.sendRedirect("success.jsp");

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstmt != null) {
                    pstmt.close();
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
}
