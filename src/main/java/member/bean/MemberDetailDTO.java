package member.bean;

public class MemberDetailDTO {
	private String id;
	private String userInfoDetail;
	private String relcd;
	private int addrcd;
	private String addrname;
	private String mobileTelNo;
	private String homeTelNo;
	private String insuser;
	private String insdate;
	private String useyn;
	private String delivName;
	@Override
	public String toString() {
		return "MemberDetailDTO [id=" + id + ", userInfoDetail=" + userInfoDetail + ", relcd=" + relcd + ", addrcd="
				+ addrcd + ", addrname=" + addrname + ", mobileTelNo=" + mobileTelNo + ", homeTelNo=" + homeTelNo
				+ ", insuser=" + insuser + ", insdate=" + insdate + ", useyn=" + useyn + ", delivName=" + delivName
				+ "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserInfoDetail() {
		return userInfoDetail;
	}
	public void setUserInfoDetail(String userInfoDetail) {
		this.userInfoDetail = userInfoDetail;
	}
	public String getRelcd() {
		return relcd;
	}
	public void setRelcd(String relcd) {
		this.relcd = relcd;
	}
	public int getAddrcd() {
		return addrcd;
	}
	public void setAddrcd(int addrcd) {
		this.addrcd = addrcd;
	}
	public String getAddrname() {
		return addrname;
	}
	public void setAddrname(String addrname) {
		this.addrname = addrname;
	}
	public String getMobileTelNo() {
		return mobileTelNo;
	}
	public void setMobileTelNo(String mobileTelNo) {
		this.mobileTelNo = mobileTelNo;
	}
	public String getHomeTelNo() {
		return homeTelNo;
	}
	public void setHomeTelNo(String homeTelNo) {
		this.homeTelNo = homeTelNo;
	}
	public String getInsuser() {
		return insuser;
	}
	public void setInsuser(String insuser) {
		this.insuser = insuser;
	}
	public String getInsdate() {
		return insdate;
	}
	public void setInsdate(String insdate) {
		this.insdate = insdate;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getDelivName() {
		return delivName;
	}
	public void setDelivName(String delivName) {
		this.delivName = delivName;
	}
	
	
	
	
}
