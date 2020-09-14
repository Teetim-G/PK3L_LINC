package linc;

import java.sql.Timestamp;

public class CommentDTO {
	int cOrder;
	int fNum;
	String cWriter;
	String cComment;
	Timestamp wDay;
	int cDeep;
	int isDelete;
	public CommentDTO(int cOrder, int fNum, String cWriter, String cComment, Timestamp wDay, int cDeep, int isDelete) {
		super();
		this.cOrder = cOrder;
		this.fNum = fNum;
		this.cWriter = cWriter;
		this.cComment = cComment;
		this.wDay = wDay;
		this.cDeep = cDeep;
		this.isDelete = isDelete;
	}
	public int getcOrder() {
		return cOrder;
	}
	public void setcOrder(int cOrder) {
		this.cOrder = cOrder;
	}
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public String getcWriter() {
		return cWriter;
	}
	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}
	public String getcComment() {
		return cComment;
	}
	public void setcComment(String cComment) {
		this.cComment = cComment;
	}
	public Timestamp getwDay() {
		return wDay;
	}
	public void setwDay(Timestamp wDay) {
		this.wDay = wDay;
	}
	public int getcDeep() {
		return cDeep;
	}
	public void setcDeep(int cDeep) {
		this.cDeep = cDeep;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
}
