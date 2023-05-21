package data.dto;

import java.util.Date;

public class ProductDTO {

  // variables ----------------------------------------------------------------------------------->
  private int num;
  private String code;
  private String name;
  private int price;
  private int stock;
  private String content;
  private String comp;
  private int views;
  private int ref;
  private int re_step;
  private int re_indent;
  private Date regDate;
  private String imageFile;

  // getter --------------------------------------------------------------------------------------->
  public int getNum() {
    return num;
  }
  public String getCode() {
    return code;
  }
  public String getName() {
    return name;
  }
  public int getPrice() {
    return price;
  }
  public int getStock() {
    return stock;
  }
  public String getContent() {
    return content;
  }
  public String getComp() {
    return comp;
  }
  public int getViews() {
    return views;
  }
  public int getRef() {
    return ref;
  }
  public int getRe_step() {
    return re_step;
  }
  public int getRe_indent() {
    return re_indent;
  }
  public Date getRegDate() {
    return regDate;
  }
  public String getImageFile() {
    return imageFile;
  }

  // setter --------------------------------------------------------------------------------------->
  public void setNum(int num) {
    this.num = num;
  }
  public void setCode(String code) {
    this.code = code;
  }
  public void setName(String name) {
    this.name = name;
  }
  public void setPrice(int price) {
    this.price = price;
  }
  public void setStock(int stock) {
    this.stock = stock;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public void setComp(String comp) {
    this.comp = comp;
  }
  public void setViews(int views) {
    this.views = views;
  }
  public void setRef(int ref) {
    this.ref = ref;
  }
  public void setRe_step(int re_step) {
    this.re_step = re_step;
  }
  public void setRe_indent(int re_indent) {
    this.re_indent = re_indent;
  }
  public void setRegDate(Date regDate) {
    this.regDate = regDate;
  }
  public void setImageFile(String imageFile) {
    this.imageFile = imageFile;
  }

}