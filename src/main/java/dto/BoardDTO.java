package dto;

import java.util.Date;

public class BoardDTO {

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

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public String getWriter() {
    return writer;
  }

  public void setWriter(String writer) {
    this.writer = writer;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getPw() {
    return pw;
  }

  public void setPw(String pw) {
    this.pw = pw;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  public int getReadcount() {
    return readcount;
  }

  public void setReadcount(int readcount) {
    this.readcount = readcount;
  }

  public int getRef() {
    return ref;
  }

  public void setRef(int ref) {
    this.ref = ref;
  }

  public int getRe_step() {
    return re_step;
  }

  public void setRe_step(int re_step) {
    this.re_step = re_step;
  }

  public int getRe_level() {
    return re_level;
  }

  public void setRe_level(int re_level) {
    this.re_level = re_level;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getFileupload() {
    return fileupload;
  }

  public void setFileupload(String fileupload) {
    this.fileupload = fileupload;
  }
}
