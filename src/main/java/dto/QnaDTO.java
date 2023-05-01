package dto;

import java.util.Date;

public class QnaDTO {

  private int num;
  private String writer;
  private String subject;
  private String content;
  private String pw;
  private Date regdate;
  private int views;
  private int ref;
  private int re_step;
  private int re_indent;

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

  public int getViews() {
    return views;
  }

  public void setViews(int views) {
    this.views = views;
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

  public int getRe_indent() {
    return re_indent;
  }

  public void setRe_indent(int re_indent) {
    this.re_indent = re_indent;
  }

  @Override
  public String toString() {
    return (
      "QnaDTO [num=" +
      num +
      ", writer=" +
      writer +
      ", subject=" +
      subject +
      ", content=" +
      content +
      ", pw=" +
      pw +
      ", regdate=" +
      regdate +
      ", views=" +
      views +
      ", ref=" +
      ref +
      ", re_step=" +
      re_step +
      ", re_indent=" +
      re_indent +
      "]"
    );
  }
  //getter/setter

}
