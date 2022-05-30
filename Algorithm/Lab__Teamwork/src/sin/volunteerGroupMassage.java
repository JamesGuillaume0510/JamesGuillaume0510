package sin;

public class volunteerGroupMassage {
    private String Uno;
    private String Gno;
    private String Gname;
    private String Lno;
    volunteerGroupMassage(){
        Uno="";
        Gno="";
        Lno="";
        Gname="";
    }
    public void setUno(String i){Uno=i;}
    public void setGno(String i){Gno=i;}
    public void setLno(String i){Lno=i;}
    public void setGname(String i){Gname=i;}
    public String getUno(){return Uno;}
    public String getGno(){return Gno;}
    public String getLno(){return Lno;}
    public String getGname(){return Gname;}
    public boolean textLno(){
        if(Lno.equals(Uno)){

            return true;
        }
        else{

            return false;
        }
    }
}
