package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.AdminDTO;

public class AdminDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = -100;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private AdminDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static AdminDAO instance = new AdminDAO();

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
    catch (Exception ex2) {
      System.out.println("Exception occurred: " + ex2.getMessage());
    }
  }

  // [인스턴스 반환 - getInstance] ---------------------------------------------------------------->
  public static AdminDAO getInstance() {
    return instance;
  }

  // [커넥션 반환 - getConnection] ---------------------------------------------------------------->
  private Connection getConnection() throws Exception {
    Context context = new InitialContext();
    DataSource datasource = (DataSource) context.lookup (
      "java:comp/env/jdbc/mysql"
    );
    return datasource.getConnection();
  }

  // confirmID ------------------------------------------------------------------------------------>
  public int confirmID(String adminId) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select adminId from admin where adminId=?");

      psTmt.setString(1, adminId);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        checkParam = 1;
      }
      else {
        checkParam = -1;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }

  // insertAdmin --------------------------------------------------------------------------------->
  public void insertAdmin(AdminDTO dto) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement( "insert into admin values(?, ?, ?, NOW())");
      psTmt.setString(1, dto.getAdminId());
      psTmt.setString(2, dto.getAdminPw());
      psTmt.setString(3, dto.getAdminName());
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
  }

  // adminCheck ----------------------------------------------------------------------------------->
  public int adminCheck(String adminId, String adminPw) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select adminPw from admin where adminId=?");
      psTmt.setString(1, adminId);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        dbPw = resultSet.getString("adminPw");
        if (adminPw.equals(dbPw)) {
          checkParam = 1;
        }
        else {
          checkParam = 0;
        }
      }
      else {
        checkParam = -1;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }

  // pwCheck -------------------------------------------------------------------------------------->
  public int pwCheck(String adminId, String adminPw) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from admin where adminId=? and adminPw=?");
      psTmt.setString(1, adminId);
      psTmt.setString(2, adminPw);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        checkParam = 1;
      }
      else {
        checkParam = -1;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }

  // getAdmin ------------------------------------------------------------------------------------->
  public AdminDTO getAdmin(String adminId) {
    AdminDTO dto = null;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from admin where adminId=?");
      psTmt.setString(1, adminId);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        dto = new AdminDTO();
        dto.setAdminId(resultSet.getString("adminId"));
        dto.setAdminPw(resultSet.getString("adminPw"));
        dto.setAdminName(resultSet.getString("adminName"));
        dto.setRegDate(resultSet.getTimestamp("regDate"));
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return dto;
  }

}