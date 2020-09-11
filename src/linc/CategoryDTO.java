package linc;

public class CategoryDTO {
	int cNum;
	String cName;
	String cDetail;
	public CategoryDTO(int cNum, String cName, String cDetail) {
		super();
		this.cNum = cNum;
		this.cName = cName;
		this.cDetail = cDetail;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcDetail() {
		return cDetail;
	}
	public void setcDetail(String cDetail) {
		this.cDetail = cDetail;
	}
}
