package dto;

import java.util.Date;

public class ProductDTO {

  // variables ----------------------------------------------------------------------------------->
  private int pro_no;
  private String code;
  private String name;
  private int price;
  private int stock;
  private String content;
  private String comp;
  private Date regdate;
  private String image;

  // getter --------------------------------------------------------------------------------------->
  public int getPro_no() {
    return pro_no;
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
  public Date getRegdate() {
    return regdate;
  }
  public String getImage() {
    return image;
  }

  // setter --------------------------------------------------------------------------------------->
  public void setPro_no(int pro_no) {
    this.pro_no = pro_no;
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
  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }
  public void setImage(String image) {
    this.image = image;
  }
}