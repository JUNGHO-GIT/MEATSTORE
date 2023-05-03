package dao;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;
import dto.OrderListDTO;

public class OrderListDAO {

  public OrderListDAO() {}

  public Connection getCon() throws Exception {
    Context ct = new InitialContext();
    DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
    return ds.getConnection();
  }

  Connection con = null;
  Statement stmt = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String sql = "";

  private static OrderListDAO instance = new OrderListDAO();

  public static OrderListDAO getInstance() {
    return instance;
  }

  public String insertOrder(OrderListDTO dto) {
    String result = "";
    int quantity2 = Integer.parseInt(dto.getQuantity());
    try {
      con = getCon();
      pstmt =
        con.prepareStatement(
          "select * from product where pro_no=? and stock>=" + quantity2
        );
      pstmt.setInt(1, dto.getPro_no());
      rs = pstmt.executeQuery();

      if (rs.next()) {
        sql =
          "insert into orderlist(ordno,userid,pro_no,quantity,orddate,state)";
        sql = sql + " values(0,?,?,?,now(),?)";

        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, dto.getUserid());
        pstmt.setInt(2, dto.getPro_no());
        pstmt.setString(3, dto.getQuantity());
        pstmt.setString(4, dto.getState());

        pstmt.executeUpdate();
      }
        else {
        result = "noItem";
      }
    }
    catch (Exception ex) {
      System.out.println("insertOrder()예외:" + ex);
      result = "insert 실패:" + ex;
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex) {}
    }
    return result;
  }

  public Vector<OrderListDTO> getOrder(String userid) {
    Vector<OrderListDTO> vec = new Vector<OrderListDTO>();
    try {
      con = getCon();
      sql = "select * from orderlist where userid=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, userid);
      rs = pstmt.executeQuery();

      OrderListDTO dto = null;
      while (rs.next()) {
        dto = new OrderListDTO();

        dto.setUserid(rs.getString("userid"));
        dto.setQuantity(rs.getString("quantity"));
        dto.setOrddate(rs.getDate("orddate"));
        dto.setOrdno(rs.getInt("ordno"));
        dto.setState(rs.getString("state"));
        dto.setPro_no(rs.getInt("pro_no"));

        vec.add(dto);
      }
    }
    catch (Exception ex) {
      System.out.println("getOrder 예외" + ex);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return vec;
  }

  public Vector<OrderListDTO> getOrderList() {
    Vector<OrderListDTO> vec = new Vector<OrderListDTO>();
    try {
      con = getCon();
      sql = "select * from orderlist order by ordno desc";
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      OrderListDTO dto = null;

      while (rs.next()) {
        dto = new OrderListDTO();

        dto.setUserid(rs.getString("userid"));
        dto.setQuantity(rs.getString("quantity"));
        dto.setOrddate(rs.getDate("orddate"));
        dto.setOrdno(rs.getInt("ordno"));
        dto.setState(rs.getString("state"));
        dto.setPro_no(rs.getInt("pro_no"));

        vec.add(dto);
      }
    }
    catch (Exception ex) {
      System.out.println("getOrderlist에러" + ex);
    }
    finally {
      try {
        if (rs != null) {
          rs.close();
        }
        if (pstmt != null) {
          pstmt.close();
        }
        if (con != null) {
          con.close();
        }
      }
    catch (Exception ex2) {}
    }
    return vec;
  }
}
