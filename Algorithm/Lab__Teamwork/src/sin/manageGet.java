package sin;
import java.awt.*;
import java.sql.*;
import java.util.*;
import java.util.List;

public class manageGet {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/volunteer_db?useUnicode=true&characterEncoding=utf8";
    public List<manage> getManagesByStr(String x){
        Statement stmt = null;
        String sql = x;
        ResultSet rs = null;
        List<manage> list=new ArrayList<manage>();
        try{
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, "root", "admin");
            stmt = conn.createStatement();

            rs = stmt.executeQuery(sql);
            while(rs.next()){
                manage pro = new manage();
                pro.setMnum(rs.getInt("Mnum"));
                pro.setUno(rs.getString("Uno"));
                pro.setMclass(rs.getInt("Mclass"));
                pro.setMstate(rs.getInt("Mstate"));
                pro.setMadvise(rs.getString("Madvise"));
                pro.setGno(rs.getString("Gno"));
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

    public void changeDataByStr(String x){
        Statement stmt = null;
        String sql = x;
        try{
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, "root", "admin");
            stmt = conn.createStatement();

            stmt.executeUpdate(sql);
            System.out.println(sql);
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
    public int CountGroupNumb(String x){
        Statement stmt = null;
        String sql = "select count(Uno) from volunteer_group group by Gno HAVING Gno='"+x+"'";
        ResultSet rs = null;
        int countUno=0;
        try{
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, "root", "admin");
            stmt = conn.createStatement();
            rs=stmt.executeQuery(sql);
            while(rs.next()){
                countUno=rs.getInt("count(Uno)");
            }
            System.out.println(sql);
            conn.close();
            System.out.println(countUno);
            return countUno;
        }
        catch(Exception ex){
            ex.printStackTrace();
            return 0;
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
    public List<manage> getManageNotProcess() {
        return getManagesByStr("SELECT * FROM volunteer_manage where Mstate=0");
    }
    public List<manage> getAllmanages(){
        return getManagesByStr("SELECT * FROM volunteer_manage");
    }
    public List<manage> getManageProcessed(){
        return getManagesByStr("SELECT * FROM volunteer_manage where Mstate>0");
    }
    public List<manage> getManagesByMnum(int n){
        return getManagesByStr("SELECT * FROM volunteer_manage where Mnum="+n);
    }
   public void RefusedOne(int x,String n){
        String str1="UPDATE volunteer_manage set Mstate=2,Madvise='"+n+"' where Mnum="+x;
        changeDataByStr(str1);
    }
    public int AgreedOne(int x,String n){
        String str1="UPDATE volunteer_manage set Mstate=1,Madvise='"+n+"' where Mnum="+x;
        changeDataByStr(str1);
        manageGet manageList=new manageGet();
        List<manage> m1= manageList.getManagesByMnum(x);
        manage m2=m1.get(0);
        switch (m2.getMclass()) {
            case 0:
                System.out.println("0000");
                switch (m2.getGno()) {
                    case "1":
                        setGnoAndGname(m2.getUno(), "1", "group1");
                        break;
                    case "2":
                        setGnoAndGname(m2.getUno(), "2", "group2");
                        break;
                    case "3":
                        setGnoAndGname(m2.getUno(), "3", "group3");
                        break;
                    case "4":
                        setGnoAndGname(m2.getUno(), "4", "group4");
                        break;
                }
                break;
            case 1:
                UpdateGroupLno(m2.getGno(), m2.getUno());

                break;
            case 2:
                UpdateGroupLno(m2.getGno(),"");
                if(CountGroupNumb(m2.getGno())>1){
                    return 1;
                }
                break;
            case 3:
                GroupMassageGet gm1=new GroupMassageGet();
                volunteerGroupMassage v1=gm1.getGroupmassageByGno(m2.getGno());
                UpdataGroupLnoByUno(m2.getUno(), v1.getLno(),m2.getGno());
                switch (m2.getGno()){
                    case "g1":
                        UpdataGroupGno(m2.getUno(),"g1" );
                        UpdataGroupGname(m2.getUno(),"group1");
                        break;
                    case "g2":
                        UpdataGroupGno(m2.getUno(), "g2");
                        UpdataGroupGname(m2.getUno(),"group2");
                        break;
                    case "g3":
                        UpdataGroupGno(m2.getUno(), "g3");
                        UpdataGroupGname(m2.getUno(),"group3");
                        break;
                    case "g4":
                        UpdataGroupGno(m2.getUno(), "g4");
                        UpdataGroupGname(m2.getUno(),"group4");
                        break;
                }
                break;
        }
        return 0;
    }
    public void setGnoAndGname(String Uno,String Gno,String Gname) {
        GroupMassageGet gm1=new GroupMassageGet();
        volunteerGroupMassage v1=gm1.getGroupmassageByGno(Gno);
        String str2;
        if(v1.getLno().equals("")) {
            str2 = "insert into volunteer_group values ('" + Uno + "','" + Gno + "','" + Gname + "','" + Uno + "')";
        }
            else{
            str2 = "insert into volunteer_group values ('" + Uno + "','" + Gno + "','" + Gname + "','" + v1.getLno() + "')";
        }
        gm1.InsertIntoGroup(str2);
    }
    public void UpdateGroupLno(String Gno,String Uno){
        String str1="UPDATE volunteer_group set Lno='"+Uno+"' where Gno='"+Gno+"'";
        changeDataByStr(str1);
    }
    public void UpdataGroupGno(String Uno,String Gno){
        String str1="UPDATE volunteer_group set Gno='"+Gno+"' where Uno='"+Uno+"'";
        System.out.println(str1);
        changeDataByStr(str1);
    }
    public void UpdataGroupGname(String Uno,String Gname){
        String str1="UPDATE volunteer_group set Gname='"+Gname+"' where Uno='"+Uno+"'";
        System.out.println(str1);
        changeDataByStr(str1);
    }
    public void UpdataGroupLnoByUno(String Uno,String Lno,String Gno){
        if(Lno.equals("")) {
            String str1 = "UPDATE volunteer_group set Lno='" + Uno + "' where Uno='" + Uno + "'";
            changeDataByStr(str1);
            String str2="UPDATE volunteer_group set Lno='" + Uno + "' where Gno='" + Gno + "'";
            changeDataByStr(str2);
        }
        else{
            String str1 = "UPDATE volunteer_group set Lno='" + Lno + "' where Uno='" + Uno + "'";
            changeDataByStr(str1);
        }
    }
    public int getMaxMnum(){
        String sql="select max(Mnum) from volunteer_manage";
        Statement stmt = null;
        ResultSet rs = null;
        try{
            Class.forName(DRIVER);
            Connection conn = DriverManager.getConnection(URL, "root", "admin");
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            manage pro = new manage();
            while(rs.next()){
                pro.setMnum(rs.getInt("max(Mnum)"));
            }
            conn.close();
            return pro.getMnum();
        }
        catch(Exception ex){
            ex.printStackTrace();
            return 0;
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
    public void insertIntoManage(String Uno,String Gno,int Mclass){
        GroupMassageGet gm1=new GroupMassageGet();
        System.out.println("1111");
        int Mnum=getMaxMnum()+1;
        String str1="insert into volunteer_manage(Mnum,Uno,Gno,Mclass,Mstate) values("+Mnum+",'"+Uno+"','"+Gno+"',"+Mclass+",0)";
        System.out.println(str1);
        gm1.InsertIntoGroup(str1);
    }
}
