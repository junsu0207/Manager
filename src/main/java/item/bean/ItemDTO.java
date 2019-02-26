package item.bean;

public class ItemDTO {
	private String itemcd;
	private String itemName;
	private String madenmcd;
	private String madename;
	private String itemunitcd;
	private String unitcdname;
	private int stockamt;
	private String stockyn;
	private String insuser;
	private String insdate;
	private String useyn;
	private String itemclscd;
	
	@Override
	public String toString() {
		return "ItemDTO [itemcd=" + itemcd + ", itemName=" + itemName + ", madenmcd=" + madenmcd + ", madename="
				+ madename + ", itemunitcd=" + itemunitcd + ", unitcdname=" + unitcdname + ", stockamt=" + stockamt
				+ ", stockyn=" + stockyn + ", insuser=" + insuser + ", insdate=" + insdate + ", useyn=" + useyn
				+ ", itemclscd=" + itemclscd + "]";
	}

	public String getItemcd() {
		return itemcd;
	}

	public void setItemcd(String itemcd) {
		this.itemcd = itemcd;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getMadenmcd() {
		return madenmcd;
	}

	public void setMadenmcd(String madenmcd) {
		this.madenmcd = madenmcd;
	}

	public String getMadename() {
		return madename;
	}

	public void setMadename(String madename) {
		this.madename = madename;
	}

	public String getItemunitcd() {
		return itemunitcd;
	}

	public void setItemunitcd(String itemunitcd) {
		this.itemunitcd = itemunitcd;
	}

	public String getUnitcdname() {
		return unitcdname;
	}

	public void setUnitcdname(String unitcdname) {
		this.unitcdname = unitcdname;
	}

	public int getStockamt() {
		return stockamt;
	}

	public void setStockamt(int stockamt) {
		this.stockamt = stockamt;
	}

	public String getStockyn() {
		return stockyn;
	}

	public void setStockyn(String stockyn) {
		this.stockyn = stockyn;
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

	public String getItemclscd() {
		return itemclscd;
	}

	public void setItemclscd(String itemclscd) {
		this.itemclscd = itemclscd;
	}
	
	
	
	
	
	
}
