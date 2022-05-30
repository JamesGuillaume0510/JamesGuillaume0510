package sql;

public class UserBean {
    private String Uno;
    private String Uemail;
    private String Upassword;
    private int Uclass;
    private String Uname;
    private String Uid;
    private String Ubirth;
    private int Uage;
    private String Usex;
    private double Uweight;
    private double Uheight;
    private String Utel;
    private int Ustate;
    private String Uintro;
    private String Gno;
    private String Gname;
    private String Lno;

    public String getGno() {
        return Gno;
    }

    public void setGno(String gno) {
        Gno = gno;
    }

    public String getGname() {
        return Gname;
    }

    public void setGname(String gname) {
        Gname = gname;
    }

    public String getLno() {
        return Lno;
    }

    public void setLno(String lno) {
        Lno = lno;
    }

    public UserBean() {
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "Uno='" + Uno + '\'' +
                ", Uemail='" + Uemail + '\'' +
                ", Upassword='" + Upassword + '\'' +
                ", Uclass=" + Uclass +
                ", Uname='" + Uname + '\'' +
                ", Uid='" + Uid + '\'' +
                ", Ubirth='" + Ubirth + '\'' +
                ", Uage=" + Uage +
                ", Usex='" + Usex + '\'' +
                ", Uweight=" + Uweight +
                ", Uheight=" + Uheight +
                ", Utel='" + Utel + '\'' +
                ", Ustate=" + Ustate +
                ", Uintro='" + Uintro + '\'' +
                ", Gno='" + Gno + '\'' +
                ", Gname='" + Gname + '\'' +
                ", Lno='" + Lno + '\'' +
                '}';
    }

    public String getUno() {
        return Uno;
    }

    public void setUno(String uno) {
        Uno = uno;
    }

    public String getUemail() {
        return Uemail;
    }

    public void setUemail(String uemail) {
        Uemail = uemail;
    }

    public String getUpassword() {
        return Upassword;
    }

    public void setUpassword(String upassword) {
        Upassword = upassword;
    }

    public int getUclass() {
        return Uclass;
    }

    public void setUclass(int uclass) {
        Uclass = uclass;
    }

    public String getUname() {
        return Uname;
    }

    public void setUname(String uname) {
        Uname = uname;
    }

    public String getUid() {
        return Uid;
    }

    public void setUid(String uid) {
        Uid = uid;
    }

    public String getUbirth() {
        return Ubirth;
    }

    public void setUbirth(String ubirth) {
        Ubirth = ubirth;
    }

    public int getUage() {
        return Uage;
    }

    public void setUage(int uage) {
        Uage = uage;
    }

    public double getUweight() {
        return Uweight;
    }

    public void setUweight(double uweight) {
        Uweight = uweight;
    }

    public double getUheight() {
        return Uheight;
    }

    public void setUheight(double uheight) {
        Uheight = uheight;
    }

    public String getUtel() {
        return Utel;
    }

    public void setUtel(String utel) {
        Utel = utel;
    }

    public int getUstate() {
        return Ustate;
    }

    public void setUstate(int ustate) {
        Ustate = ustate;
    }

    public String getUintro() {
        return Uintro;
    }

    public void setUintro(String uintro) {
        Uintro = uintro;
    }

    public String getUsex() {
        return Usex;
    }

    public void setUsex(String usex) {
        Usex = usex;
    }
}
