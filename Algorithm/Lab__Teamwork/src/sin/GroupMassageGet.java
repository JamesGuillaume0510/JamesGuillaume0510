package sin;
import java.sql.*;
import java.util.*;

public class GroupMassageGet {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/volunteer_db?useUnicode=true&characterEncoding=utf8";
    public List<volunteerGroupMassage> getManagesByStr(String x){
        Statement stmt = null;
        //System.out.println(x);
        String sql = x;
        ResultSet rs = null;
        List<volunteerGroupMassage> list=new ArrayList<volunteerGroupMassage>();
        try{
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, "root", "admin");
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                volunteerGroupMassage pro = new volunteerGroupMassage();
                pro.setUno(rs.getString("Uno"));
                pro.setGno(rs.getString("Gno"));
                pro.setGname(rs.getString("Gname"));
                pro.setLno(rs.getString("Lno"));
                list.add(pro);
            }
            conn.close();
            return list;
        }
        catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
        finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    public void InsertIntoGroup(String x){
        Statement stmt = null;
        String sql = x;
        try{
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, "root", "admin");
            stmt = conn.createStatement();
            stmt.execute(sql);
            //System.out.println(sql);
            conn.close();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    public volunteerGroupMassage getGroupmassageByUno(String Uno){
        List<volunteerGroupMassage> mg1=getManagesByStr("SELECT * FROM volunteer_group where Uno='"+Uno+"'");
        volunteerGroupMassage mg2 = mg1.get(0);
        return mg2;
    }
    public volunteerGroupMassage getGroupmassageByGno(String Gno){
        List<volunteerGroupMassage> mg1=getManagesByStr("SELECT * FROM volunteer_group where Gno='"+Gno+"'");
        volunteerGroupMassage mg2;
        if(mg1.size()==0){
            mg2 = new volunteerGroupMassage();
        }
        else{
            mg2 = mg1.get(0);
        }
        //System.out.println("mg2:"+mg2.getLno()+"123");
        return mg2;
    }
    public boolean chackVolunteerExist(String Uno){
        List<volunteerGroupMassage> mg1=getManagesByStr("SELECT * FROM volunteer_group where Uno='"+Uno+"'");
        if(mg1.size()==0){
            return true;
        }
        else{
            return false;
        }
    }
}
