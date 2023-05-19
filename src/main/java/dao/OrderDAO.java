package dao;

import dto.OrderDTO;
import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

// ------------------------------------------------------------------------------------------------>
public class OrderDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = 0;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private OrderDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static OrderDAO instance = new OrderDAO();

  // 반복되는 예외처리를 위한 메소드 -------------------------------------------------------------->
  public void exceptionHandling() {
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
  public static OrderDAO getInstance() {
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
  public String insertOrder (OrderDTO dto)  {
    String result = "";
    int quantity2 = dto.getQuantity();
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from product where pro_no?and stock>=" + quantity2);
      psTmt.setInt(1, dto.getPro_no());
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        sqlParam = "insert into orderlist(ordno,id,pro_no,quantity,orddate,state)";
        sqlParam = sqlParam + " values(0,?, ?, ?,now(),?)";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setString(1, dto.getId());
        psTmt.setInt(2, dto.getPro_no());
        psTmt.setInt(3, dto.getQuantity());
        psTmt.setString(4, dto.getState());
        psTmt.executeUpdate();
      }
      else {
        result = "noItem";
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return result;
  }

  // ---------------------------------------------------------------------------------------------->
  public Vector<OrderDTO> getOrder (String id)  {
    Vector<OrderDTO> vec = new Vector<OrderDTO>();
    try {
      connecTion = getConnection();
      sqlParam = "select * from orderlist where id?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();
      OrderDTO dto = null;
      while (resultSet.next()) {
        dto = new OrderDTO();
        dto.setId(resultSet.getString("id"));
        dto.setQuantity(resultSet.getInt("quantity"));
        dto.setOrddate(resultSet.getDate("orddate"));
        dto.setOrdno(resultSet.getInt("ordno"));
        dto.setState(resultSet.getString("state"));
        dto.setPro_no(resultSet.getInt("pro_no"));
        vec.add(dto);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return vec;
  }

  // ---------------------------------------------------------------------------------------------->
  public Vector<OrderDTO> getOrder ()  {
    Vector<OrderDTO> vec = new Vector<OrderDTO>();
    try {
      connecTion = getConnection();
      sqlParam = "select * from orderlist order by ordno desc";
      psTmt = connecTion.prepareStatement(sqlParam);
      resultSet = psTmt.executeQuery();
      OrderDTO dto = null;
      while (resultSet.next()) {
        dto = new OrderDTO();
        dto.setId(resultSet.getString("id"));
        dto.setQuantity(resultSet.getInt("quantity"));
        dto.setOrddate(resultSet.getDate("orddate"));
        dto.setOrdno(resultSet.getInt("ordno"));
        dto.setState(resultSet.getString("state"));
        dto.setPro_no(resultSet.getInt("pro_no"));
        vec.add(dto);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return vec;
  }
}
