package sin;

public class manage{
    private int Mnum;
    private String Uno;
    private int Mclass;
    private int Mstate;
    private String Madvise;
    private String Gno;
    public void setMnum(int i){Mnum=i;}
    public void setUno(String i){Uno=i;}
    public void setMclass(int i){Mclass=i;}
    public void setMstate(int i){Mstate=i;}
    public void setMadvise(String i){Madvise=i;}
    public void setGno(String i){Gno=i;}
    public int getMnum(){return Mnum;}
    public String getUno(){return Uno;}
    public int getMclass(){return Mclass;}
    public int getMstate(){return Mstate;}
    public String getMadvise(){return Madvise;}
    public String getGno(){return Gno;}
    public String getMclassOfchange(){
        if(Mclass==2){
            return "申请成为组长";
        }
        else if(Mclass==3){
            return "申请撤销组长";
        }
        else if(Mclass==1){
            return "申请成为志愿者";
        }
        else{
            return "修改志愿类型";
        }
    }
    public String getMstateOfchange(){
        if(Mstate==1){
            return "未处理";
        }
        else if(Mstate==2){
            return "已拒绝";
        }
        else if(Mstate==3){
            return "已同意";
        }
        else {
            return "未知状态";
        }
    }
}
