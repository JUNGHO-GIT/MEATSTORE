package dto;

public class OrdersDTO {

  // variables ----------------------------------------------------------------------------------->
  private int num;
  private String id;
  private String code;
  private String name;
  private int price;
  private int quantity;
  private String imageFile;

  // getter --------------------------------------------------------------------------------------->
  public int getNum() {
    return num;
  }
  public String getId() {
    return id;
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
  public int getQuantity() {
    return quantity;
  }
  public String getImageFile() {
    return imageFile;
  }

  // setter --------------------------------------------------------------------------------------->
  public void setNum(int num) {
    this.num = num;
  }
  public void setId(String id) {
    this.id = id;
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
  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  public void setImageFile(String imageFile) {
    this.imageFile = imageFile;
  }

  // product -------------------------------------------------------------------------------------->
  public void setProduct(ProductDTO product) {
    this.code = product.getCode();
    this.name = product.getName();
    this.price = product.getPrice();
    this.imageFile = product.getImageFile();
  }
}