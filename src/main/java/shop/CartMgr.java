package shop;

import java.util.Hashtable;
import dto.*;

public class CartMgr {

  private Hashtable hcart = new Hashtable();

  public CartMgr() {}

  public void addCart(OrderDTO orderDTO) {
    int pro_no = orderDTO.getPro_no();
    String q = orderDTO.getQuantity();
    int quantity = Integer.parseInt(q);

    if (quantity > 0) {
      if (hcart.containsKey(pro_no)) {
        OrderDTO tempDTO = (OrderDTO) hcart.get(pro_no);
        quantity += Integer.parseInt(tempDTO.getQuantity());

        tempDTO.setQuantity(quantity + "");
        hcart.put(pro_no, tempDTO);
      }
      else {
        hcart.put(pro_no, orderDTO);
      }
    }
  }

  public Hashtable getCartList() {
    return hcart;
  }

  public void updateCart(OrderDTO orderDTO) {
    int pro_no = orderDTO.getPro_no();
    hcart.put(pro_no, orderDTO);
  }

  public void deleteCart(OrderDTO orderDTO) {
    int pro_no = orderDTO.getPro_no();
    hcart.remove(pro_no);
  }
}
