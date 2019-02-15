package codeMng.bean;

public class CodeMngDTO {
	private String cdno;
	private int cdlvl;
	private String upcd;
	private String cdname;
	private String insuser;
	private String indate;
	private String useyn;
	
	
	
	@Override
	public String toString() {
		return "CodeMngDTO [cdno=" + cdno + ", cdlvl=" + cdlvl + ", upcd=" + upcd + ", cdname=" + cdname + ", insuser="
				+ insuser + ", indate=" + indate + ", useyn=" + useyn + "]";
	}
	public String getCdno() {
		return cdno;
	}
	public void setCdno(String cdno) {
		this.cdno = cdno;
	}
	public int getCdlvl() {
		return cdlvl;
	}
	public void setCdlvl(int cdlvl) {
		this.cdlvl = cdlvl;
	}
	public String getUpcd() {
		return upcd;
	}
	public void setUpcd(String upcd) {
		this.upcd = upcd;
	}

	public String getCdname() {
		return cdname;
	}
	public void setCdname(String cdname) {
		this.cdname = cdname;
	}
	public String getInsuser() {
		return insuser;
	}
	public void setInsuser(String insuser) {
		this.insuser = insuser;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	
	
}
