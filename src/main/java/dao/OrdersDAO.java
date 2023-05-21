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
import dto.OrdersDTO;
import dto.ProductDTO;

// ------------------------------------------------------------------------------------------------>
public class OrdersDAO {

  private static final Logger LOGGER = LoggerFactory.getLogger(OrdersDAO.class);

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = -100;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private OrdersDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static OrdersDAO instance = new OrdersDAO();

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
  public static OrdersDAO getInstance() {
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
  public List<OrdersDTO> getList(String id, int start, int count) {
    List<OrdersDTO> list = new ArrayList<>();
    try {
      connecTion = getConnection();
      sqlParam = "select num, id, code, name, price, quantity, imageFile from orders where id=? order by num desc";
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
        OrdersDTO dto = new OrdersDTO();
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
      psTmt = connecTion.prepareStatement("select count(*) from orders where id=?");
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
  public void insertOrders(OrdersDTO ordersDto) {
    try {
      connecTion = getConnection();
      sqlParam = "SELECT * FROM orders WHERE id=? AND code=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, ordersDto.getId());
      psTmt.setString(2, ordersDto.getCode());
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        int quantity = resultSet.getInt("quantity") + ordersDto.getQuantity();
        sqlParam = "UPDATE orders SET quantity=? WHERE id=? AND code=?";
        PreparedStatement updateStatement = connecTion.prepareStatement(sqlParam);
        updateStatement.setInt(1, quantity);
        updateStatement.setString(2, ordersDto.getId());
        updateStatement.setString(3, ordersDto.getCode());
        updateStatement.execute();
      } else {
        sqlParam = "SELECT * FROM product WHERE num=?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setInt(1, ordersDto.getNum());
        ResultSet productResultSet = psTmt.executeQuery();

        if (productResultSet.next()) {
          ProductDTO productDto = new ProductDTO();
          productDto.setNum(productResultSet.getInt(1));
          productDto.setCode(productResultSet.getString("code"));
          productDto.setName(productResultSet.getString("name"));
          productDto.setPrice(productResultSet.getInt("price"));
          productDto.setStock(productResultSet.getInt("stock"));
          productDto.setContent(productResultSet.getString("content"));
          productDto.setComp(productResultSet.getString("comp"));
          productDto.setRef(productResultSet.getInt("ref"));
          productDto.setRe_step(productResultSet.getInt("re_step"));
          productDto.setRe_indent(productResultSet.getInt("re_indent"));
          productDto.setRegDate(productResultSet.getTimestamp("regDate"));
          productDto.setImageFile(productResultSet.getString("imageFile"));

          String id = ordersDto.getId();
          String code = productDto.getCode();
          int quantity = ordersDto.getQuantity();
          int price = productDto.getPrice();
          String name = productDto.getName();
          String imageFile = productDto.getImageFile();

          sqlParam = "INSERT INTO orders(id, code, name, price, quantity, imageFile) VALUES(?, ?, ?, ?, ?, ?)";
          PreparedStatement insertStatement = connecTion.prepareStatement(sqlParam);
          insertStatement.setString(1, id);
          insertStatement.setString(2, code);
          insertStatement.setString(3, name);
          insertStatement.setInt(4, price);
          insertStatement.setInt(5, quantity);
          insertStatement.setString(6, imageFile);
          insertStatement.execute();
        }
      }
    } catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    } finally {
      exceptionHandling();
    }
  }



  public int deleteOrders(String[] codes) {
    int result = 0;
    try {
      connecTion = getConnection();
      sqlParam = "delete from orders where code in (";
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
  public OrdersDTO getUpdate(int num) {
    OrdersDTO ordersDto = new OrdersDTO();
    try {
      connecTion = getConnection();
      sqlParam = "select * from orders where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt = connecTion.prepareStatement("delete from orders where num=?");
      psTmt.setInt(1, num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        ordersDto.setNum(resultSet.getInt("num"));
        ordersDto.setId(resultSet.getString("id"));
        ordersDto.setCode(resultSet.getString("code"));
        ordersDto.setName(resultSet.getString("name"));
        ordersDto.setPrice(resultSet.getInt("price"));
        ordersDto.setQuantity(resultSet.getInt("quantity"));
        ordersDto.setImageFile(resultSet.getString("imageFile"));
      }
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return ordersDto;
  }

  // ---------------------------------------------------------------------------------------------->
  public int updateOrders(OrdersDTO ordersDto) {
    try {
      connecTion = getConnection();
      sqlParam = "update orders set product_quantity=? where num=?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, ordersDto.getQuantity());
      psTmt.setInt(2, ordersDto.getNum());
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
  public void deleteAllOrders(String id) {
    try {
      connecTion = getConnection();
      sqlParam = "delete from orders where id=?";
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