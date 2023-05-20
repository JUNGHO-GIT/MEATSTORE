package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.CartDTO;

// ------------------------------------------------------------------------------------------------>
public class CartDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = 0;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private CartDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static CartDAO instance = new CartDAO();

  // 반복되는 예외처리를 위한 메소드 -------------------------------------------------------------->
  private void exceptionHandling() {
    try {
      if (resultSet != null) {
        resultSet.close();
      }
      if (psTmt != null) {
        psTmt.close();
      }
      if (connecTion != null) {
        connecTion.close();
      }
    }
    catch (Exception ex2) {}
  }

  // [인스턴스 반환 - getInstance] ---------------------------------------------------------------->
  public static CartDAO getInstance() {
    return instance;
  }

  // [커넥션 반환 - getConnection] ---------------------------------------------------------------->
  private Connection getConnection() throws Exception {
    Context context = new InitialContext();
    DataSource datasource = (DataSource) context.lookup(
      "java:comp/env/jdbc/mysql"
    );
    return datasource.getConnection();
  }

  // ---------------------------------------------------------------------------------------------->
  public List getCartList (String id) {
    List<CartDTO> cartList = new ArrayList<>();
    try {
      connecTion = getConnection();
      sqlParam = "select * from cart where id=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();
      while (resultSet.next()) {
        CartDTO cart = new CartDTO();
        cart.setNum(resultSet.getInt("num"));
        cart.setCode(resultSet.getString("code"));
        cart.setName(resultSet.getString("name"));
        cart.setPrice(resultSet.getInt("price"));
        cart.setQuantity(resultSet.getInt("quantity"));
        cart.setImageFile(resultSet.getString("imageFile"));
        cartList.add(cart);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return cartList;
  }

  // ---------------------------------------------------------------------------------------------->
  public void insertCart (CartDTO cart) {
    try {
      connecTion = getConnection();
      sqlParam = "insert into cart values(?, ?, ?, ?, ?, ?)";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, cart.getNum());
      psTmt.setString(2, cart.getCode());
      psTmt.setString(3, cart.getName());
      psTmt.setInt(4, cart.getPrice());
      psTmt.setInt(5, cart.getQuantity());
      psTmt.setString(6, cart.getImageFile());
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
  }

  // ---------------------------------------------------------------------------------------------->
  public CartDTO getCartDetail (String id) {
    CartDTO cart = new CartDTO();
    try {
      connecTion = getConnection();
      sqlParam = "select * from cart where num=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        cart.setNum(resultSet.getInt("num"));
        cart.setCode(resultSet.getString("code"));
        cart.setName(resultSet.getString("name"));
        cart.setPrice(resultSet.getInt("price"));
        cart.setQuantity(resultSet.getInt("quantity"));
        cart.setImageFile(resultSet.getString("imageFile"));
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return cart;
  }

  // ---------------------------------------------------------------------------------------------->
  public void updateCart (CartDTO cart) {
    try {
      connecTion = getConnection();
      sqlParam = "update cart set code=?, name=?, price=?, quantity=?, imageFile=? where num=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, cart.getCode());
      psTmt.setString(2, cart.getName());
      psTmt.setInt(3, cart.getPrice());
      psTmt.setInt(4, cart.getQuantity());
      psTmt.setString(5, cart.getImageFile());
      psTmt.setInt(6, cart.getNum());
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
  }

  // ---------------------------------------------------------------------------------------------->
  public void deleteCart (int num) {
    try {
      connecTion = getConnection();
      sqlParam = "delete from cart where num=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, num);
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
  }

}