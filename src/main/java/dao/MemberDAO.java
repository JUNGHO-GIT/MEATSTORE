package dao;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import dto.MemberDTO;

public class MemberDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = 0;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private MemberDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static MemberDAO instance = new MemberDAO();

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
  public static MemberDAO getInstance() {
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

  // confirmID ------------------------------------------------------------------------------------>
  public int confirmID(String id) {
    int x = -100;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select id from member where id=?");

      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();

      // success = 1
      if (resultSet.next()) {
        x = 1;
      }

      // fail = -1
      else {
        x = -1;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return x;
  }

  // insertMember --------------------------------------------------------------------------------->
  public void insertMember(MemberDTO dto) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement( "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, NOW())" );

      psTmt.setString(1, dto.getId());
      psTmt.setString(2, dto.getPw());
      psTmt.setString(3, dto.getName());
      psTmt.setString(4, dto.getEmail());
      psTmt.setString(5, dto.getTel());
      psTmt.setString(6, dto.getZipcode());
      psTmt.setString(7, dto.getAddr());
      psTmt.setString(8, dto.getAddr2());

      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
  }

  // userCheck ------------------------------------------------------------------------------------>
  public int userCheck(String id, String pw) {
    int x = -100;
    String dbPw = "";
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from member where id=?");
      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (pw.equals(dbPw)) {
          x = 1;
        }
        else {
          x = 0;
        }
      }
      else {
        x = -1;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return x;
  }

  // getMember ------------------------------------------------------------------------------------>
  public int pwCheck(String id, String pw) {
    int x = -100;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from member where id=? and pw=?");
      psTmt.setString(1, id);
      psTmt.setString(2, pw);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        x = 1;
      }
      else {
        x = -1;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return x;
  }

  // getMember ------------------------------------------------------------------------------------>
  public MemberDTO getMember(String id) {
    MemberDTO dto = null;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from member where id=?");
      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        dto = new MemberDTO();
        dto.setId(resultSet.getString("id"));
        dto.setPw(resultSet.getString("pw"));
        dto.setName(resultSet.getString("name"));
        dto.setEmail(resultSet.getString("email"));
        dto.setTel(resultSet.getString("tel"));
        dto.setZipcode(resultSet.getString("zipcode"));
        dto.setAddr(resultSet.getString("addr"));
        dto.setAddr2(resultSet.getString("addr2"));
        dto.setRegdate(resultSet.getTimestamp("regdate"));
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

  // updateMember --------------------------------------------------------------------------------->
  public void updateMember(MemberDTO dto) {
    try {
      connecTion = getConnection();
      sqlParam = "update member set pw=?, name=?, email=?, tel=?, zipcode=?, addr=?, addr2=? where id=?";
      psTmt = connecTion.prepareStatement(sqlParam);

      psTmt.setString(1, dto.getPw());
      psTmt.setString(2, dto.getName());
      psTmt.setString(3, dto.getEmail());
      psTmt.setString(4, dto.getTel());
      psTmt.setString(5, dto.getZipcode());
      psTmt.setString(6, dto.getAddr());
      psTmt.setString(7, dto.getAddr2());
      psTmt.setString(8, dto.getId());

      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
  }

  // deleteMember --------------------------------------------------------------------------------->
  public int deleteMember(String id, String pw) {
    int x = -100;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from member where id=?");
      psTmt.setString(1, id);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        String dbPw = resultSet.getString("pw");
        if (pw.equals(dbPw)) {
          psTmt = connecTion.prepareStatement("delete from member where id=?");
          psTmt.setString(1, id);
          psTmt.executeUpdate();

          x = 1;
        }
        else {
          x = -1;
        }
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return x;
  }

  // adminLogin ----------------------------------------------------------------------------------->
  public int adminLogin(String adminid, String adminpw) {
    int x = 100;
    try {
      connecTion = getConnection();
      psTmt =
        connecTion.prepareStatement(
          "select * from admin where adminid=? and adminpw=?"
        );
      psTmt.setString(1, adminid);
      psTmt.setString(2, adminpw);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        x = 1;
      }
      else {
        x = -1;
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return x;
  }
}
