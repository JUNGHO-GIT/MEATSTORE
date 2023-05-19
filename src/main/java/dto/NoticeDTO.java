package dto;

import java.util.Date;

public class NoticeDTO {

  // variables ------------------------------------------------------------------------------------>
  private int num;
  private String writer;
  private String Title;
  private String content;
  private String pw;
  private Date regdate;
  private int readcount;
  private String ip;

  // getter --------------------------------------------------------------------------------------->
  public int getNum() {
    return num;
  }
  public String getWriter() {
    return writer;
  }
  public String getTitle() {
    return Title;
  }
  public String getContent() {
    return content;
  }
  public String getPw() {
    return pw;
  }
  public Date getRegdate() {
    return regdate;
  }
  public int getReadcount() {
    return readcount;
  }
  public String getIp() {
    return ip;
  }

  // setter --------------------------------------------------------------------------------------->
  public void setNum(int num) {
    this.num = num;
  }
  public void setWriter(String writer) {
    this.writer = writer;
  }
  public void setTitle(String title) {
    Title = title;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public void setPw(String pw) {
    this.pw = pw;
  }
  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }
  public void setReadcount(int readcount) {
    this.readcount = readcount;
  }
  public void setIp(String ip) {
    this.ip = ip;
  }

}


