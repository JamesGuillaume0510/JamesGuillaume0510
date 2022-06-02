package assignment.dao;
import assignment.bean.*;
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
    private static final String URL = "jdbc:mysql://localhost:3306/volunteer_db";

    public boolean dengru(String name,String pass){
        Statement stmt = null;
        ResultSet rs = null;
        String sqlValue = "SELECT * FROM volunteer_db.user_info WHERE Uemail='"+ name+"' and Upassword='"+pass+"'";
        try {
            Class.forName(driverName);
            Connection conn = DriverManager.getConnection(URL, "root", "admin");
            assert conn != null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sqlValue);
            while (rs.next()) {
                return true;
            }
            conn.close();
            return false;
        } catch (Exception ex) {
            return false;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException ex) {
                System.out.println("Close Error!!!!!!");//
                ex.printStackTrace();
            }
        }
    }

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
            String sql="SELECT * FROM volunteer_db.user_info right join volunteer_db.volunteer_group vg on user_info.Uno = vg.Uno where user_info.Uno = '" + Uno + "'";
            // System.out.println(sql);
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
            }
            return user;
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
            // String sql="SELECT * FROM volunteer_db.user_info right join volunteer_db.volunteer_group vg on user_info.Uno = vg.Uno where Uemail = '" + email + "'";
            // System.out.println(sql);
            rs = stmt.executeQuery(sql);                  //获得数据结果集合
            while(rs.next())                                        //依次遍历结果集（表中的记录）
            {
                // 创建新的一个user对象，赋值
                user.setUno(rs.getString("Uno"));
                user.setUemail(rs.getString("Uemail"));
                user.setUpassword(rs.getString("Upassword"));
                user.setUname(rs.getString("Uname"));
                user.setUclass(rs.getInt("Uclass"));
                user.setUid(rs.getString("Uid"));
                user.setUbirth(rs.getString("Ubirth"));
                user.setUage(rs.getInt("Uage"));
                user.setUsex(rs.getString("Usex"));
                user.setUweight(rs.getDouble("Uweight"));
                user.setUheight(rs.getDouble("Uheight"));
                user.setUtel(rs.getString("Utel"));
                user.setUstate(rs.getInt("Ustate"));
                //user.setGno(rs.getString("Gno"));
                //user.setGname(rs.getString("Gname"));
                //user.setLno(rs.getString("Lno"));
            }
            return user;
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
                return user;
            }
        }
    }

    public int volunteer_register(String Uno,int Mclass,int Mstate,String Gno){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs1 = null;
        String ManageNo;
        int number = 0;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);      //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String ori_sql = "SELECT Mnum FROM volunteer_db.volunteer_manage ORDER BY Mnum DESC";
            rs1 = stmt.executeQuery(ori_sql);                  //获得数据结果集合
            rs1.next();                                        //依次遍历结果集（表中的记录） number=rs1.getInt("Mnum");

            try {
                number = rs1.getInt("Mnum");
            }catch (SQLException e){
                System.out.println("当前数据库为空");
            }
            //System.out.println("The largest number is :" + number);
            number++;
            String sql = "INSERT INTO volunteer_db.volunteer_manage VALUES(" + number + ",'"+ Uno + "'," + Mclass + "," + Mstate + ",'','" + Gno +"')";
            // System.out.println("");
            // System.out.println(sql);
            // System.out.println("");
            stmt.execute(sql);                       //获得数据结果集合
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                //关闭连接
                if (rs1 != null) {
                    rs1.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return number;
    }

    public Boolean delete_user_by_Uno(String Uno){
        Connection conn = null;
        Statement stmt = null;
        boolean flag = false;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);     //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String sql1="delete from volunteer_db.volunteer_group where Uno='" + Uno + "'";
            String sql2="delete from volunteer_db.volunteer_manage where Uno='" + Uno + "'";
            String sql3="delete from volunteer_db.user_info where Uno='" + Uno + "'";
            flag = stmt.execute(sql1);
            flag = stmt.execute(sql2);
            flag = stmt.execute(sql3);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                //关闭连接
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            return flag;
        }
    }

    public int create_user(String email,String password){
        int flag = 0;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs1 = null;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);      //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String ori_sql = "SELECT Uno FROM volunteer_db.user_info ORDER BY Uno DESC";
            String UserNo = "";
            int number = 0;
            rs1 = stmt.executeQuery(ori_sql);                  //获得数据结果集合
            rs1.next();                                        //依次遍历结果集（表中的记录） number=rs1.getInt("Mnum");
            UserNo = rs1.getString("Uno");
            System.out.println("The largest Uno is :" + UserNo);
            number = Integer.parseInt(UserNo.substring(1));
            number = number+1;
            String Uno;
            if (number<=10){
                Uno = "U0" + number;
            }else {
                Uno = "U" + number;
            }
            // 存入数据
            String sql = "INSERT INTO volunteer_db.user_info (Uno,Uemail,Upassword,Uname,Uclass) VALUES ('" + Uno + "', '" + email +"', '"+ password + "', 'New User',0)";
            flag = stmt.executeUpdate(sql);                       //获得数据结果集合
            System.out.println(flag);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                //关闭连接
                if (rs1 != null) {
                    rs1.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

    public Boolean delete_manage_by_Mnum(String Mnum){
        Connection conn = null;
        Statement stmt = null;
        boolean flag = false;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);     //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String sql="delete from volunteer_db.volunteer_manage where Mnum='" + Mnum + "'";
            flag = stmt.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                //关闭连接
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            return flag;
        }
    }

    public int change_password_by_Uno(String Uno,String password){
        Connection conn = null;
        Statement stmt = null;
        int rs = 0;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);     //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String sql = "update volunteer_db.user_info set Upassword='" + password + "' where Uno='" + Uno +"'";
            rs = stmt.executeUpdate(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                //关闭连接
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            return rs;
        }
    }

    public int change_user_info(UserBean ub){
        Connection conn = null;
        Statement stmt = null;
        int rs = 0;
        try {
            Class.forName(driverName).newInstance();   //加载驱动
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            conn = DriverManager.getConnection(url);     //建立连接
            stmt = conn.createStatement();                //创建Statement（负责执行sql语句）
            String birth = ub.getUid().substring(6,14);
            int age = 2022 - Integer.parseInt(birth.substring(0,4));
            String sex = "";
            if (Integer.parseInt(ub.getUid().substring(16)) % 2 == 1){
                sex = "male";           // 身份证倒数第二位是奇数，是男性
            }else if(Integer.parseInt(ub.getUid().substring(16)) % 2 == 0){
                sex = "female";         // 女性
            }
            String sql = "update volunteer_db.user_info set Uname='" + ub.getUname()
                    + "',Uid =" + ub.getUid()
                    + ",Uheight =" + ub.getUheight()
                    + ",Uweight =" + ub.getUweight()
                    + ",Uage =" + age
                    + ",Usex ='" + sex
                    + "',Ubirth ='" + birth
                    + "',Utel ='" + ub.getUtel()
                    + "',Uclass =" + ub.getUclass()
                    + " where Uno='" + ub.getUno() +"'";
            System.out.println(sql);
            rs = stmt.executeUpdate(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                //关闭连接
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            return rs;
        }
    }
}
