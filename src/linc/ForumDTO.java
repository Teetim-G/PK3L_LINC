package linc;

import java.sql.Timestamp;

public class ForumDTO {
	int fPostOrder;
	java.sql.Timestamp fWtday;
	String fTitle;
	String fContent;
	String fPostUser;
	int fViewCount;
	int fGoodCount;
	int fBadCount;
	int fIsDelete;
	int fForumCategory;
	public ForumDTO(int fPostOrder, Timestamp fWtday, String fTitle, String fContent, String fPostUser, int fViewCount,
			int fGoodCount, int fBadCount, int fIsDelete, int fForumCategory) {
		super();
		this.fPostOrder = fPostOrder;
		this.fWtday = fWtday;
		this.fTitle = fTitle;
		this.fContent = fContent;
		this.fPostUser = fPostUser;
		this.fViewCount = fViewCount;
		this.fGoodCount = fGoodCount;
		this.fBadCount = fBadCount;
		this.fIsDelete = fIsDelete;
		this.fForumCategory = fForumCategory;
	}
	public int getfPostOrder() {
		return fPostOrder;
	}
	public void setfPostOrder(int fPostOrder) {
		this.fPostOrder = fPostOrder;
	}
	public java.sql.Timestamp getfWtday() {
		return fWtday;
	}
	public void setfWtday(java.sql.Timestamp fWtday) {
		this.fWtday = fWtday;
	}
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
	}
	public String getfPostUser() {
		return fPostUser;
	}
	public void setfPostUser(String fPostUser) {
		this.fPostUser = fPostUser;
	}
	public int getfViewCount() {
		return fViewCount;
	}
	public void setfViewCount(int fViewCount) {
		this.fViewCount = fViewCount;
	}
	public int getfGoodCount() {
		return fGoodCount;
	}
	public void setfGoodCount(int fGoodCount) {
		this.fGoodCount = fGoodCount;
	}
	public int getfBadCount() {
		return fBadCount;
	}
	public void setfBadCount(int fBadCount) {
		this.fBadCount = fBadCount;
	}
	public int getfIsDelete() {
		return fIsDelete;
	}
	public void setfIsDelete(int fIsDelete) {
		this.fIsDelete = fIsDelete;
	}
	public int getfForumCategory() {
		return fForumCategory;
	}
	public void setfForumCategory(int fForumCategory) {
		this.fForumCategory = fForumCategory;
	}
	
	
}
