package model.notice;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NotVO {
   private int notId;         //공지사항 아이디(번호)
   private String notTitle;   //공지사항 제목
   private String notContent;   //공지사항 내용
   private Date notDate;      //공지사항 등록 날짜
   private int notShow;      //공지사항 노출여부(0,1)
   private String notRegDate;   //공지사항 등록 날짜 ->문자열 형변환
   
   public int getNotId() {
      return notId;
   }
   public void setNotId(int notId) {
      this.notId = notId;
   }
   public String getNotTitle() {
      return notTitle;
   }
   public void setNotTitle(String notTitle) {
      this.notTitle = notTitle;
   }
   public String getNotContent() {
      return notContent;
   }
   public void setNotContent(String notContent) {
      this.notContent = notContent;
   }
   public Date getNotDate() {
      return notDate;
   }
   public void setNotDate(Date notDate) {
      this.notDate = notDate;
   }
   public int getNotShow() {
      return notShow;
   }
   public void setNotShow(int notShow) {
      this.notShow = notShow;
   }
   public String getNotRegDate() {
      return notRegDate;
   }
   public void setNotRegDate(String notRegDate) {
      this.notRegDate = notRegDate;
   }
@Override
public String toString() {
	return "NotVO [notId=" + notId + ", notTitle=" + notTitle + ", notContent=" + notContent + ", notDate=" + notDate
			+ ", notShow=" + notShow + ", notRegDate=" + notRegDate + "]";
}
   
   
}