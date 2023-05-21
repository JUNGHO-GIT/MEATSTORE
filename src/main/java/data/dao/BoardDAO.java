package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import data.dto.BoardDTO;

public class BoardDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = -100;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private BoardDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static BoardDAO instance = new BoardDAO();

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
  public static BoardDAO getInstance() {
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
  public void insertBoard (BoardDTO dto)  {
    int num = dto.getNum();
    int ref = dto.getRef();
    int re_step = dto.getRe_step();
    int re_indent = dto.getRe_indent();
    int number = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select max(num) from board");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        number = resultSet.getInt(1) + 1;
      }
      else {
        number = 1;
      }

      if (num != 0) {
        sqlParam = "update board set re_step=re_step+1 where ref?and re_step>?";
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
      sqlParam = "insert into board(writer, subject, content, pw, regDate, ref, re_step, re_indent, imageFile)";
      sqlParam = sqlParam + " values(?, ?, ?, ?,NOW(),?, ?, ?, ?)";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, dto.getWriter());
      psTmt.setString(2, dto.getSubject());
      psTmt.setString(3, dto.getContent());
      psTmt.setString(4, dto.getPw());
      psTmt.setInt(5, ref);
      psTmt.setInt(6, re_step);
      psTmt.setInt(7, re_indent);
      psTmt.setString(8, dto.getImageFile());
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
      psTmt = connecTion.prepareStatement("select count(*) from board");
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
    List<BoardDTO> list = new ArrayList<BoardDTO>();
    try {
      connecTion = getConnection();
      sqlParam = "select * from board order by ref desc, re_indent asc limit ?, ?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, start - 1);
      psTmt.setInt(2, count);
      resultSet = psTmt.executeQuery();

      while (resultSet.next()) {
        BoardDTO dto = new BoardDTO();
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
        dto.setImageFile(resultSet.getString("imageFile"));
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
      psTmt = connecTion.prepareStatement("select count(*) from board where " + keyword + " like '%" + search + "%'");
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
  public List<BoardDTO> listSearch(int start, int count, String subject, String writer) {
    List<BoardDTO> list = new ArrayList<>();
    try {
      connecTion = getConnection();
      String selectClause = "SELECT * FROM board";
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
        BoardDTO dto = new BoardDTO();
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
        dto.setImageFile(resultSet.getString("imageFile"));
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
  public BoardDTO getBoard (int num)  {
    BoardDTO dto = null;
    try {
      connecTion = getConnection();
      sqlParam = "update board set views=views+1 where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.executeUpdate();
      psTmt = connecTion.prepareStatement("select * from board where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dto = new BoardDTO();
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
        dto.setImageFile(resultSet.getString("imageFile"));
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
  public BoardDTO getUpdate (int num)  {
    BoardDTO dto = null;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from board where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dto = new BoardDTO();
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
        dto.setImageFile(resultSet.getString("imageFile"));
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
  public int updateBoard (BoardDTO dto) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from board where num=?");
      psTmt.setInt(1, dto.getNum());
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (dto.getPw().equals(dbPw)) {
          sqlParam = "update board set writer=?, subject=?, content=?, imageFile=? where num=?";
          psTmt = connecTion.prepareStatement(sqlParam);
          psTmt.setString(1, dto.getWriter());
          psTmt.setString(2, dto.getSubject());
          psTmt.setString(3, dto.getContent());
          psTmt.setString(4, dto.getImageFile());
          psTmt.setInt(5, dto.getNum());
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
  public int getDelete (int num, String pw)  {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from board where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (pw.equals(dbPw)) {
          psTmt = connecTion.prepareStatement("delete from board where num=" + num);
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
