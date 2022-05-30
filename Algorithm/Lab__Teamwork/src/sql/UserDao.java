package sql;
import sql.UserBean;
import java.sql.*; // 导入java的sql包
import java.util.ArrayList;
import java.util.List;


public class UserDao {
    String driverName = "com.mysql.jdbc.Driver";    //驱动程序名
    String userName = "root";      //数据库用户名
    String userPasswd = "admin";    //密码
    String dbName = "volunteer_db";       //数据库名
    String table_name1 = "user_info";  //表名
    String table_name2 = "volunteer_group";
    String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd;//联结字符串

    public List getAllUserInfo(){
        List<UserBean> users = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);     //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String sql="select * from " + table_name1 + "," + table_name2 + " WHERE " + table_name1 + ".Uno= " + table_name2 + ".Uno";
            rs = stmt.executeQuery(sql);                  //获得数据结果集合
            while(rs.next())                                        //依次遍历结果集（表中的记录）
            {
                // 创建新的一个user对象，赋值后放入数组中
                UserBean user = new UserBean();
                user.setUno(rs.getString("Uno"));
                user.setUemail(rs.getString("Uemail"));
                user.setUpassword(rs.getString("Upassword"));
                user.setUclass(rs.getInt("Uclass"));
                user.setUname(rs.getString("Uname"));
                user.setUid(rs.getString("Uid"));
                user.setUbirth(rs.getString("Ubirth"));
                user.setUage(rs.getInt("Uage"));
                user.setUsex(rs.getString("Usex"));
                user.setUweight(rs.getDouble("Uweight"));
                user.setUheight(rs.getDouble("Uheight"));
                user.setUtel(rs.getString("Utel"));
                user.setUstate(rs.getInt("Ustate"));
                user.setUintro(rs.getString("Uintro"));
                user.setGno(rs.getString("Gno"));
                user.setGname(rs.getString("Gname"));
                user.setLno(rs.getString("Lno"));
                users.add(user);
            }
            return users;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                //关闭连接
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                return users;
            }

        }
    }

    public UserBean getUserInfoById(String Uno){
        UserBean user = new UserBean();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);     //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String sql="SELECT * FROM "+table_name1+" RIGHT JOIN "+table_name2+" ON "+table_name1+".Uno = "+table_name2+".Uno WHERE "+table_name1+".Uno = '"+Uno+"'";
            rs = stmt.executeQuery(sql);                  //获得数据结果集合
            while(rs.next())                                        //依次遍历结果集（表中的记录）
            {
                // 创建新的一个user对象，赋值
                user.setUno(rs.getString("Uno"));
                user.setUemail(rs.getString("Uemail"));
                user.setUpassword(rs.getString("Upassword"));
                user.setUclass(rs.getInt("Uclass"));
                user.setUname(rs.getString("Uname"));
                user.setUid(rs.getString("Uid"));
                user.setUbirth(rs.getString("Ubirth"));
                user.setUage(rs.getInt("Uage"));
                user.setUsex(rs.getString("Usex"));
                user.setUweight(rs.getDouble("Uweight"));
                user.setUheight(rs.getDouble("Uheight"));
                user.setUtel(rs.getString("Utel"));
                user.setUstate(rs.getInt("Ustate"));
                user.setUintro(rs.getString("Uintro"));
                user.setGno(rs.getString("Gno"));
                user.setGname(rs.getString("Gname"));
                user.setLno(rs.getString("Lno"));
            }
            return user;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                //关闭连接
                rs.close();
                stmt.close();
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                return user;
            }

        }
    }

    public UserBean getUserInfoByEmail(String email){
        UserBean user = new UserBean();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);     //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String sql="SELECT * FROM " + table_name1 + " where Uemail = '" + email + "'";
            rs = stmt.executeQuery(sql);                  //获得数据结果集合
            while(rs.next())                                        //依次遍历结果集（表中的记录）
            {
                // 创建新的一个user对象，赋值
                user.setUno(rs.getString("Uno"));
                user.setUemail(rs.getString("Uemail"));
                user.setUpassword(rs.getString("Upassword"));
                user.setUname(rs.getString("Uname"));
            }
            return user;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                //关闭连接
                rs.close();
                stmt.close();
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                return user;
            }

        }
    }
}
