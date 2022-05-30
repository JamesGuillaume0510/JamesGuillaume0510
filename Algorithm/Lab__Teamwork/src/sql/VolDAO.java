package sql;

import java.sql.*;
import java.util.*;
import sql.Vol;

public class VolDAO {
    public static Connection getConnection() {
        Connection conn = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/volunteer_db?useUnicode=true&characterEncoding=utf8", "root", "admin");
            return conn;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("不能获取数据库连接");
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("不能获取数据库连接");
            return null;
        }

    }

    public List<Vol> getAllVolunteers() {
        Connection conn = getConnection();
        Statement stmt1 = null;
        Statement stmt2 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        List<Vol> volunteers = new ArrayList<Vol>();
        String sql1 = "select * from volunteer_group";
        //System.out.println(sql1);
        try {
            stmt1 = conn.createStatement();
            stmt2 = conn.createStatement();
            rs1 = stmt1.executeQuery(sql1);

            while (rs1.next()){
                Vol volunteer = new Vol();
                String Uno = rs1.getString("Uno");
                String Lno = rs1.getString("Lno");
                if(Uno.equals(Lno)){
                    volunteer.setPosition("组长");
                }else {
                    volunteer.setPosition("组员");
                }
                volunteer.setUno(Uno);
                volunteer.setGno(rs1.getString("Gno"));
                volunteer.setGname(rs1.getString("Gname"));
                String sql2 = "select * from user_info where Uno = '"+Uno+"'";
                //System.out.println(sql2);
                rs2 = stmt2.executeQuery(sql2);
                while (rs2.next()){
                    //System.out.println(rs2.getString("Uname"));
                    volunteer.setUname(rs2.getString("Uname"));
                    volunteer.setUsex(rs2.getString("Usex"));
                }
                volunteers.add(volunteer);

            }
            return volunteers;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try {
                if (rs1 != null) {
                    rs1.close();
                }
                if(rs2 != null){
                    rs2.close();
                }
                if (stmt1 != null) {
                    stmt1.close();
                }
                if (stmt2 != null) {
                    stmt2.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    public List<Vol> getVolunteersByGroup(String Gno){
        Connection conn = getConnection();
        Statement stmt1 = null;
        Statement stmt2 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        List<Vol> volunteers = new ArrayList<Vol>();
        String sql1 = "select * from volunteer_group where Gno='"+Gno+"'";
        //System.out.println(sql1);
        try{
            stmt1 = conn.createStatement();
            stmt2 = conn.createStatement();
            rs1 = stmt1.executeQuery(sql1);

            while (rs1.next()){
                Vol volunteer = new Vol();
                String Uno = rs1.getString("Uno");
                String Lno = rs1.getString("Lno");
                if(Uno.equals(Lno)){
                    volunteer.setPosition("组长");
                }else {
                    volunteer.setPosition("组员");
                }
                volunteer.setUno(Uno);
                volunteer.setGno(rs1.getString("Gno"));
                volunteer.setGname(rs1.getString("Gname"));
                String sql2 = "select * from user_info where Uno = '"+Uno+"'";
                //System.out.println(sql2);
                rs2 = stmt2.executeQuery(sql2);
                while (rs2.next()){
                    //System.out.println(rs2.getString("Uname"));
                    volunteer.setUname(rs2.getString("Uname"));
                    volunteer.setUsex(rs2.getString("Usex"));
                }
                volunteers.add(volunteer);

            }
            return volunteers;
        }catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try {
                if (rs1 != null) {
                    rs1.close();
                }
                if(rs2 != null){
                    rs2.close();
                }
                if (stmt1 != null) {
                    stmt1.close();
                }
                if (stmt2 != null) {
                    stmt2.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    public void appointGroupMaster(String Uno,String Gno){
        Connection conn = getConnection();
        Statement stmt1 = null;

        boolean rs1;

        String sql1 = "update volunteer_group set Lno='"+Uno+"'"+" where Gno='"+Gno+"'";
        //System.out.println(sql1);

        try {
            stmt1 = conn.createStatement();
            rs1 = stmt1.execute(sql1);

        }catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {

                if (stmt1 != null) {
                    stmt1.close();
                }

                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
