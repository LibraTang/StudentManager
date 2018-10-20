package Users;

import java.sql.SQLException;

public class Proxy implements iUser {
    private databaseConnection dbc = null;
    private iUser iuser = null;

    public Proxy() {
        dbc = new databaseConnection(); //实例化数据库连接
        iuser = new findUser(dbc.getConn()); //实例化接口
    }

    @Override
    public boolean findLogin(User user) throws SQLException {
        boolean flag = false;
        flag = iuser.findLogin(user);

        dbc.close();

        return flag;
    }
}
