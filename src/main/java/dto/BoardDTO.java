package dto;

import java.util.Date;

public class BoardDTO {

  // variables ----------------------------------------------------------------------------------->
  private int num;
  private String writer;
  private String subject;
  private String content;
  private String pw;
  private Date regdate;
  private int readcount;
  private int ref;
  private int re_step;
  private int re_level;
  private String ip;
  private String fileupload;

  // getter --------------------------------------------------------------------------------------->
  public int getNum() {
    return num;
  }
  public String getWriter() {
    return writer;
  }
  public String getSubject() {
    return subject;
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
  public int getRef() {
    return ref;
  }
  public int getRe_step() {
    return re_step;
  }
  public int getRe_level() {
    return re_level;
  }
  public String getIp() {
    return ip;
  }
  public String getFileupload() {
    return fileupload;
  }

  // setter --------------------------------------------------------------------------------------->
  public void setNum(int num) {
    this.num = num;
  }
  public void setWriter(String writer) {
    this.writer = writer;
  }
  public void setSubject(String subject) {
    this.subject = subject;
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
  public void setRef(int ref) {
    this.ref = ref;
  }
  public void setRe_step(int re_step) {
    this.re_step = re_step;
  }
  public void setRe_level(int re_level) {
    this.re_level = re_level;
  }
  public void setIp(String ip) {
    this.ip = ip;
  }
  public void setFileupload(String fileupload) {
    this.fileupload = fileupload;
  }

}

