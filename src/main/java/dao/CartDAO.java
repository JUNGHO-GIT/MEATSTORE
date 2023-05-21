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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import dto.CartDTO;
import dto.ProductDTO;

// ------------------------------------------------------------------------------------------------>
public class CartDAO {

  private static final Logger LOGGER = LoggerFactory.getLogger(CartDAO.class);

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = -100;

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
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
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
  public List<CartDTO> getList(String id, int start, int count) {
    List<CartDTO> list = new ArrayList<>();
    try {
      connecTion = getConnection();
      sqlParam = "select num, id, code, name, price, quantity, imageFile from cart where id=? order by num desc";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();

      int index = 0;
      while (resultSet.next()) {
        if (index++ < start - 1) {
          continue;
        }
        if (index > start + count - 1) {
          break;
        }
        CartDTO dto = new CartDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setId(resultSet.getString("id"));
        dto.setCode(resultSet.getString("code"));
        dto.setName(resultSet.getString("name"));
        dto.setPrice(resultSet.getInt("price"));
        dto.setQuantity(resultSet.getInt("quantity"));
        dto.setImageFile(resultSet.getString("imageFile"));
        list.add(dto);
      }
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return list;
  }

  // 1. 목록 갯수 구하기 -------------------------------------------------------------------------->
  public int getCount (String id)  {
    int count = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from cart where id=?");
      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        count = resultSet.getInt(1);
      }
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return count;
  }


  // ---------------------------------------------------------------------------------------------->
  public void insertCart(CartDTO cartDto) {
    try {
      connecTion = getConnection();
      sqlParam = "SELECT * FROM cart WHERE id=? AND code=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, cartDto.getId());
      psTmt.setString(2, cartDto.getCode());
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        int quantity = resultSet.getInt("quantity") + cartDto.getQuantity();
        sqlParam = "UPDATE cart SET quantity=? WHERE id=? AND code=?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setInt(1, quantity);
        psTmt.setString(2, cartDto.getId());
        psTmt.setString(3, cartDto.getCode());
      }
      else {
        sqlParam = "SELECT * FROM product WHERE num=?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setInt(1, cartDto.getNum());
        resultSet = psTmt.executeQuery();

        if (resultSet.next()) {
          ProductDTO productDto = new ProductDTO();
          productDto.setNum(resultSet.getInt(1));
          productDto.setCode(resultSet.getString("code"));
          productDto.setName(resultSet.getString("name"));
          productDto.setPrice(resultSet.getInt("price"));
          productDto.setStock(resultSet.getInt("stock"));
          productDto.setContent(resultSet.getString("content"));
          productDto.setComp(resultSet.getString("comp"));
          productDto.setRef(resultSet.getInt("ref"));
          productDto.setRe_step(resultSet.getInt("re_step"));
          productDto.setRe_indent(resultSet.getInt("re_indent"));
          productDto.setRegDate(resultSet.getTimestamp("regDate"));
          productDto.setImageFile(resultSet.getString("imageFile"));

          String id = cartDto.getId();
          String code = productDto.getCode();
          int quantity = cartDto.getQuantity();
          int price = productDto.getPrice();
          String name = productDto.getName();
          String imageFile = productDto.getImageFile();

          sqlParam = "INSERT INTO cart(id, code, name, price, quantity, imageFile) VALUES(?, ?, ?, ?, ?, ?)";
          psTmt = connecTion.prepareStatement(sqlParam);
          psTmt.setString(1, id);
          psTmt.setString(2, code);
          psTmt.setString(3, name);
          psTmt.setInt(4, price);
          psTmt.setInt(5, quantity);
          psTmt.setString(6, imageFile);
        }
      }
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
  }

  // ---------------------------------------------------------------------------------------------->
    public int deleteCart(String[] codes) {
    int result = 0;
    try {
      connecTion = getConnection();
      sqlParam = "delete from cart where code in (";
      for (int i = 0; i < codes.length; i++) {
        if (i == 0) {
          sqlParam += "?";
        } else {
          sqlParam += ", ?";
        }
      }
      sqlParam += ")";
      psTmt = connecTion.prepareStatement(sqlParam);
      for (int i = 0; i < codes.length; i++) {
        psTmt.setString(i+1, codes[i]);
      }
      result = psTmt.executeUpdate();
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return result;
  }



  // ---------------------------------------------------------------------------------------------->
  public CartDTO getUpdate(int num) {
    CartDTO cartDto = new CartDTO();
    try {
      connecTion = getConnection();
      sqlParam = "select * from cart where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt = connecTion.prepareStatement("delete from cart where num=?");
      psTmt.setInt(1, num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        cartDto.setNum(resultSet.getInt("num"));
        cartDto.setId(resultSet.getString("id"));
        cartDto.setCode(resultSet.getString("code"));
        cartDto.setName(resultSet.getString("name"));
        cartDto.setPrice(resultSet.getInt("price"));
        cartDto.setQuantity(resultSet.getInt("quantity"));
        cartDto.setImageFile(resultSet.getString("imageFile"));
      }
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return cartDto;
  }

  // ---------------------------------------------------------------------------------------------->
  public int updateCart(CartDTO cartDto) {
    try {
      connecTion = getConnection();
      sqlParam = "update cart set product_quantity=? where num=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, cartDto.getQuantity());
      psTmt.setInt(2, cartDto.getNum());
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return 1;
  }

  // ---------------------------------------------------------------------------------------------->
  public void deleteAllCart(String id) {
    try {
      connecTion = getConnection();
      sqlParam = "delete from cart where id=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, id);
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
  }


}