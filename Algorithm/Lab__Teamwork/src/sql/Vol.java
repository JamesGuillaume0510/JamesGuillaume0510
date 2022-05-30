package sql;

public class Vol {
    private String Uno,Uname,Usex,Gno,Gname,position;

    public Vol(){

    }

    public Vol(String Uno, String Uname, String Usex, String Gno, String Gname, String position) {
        this.Uno = Uno;
        this.Uname = Uname;
        this.Usex = Usex;
        this.Gno = Gno;
        this.Gname = Gname;
        this.position = position;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getUno() {
        return Uno;
    }

    public void setUno(String Uno) {
        this.Uno = Uno;
    }

    public String getUname() {
        return Uname;
    }

    public void setUname(String Uname) {
        this.Uname = Uname;
    }

    public String getUsex() {
        return Usex;
    }

    public void setUsex(String Usex) {
        this.Usex = Usex;
    }

    public String getGno() {
        return Gno;
    }

    public void setGno(String Gno) {
        this.Gno = Gno;
    }

    public String getGname() {
        return Gname;
    }

    public void setGname(String Gname) {
        this.Gname = Gname;
    }
}
