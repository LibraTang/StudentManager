package Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class findUser implements iUser{
    private Connection conn = null;
    private PreparedStatement pstmt = null;

    //设置数据库连接
    public findUser(Connection conn) {
        this.conn = conn;
    }

    //验证用户名和密码，若验证成功则返回用户名
    @Override
    public boolean findLogin(User user) throws SQLException {
        boolean flag = false;
        String sql;
        ResultSet rs = null;

        sql = "SELECT name FROM information WHERE name=? and password=?";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getPassword());

        rs = pstmt.executeQuery(); //得到结果

        if(rs.next()) {
            flag = true;
        }

        pstmt.close();

        return  flag;
    }
}
