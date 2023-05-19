package dto;

import java.util.Date;

public class BoardDTO {

  // variables ----------------------------------------------------------------------------------->
  private int num;
  private String writer;
  private String pw;
  private String subject;
  private String content;
  private int views;
  private int ref;
  private int re_indent;
  private Date regdate;
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
  public int getViews() {
    return views;
  }
  public int getRef() {
    return ref;
  }
  public int getRe_indent() {
    return re_indent;
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
  public void setViews(int views) {
    this.views = views;
  }
  public void setRef(int ref) {
    this.ref = ref;
  }
  public void setRe_indent(int re_indent) {
    this.re_indent = re_indent;
  }
  public void setFileupload(String fileupload) {
    this.fileupload = fileupload;
  }
}