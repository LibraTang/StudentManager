package Student;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class searchInfo extends HttpServlet {
    static final String DB_URL = "jdbc:mysql://localhost/students" + "?serverTimezone=GMT%2B8" + "&useSSL=false";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql;
        ResultSet rs = null;

        List<Map> list = new ArrayList<>();

        try {
            Class.forName(context.getInitParameter("JDBC_DRIVER"));
            conn = DriverManager.getConnection(DB_URL, context.getInitParameter("USER"), context.getInitParameter("PASS"));

            sql = "SELECT * FROM INFORMATION WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, req.getParameter("id")); //从表单得到id
            rs = pstmt.executeQuery();

            toList(rs, list); //将结果存入list

            req.setAttribute("list", list);
            req.getRequestDispatcher("/information.jsp").forward(req, resp); //转至search2jsp并传递参数

            rs.close();
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

    //将结果通过map存入一个list中
    static void toList(ResultSet rs, List<Map> list) throws SQLException {
        while(rs.next()) {
            String id = rs.getString("id");
            String name = rs.getString("name");
            String sex = rs.getString("sex");
            String age = rs.getString("age");
            String college =rs.getString("college");
            String major = rs.getString("major");
            String phone = rs.getString("phone");

            Map map = new HashMap();
            map.put("id", id);
            map.put("name", name);
            map.put("sex", sex);
            map.put("age", age);
            map.put("college", college);
            map.put("major",major);
            map.put("phone", phone);

            list.add(map);

            for(Map map1 : list) {
                System.out.println(map1);
            }

        }
    }
}
