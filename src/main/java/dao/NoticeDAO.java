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
import dto.NoticeDTO;
import dto.NoticeDTO;

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
  public static NoticeDAO getInstance() {
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
  public void insertNotice (NoticeDTO dto)  {
    int num = dto.getNum();
    int ref = dto.getRef();
    int re_step = dto.getRe_step();
    int re_indent = dto.getRe_indent();
    int number = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select max(num) from notice");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        number = resultSet.getInt(1) + 1;
      }
      else {
        number = 1;
      }

      if (num != 0) {
        sqlParam = "update notice set re_step=re_step+1 where ref?and re_step>?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setInt(1, ref);
        psTmt.setInt(2, re_step);
        psTmt.executeUpdate();
        re_step = re_step + 1;
        re_indent = re_indent + 1;
      }
      else {
        ref = number;
        re_step = 0;
        re_indent = 0;
      }

      sqlParam = "insert into notice(writer, subject, content, pw, regDate, ref, re_step, re_indent)";
      sqlParam = sqlParam + " values(?, ?, ?, ?,NOW(),?, ?, ?)";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, dto.getWriter());
      psTmt.setString(2, dto.getSubject());
      psTmt.setString(3, dto.getContent());
      psTmt.setString(4, dto.getPw());
      psTmt.setInt(5, ref);
      psTmt.setInt(6, re_step);
      psTmt.setInt(7, re_indent);
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
    int count = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from notice");
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        count = resultSet.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return count;
  }

  // ---------------------------------------------------------------------------------------------->
  public List getList(int start, int count) {
    List<NoticeDTO> list = new ArrayList<NoticeDTO>();
    try {
      connecTion = getConnection();
      sqlParam = "select * from notice order by ref desc, re_indent asc limit ?, ?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, start - 1);
      psTmt.setInt(2, count);
      resultSet = psTmt.executeQuery();

      while (resultSet.next()) {
        NoticeDTO dto = new NoticeDTO();
        dto.setNum(resultSet.getInt(1));
        dto.setWriter(resultSet.getString("writer"));
        dto.setSubject(resultSet.getString("subject"));
        dto.setContent(resultSet.getString("content"));
        dto.setPw(resultSet.getString("pw"));
        dto.setRegDate(resultSet.getTimestamp("regDate"));
        dto.setViews(resultSet.getInt("views"));
        dto.setRef(resultSet.getInt("ref"));
        dto.setRe_step(resultSet.getInt("re_step"));
        dto.setRe_indent(resultSet.getInt("re_indent"));
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
  public int getSearch (String keyword, String search)  {
    int count = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from notice where " + keyword + " like '%" +
      search + "%'");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        count = resultSet.getInt(1);
      }
    }
    catch (Exception ex) {
      System.out.println("Exception occurred: " + ex.getMessage());
    }
    finally {
      exceptionHandling();
    }
    return count;
  }

  // ---------------------------------------------------------------------------------------------->
  public List<NoticeDTO> listSearch(int start, int count, String subject, String writer) {
    List<NoticeDTO> list = new ArrayList<>();
    try {
      connecTion = getConnection();
      String selectClause = "SELECT * FROM notice";
      String whereClause = "";
      if (subject != null) {
        whereClause += " WHERE subject LIKE ?";
      }
      if (writer != null) {
        if (whereClause.isEmpty()) {
          whereClause += " WHERE writer LIKE ?";
        }
        else {
          whereClause += " AND writer LIKE ?";
        }
      }

      String orderByClause = " ORDER BY ref DESC, re_indent ASC LIMIT ?, ?";
      String sqlParam = selectClause + whereClause + orderByClause;
      psTmt = connecTion.prepareStatement(sqlParam);
      int paramIndex = 1;

      if (subject != null) {
        psTmt.setString(paramIndex++, "%" + subject + "%");
      }
      if (writer != null) {
        psTmt.setString(paramIndex++, "%" + writer + "%");
      }
      psTmt.setInt(paramIndex++, start - 1);
      psTmt.setInt(paramIndex, count);
      resultSet = psTmt.executeQuery();

      while (resultSet.next()) {
        NoticeDTO dto = new NoticeDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setWriter(resultSet.getString("writer"));
        dto.setSubject(resultSet.getString("subject"));
        dto.setContent(resultSet.getString("content"));
        dto.setPw(resultSet.getString("pw"));
        dto.setRegDate(resultSet.getTimestamp("regDate"));
        dto.setViews(resultSet.getInt("views"));
        dto.setRef(resultSet.getInt("ref"));
        dto.setRe_step(resultSet.getInt("re_step"));
        dto.setRe_indent(resultSet.getInt("re_indent"));
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
      sqlParam = "update notice set views=views+1 where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.executeUpdate();
      psTmt = connecTion.prepareStatement("select * from notice where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dto = new NoticeDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setWriter(resultSet.getString("writer"));
        dto.setSubject(resultSet.getString("subject"));
        dto.setContent(resultSet.getString("content"));
        dto.setPw(resultSet.getString("pw"));
        dto.setRegDate(resultSet.getTimestamp("regDate"));
        dto.setViews(resultSet.getInt("views"));
        dto.setRef(resultSet.getInt("ref"));
        dto.setRe_step(resultSet.getInt("re_step"));
        dto.setRe_indent(resultSet.getInt("re_indent"));
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
        dto.setSubject(resultSet.getString("subject"));
        dto.setContent(resultSet.getString("content"));
        dto.setPw(resultSet.getString("pw"));
        dto.setRegDate(resultSet.getTimestamp("regDate"));
        dto.setViews(resultSet.getInt("views"));
        dto.setRef(resultSet.getInt("ref"));
        dto.setRe_step(resultSet.getInt("re_step"));
        dto.setRe_indent(resultSet.getInt("re_indent"));
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
    int checkParam = -100;
    String dbPw = "";
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from notice where num=?");
      psTmt.setInt(1, dto.getNum());
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (dto.getPw().equals(dbPw)) {
          sqlParam = "update notice set writer=?, subject=?, content=? where num=?";
          psTmt = connecTion.prepareStatement(sqlParam);
          psTmt.setString(1, dto.getWriter());
          psTmt.setString(2, dto.getSubject());
          psTmt.setString(3, dto.getContent());
          psTmt.setInt(4, dto.getNum());
          psTmt.executeUpdate();
          checkParam = 1;
        }
        else {
          checkParam = -1;
        }
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

  // ---------------------------------------------------------------------------------------------->
  public int deleteNotice (int num, String pw)  {
    String dbPw = "";
    int checkParam = -100;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from notice where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (pw.equals(dbPw)) {
          psTmt = connecTion.prepareStatement("delete from notice where num=" + num);
          psTmt.executeUpdate();
          checkParam = 1;
        }
        else {
          checkParam = -1;
        }
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
}
