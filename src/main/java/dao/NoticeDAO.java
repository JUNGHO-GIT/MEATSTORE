package dao;

import java.sql.*;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dto.NoticeDTO;

// ------------------------------------------------------------------------------------------------>
public class NoticeDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = 0;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private NoticeDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static NoticeDAO instance = new NoticeDAO();

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
  public static NoticeDAO getInstance() {
    return instance;
  }

  // [커넥션 반환 - getConnection] ---------------------------------------------------------------->
  private Connection getConnection() throws Exception {
    Context context = new InitialContext();
    DataSource datasource = (DataSource) context.lookup(
      "java:comp/env/jdbc/mysqlParam"
    );
    return datasource.getConnection();
  }

  // ---------------------------------------------------------------------------------------------->
  public void insertNotice (NoticeDTO dto)  {
    try {
      connecTion = getConnection();
      sqlParam = "insert into notice(num,writer,title,content,pw,regdate,readcount)";
      sqlParam = sqlParam + " values(0,?,?,?,?,NOW(),?)";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, dto.getWriter());
      psTmt.setString(2, dto.getTitle());
      psTmt.setString(3, dto.getContent());
      psTmt.setString(4, dto.getPw());
      psTmt.setInt(5, dto.getReadcount());
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
  public int getCount ()  {
    int cnt = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from notice");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        cnt = resultSet.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }

    return cnt;
  }

  // ---------------------------------------------------------------------------------------------->
  public int getCount (String keyword, String search)  {
    int cnt = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from notice where " + keyword + " like '%" +
      search + "%'");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        cnt = resultSet.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return cnt;
  }

  // ---------------------------------------------------------------------------------------------->
  public List getList (int start, int cnt)  {
    List<NoticeDTO> list = null;
    try {
      connecTion = getConnection();
      sqlParam = "select * from notice order by num desc limit ?,?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, start - 1);
      psTmt.setInt(2, cnt);
      resultSet = psTmt.executeQuery();
      list = new ArrayList<NoticeDTO>();
      while (resultSet.next()) {
        do {
          NoticeDTO dto = new NoticeDTO();
          dto.setNum(resultSet.getInt(1));
          dto.setWriter(resultSet.getString(2));
          dto.setTitle(resultSet.getString("title"));
          dto.setContent(resultSet.getString("content"));
          dto.setPw(resultSet.getString("pw"));
          dto.setRegdate(resultSet.getTimestamp("regdate"));
          dto.setReadcount(resultSet.getInt("readcount"));
          dto.setIp(resultSet.getString("ip"));
          list.add(dto);
        } while (resultSet.next());
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return list;
  }

  // ---------------------------------------------------------------------------------------------->
  public List<NoticeDTO> listSearch (int start, int cnt, String title, String writer)  {
    List<NoticeDTO> list = new ArrayList<>();
    try {
      connecTion = getConnection();
      String selectClause = "select * from notice ";
      String whereClause = "";
      String orderByClause = " order by num desc limit ?,?";
      boolean hasTitle = title != null && !title.trim().isEmpty(); // 조건 확인을 변수로 추출
      boolean hasInsert = writer != null && !writer.trim().isEmpty(); // 조건 확인을 변수로 추출

      if (hasTitle) {
        whereClause += " where title like ?";
      }

      if (hasInsert) {
        whereClause += hasTitle ? " and writer like ?" : " where writer like ?";
      }

      sqlParam = selectClause + whereClause + orderByClause;
      psTmt = connecTion.prepareStatement(sqlParam);
      int parameterIndex = 1; // 파라미터 인덱스 변수 추가
      if (hasTitle) {
        psTmt.setString(parameterIndex++, "%" + title + "%");
      }

      if (hasInsert) {
        psTmt.setString(parameterIndex++, "%" + writer + "%");
      }
      psTmt.setInt(parameterIndex++, start - 1);
      psTmt.setInt(parameterIndex, cnt);
      resultSet = psTmt.executeQuery();
      while (resultSet.next()) {
        NoticeDTO dto = new NoticeDTO();
        dto.setNum(resultSet.getInt(1));
        dto.setWriter(resultSet.getString("writer"));
        dto.setTitle(resultSet.getString("title"));
        dto.setContent(resultSet.getString("content"));
        dto.setPw(resultSet.getString("pw"));
        dto.setRegdate(resultSet.getTimestamp("regdate"));
        dto.setReadcount(resultSet.getInt("readcount"));
        dto.setIp(resultSet.getString("ip"));
        list.add(dto);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return list;
  }

  // ---------------------------------------------------------------------------------------------->
  public NoticeDTO getNotice (int num)  {
    NoticeDTO dto = null;
    try {
      connecTion = getConnection();
      sqlParam = "update notice set readcount=readcount+1 where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.executeUpdate();
      psTmt = connecTion.prepareStatement("select * from notice where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dto = new NoticeDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setWriter(resultSet.getString("writer"));
        dto.setTitle(resultSet.getString("title"));
        dto.setRegdate(resultSet.getDate("regdate"));
        dto.setContent(resultSet.getString("content"));
        dto.setReadcount(resultSet.getInt("readcount"));
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

  // ---------------------------------------------------------------------------------------------->
  public NoticeDTO getUpdate (int num)  {
    NoticeDTO dto = null;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from notice where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dto = new NoticeDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setWriter(resultSet.getString("writer"));
        dto.setTitle(resultSet.getString("Title"));
        dto.setContent(resultSet.getString("content"));
        dto.setPw(resultSet.getString("pw"));
        dto.setRegdate(resultSet.getTimestamp("regdate"));
        dto.setReadcount(resultSet.getInt("readcount"));
        dto.setIp(resultSet.getString("ip"));
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

  // ---------------------------------------------------------------------------------------------->
  public int updateNotice (NoticeDTO dto)  {
    int x = -100;
    String dbPw = "";
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from notice where num?");
      psTmt.setInt(1, dto.getNum());
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (dto.getPw().equals(dbPw)) {
          sqlParam = "update notice set writer?,title?,content?where num?";
          psTmt = connecTion.prepareStatement(sqlParam);
          psTmt.setString(1, dto.getWriter());
          psTmt.setString(2, dto.getTitle());
          psTmt.setString(3, dto.getContent());
          psTmt.setInt(4, dto.getNum());
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

  // ---------------------------------------------------------------------------------------------->
  public int deleteNotice (int num, String pw)  {
    String dbPw = "";
    int x = -100;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from notice where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (pw.equals(dbPw)) {
          psTmt = connecTion.prepareStatement("delete from notice where num=" + num);
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
}
