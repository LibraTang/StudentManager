package Users;

import java.sql.SQLException;

public interface iUser {
    //查询是否有这个用户的接口
    public  boolean findLogin(User user) throws SQLException;
}
