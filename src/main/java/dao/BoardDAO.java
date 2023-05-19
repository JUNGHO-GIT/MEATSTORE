package dao;

import dto.BoardDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// [Class BoardDAO]
public class BoardDAO {

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = 0;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private BoardDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static BoardDAO instance = new BoardDAO();

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

  // [글갯수 반환 - getCount] --------------------------------------------------------------------->
  public int getCount() {
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

  // [글목록 반환 - getList] --------------------------------------------------------------------->
  public List getList(int start, int count) {
    BoardDTO dto = null;
    List<BoardDTO> list = null;
    try {
      connecTion = getConnection();
      sqlParam = "select * from board order by ref desc, re_step asc limit ?, ?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, start - 1);
      psTmt.setInt(2, count);
      resultSet = psTmt.executeQuery();

      while (resultSet.next()) {
        list = new ArrayList<BoardDTO>();
        do {
          dto = new BoardDTO();
          dto.setNum(resultSet.getInt("num"));
          dto.setWriter(resultSet.getString("writer"));
          dto.setSubject(resultSet.getString("subject"));
          dto.setContent(resultSet.getString("content"));
          dto.setPw(resultSet.getString("pw"));
          dto.setRegdate(resultSet.getTimestamp("regdate"));
          dto.setReadcount(resultSet.getInt("readcount"));
          dto.setRef(resultSet.getInt("ref"));
          dto.setRe_step(resultSet.getInt("re_step"));
          dto.setRe_level(resultSet.getInt("re_level"));
          dto.setIp(resultSet.getString("ip"));
          dto.setFileupload(resultSet.getString("fileupload"));
          list.add(dto);
        } while (resultSet.next());
      }
    }
    catch (Exception ex) {
      System.out.println("getList()예외:" + ex);
    }
    finally {
      exceptionHandling();
    }
    return list;
  }

  // [내용 보기 - getBoard] --------------------------------------------------------------------->
  public BoardDTO getBoard(int num) {
    BoardDTO dto = null;
    try {
      connecTion = getConnection();
      sqlParam = "update board set readcount = readcount+1 where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.executeUpdate();
      psTmt =
        connecTion.prepareStatement("select * from board where num=" + num);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        dto = new BoardDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setWriter(resultSet.getString("writer"));
        dto.setSubject(resultSet.getString("subject"));
        dto.setContent(resultSet.getString("content"));
        dto.setPw(resultSet.getString("pw"));
        dto.setRegdate(resultSet.getTimestamp("regdate"));
        dto.setReadcount(resultSet.getInt("readcount"));
        dto.setRef(resultSet.getInt("ref"));
        dto.setRe_step(resultSet.getInt("re_step"));
        dto.setRe_level(resultSet.getInt("re_level"));
        dto.setIp(resultSet.getString("ip"));
        dto.setFileupload(resultSet.getString("fileupload"));
      }
    }
    catch (Exception ex) {
      System.out.println("getBoard()예외:" + ex);
    }
    finally {
      exceptionHandling();
    }
    return dto;
  }

  // [글 집어넣기 - insertBoard] ------------------------------------------------------------------>
  public void insertBoard(BoardDTO dto) {
    int num = dto.getNum();
    int ref = dto.getRef();
    int re_step = dto.getRe_step();
    int re_level = dto.getRe_level();
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
        sqlParam =
          "update board set re_step = re_step+1 where ref = ? and re_step>?";
        psTmt = connecTion.prepareStatement(sqlParam);
        psTmt.setInt(1, ref);
        psTmt.setInt(2, re_step);
        psTmt.executeUpdate();
        re_step = re_step + 1;
        re_level = re_level + 1;
      }
        else {
        ref = number;
        re_step = 0;
        re_level = 0;
      }
      sqlParam =
        "insert into board(writer, subject, content, pw, regdate, ref, re_step, re_level, ip, fileupload)";
      sqlParam = sqlParam + " values(?, ?, ?, ?, NOW(), ?, ?, ?, ?, ?)";

      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setString(1, dto.getWriter());
      psTmt.setString(2, dto.getSubject());
      psTmt.setString(3, dto.getContent());
      psTmt.setString(4, dto.getPw());
      psTmt.setInt(5, ref);
      psTmt.setInt(6, re_step);
      psTmt.setInt(7, re_level);
      psTmt.setString(8, dto.getIp());
      psTmt.setString(9, dto.getFileupload());
      psTmt.executeUpdate();
    }
    catch (Exception ex) {
      System.out.println("insertBoard()예외:" + ex);
    }
    finally {
      exceptionHandling();
    }
  }

  // [글 수정하기 - getUpdate] ------------------------------------------------------------------>
  public BoardDTO getUpdate(int num) {
    BoardDTO dto = null;
    try {
      connecTion = getConnection();
      psTmt =
        connecTion.prepareStatement("select * from board where num=" + num);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        dto = new BoardDTO();
        dto.setNum(resultSet.getInt("num"));
        dto.setWriter(resultSet.getString("writer"));
        dto.setSubject(resultSet.getString("subject"));
        dto.setContent(resultSet.getString("content"));
        dto.setPw(resultSet.getString("pw"));
        dto.setRegdate(resultSet.getTimestamp("regdate"));
        dto.setReadcount(resultSet.getInt("readcount"));
        dto.setRef(resultSet.getInt("ref"));
        dto.setRe_step(resultSet.getInt("re_step"));
        dto.setRe_level(resultSet.getInt("re_level"));
        dto.setIp(resultSet.getString("ip"));
        dto.setFileupload(resultSet.getString("fileupload"));
      }
    }
    catch (Exception ex) {
      System.out.println("getUpdate()예외:" + ex);
    }
    finally {
      exceptionHandling();
    }
    return dto;
  }

  // [수정한 글 DB 연동 - updateBoard] ----------------------------------------------------------->
  public int updateBoard(BoardDTO dto) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from board where num = ?");
      psTmt.setInt(1, dto.getNum());
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");

        if (dto.getPw().equals(dbPw)) {
          sqlParam =
            "update board set writer=?, subject=?, content=?, fileupload=? where num=?";
          psTmt = connecTion.prepareStatement(sqlParam);
          psTmt.setString(1, dto.getWriter());
          psTmt.setString(2, dto.getSubject());
          psTmt.setString(3, dto.getContent());
          psTmt.setString(4, dto.getFileupload());
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
      System.out.println("updateBoard()예외:" + ex);
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }

  // [글 삭제 - getDelete] ---------------------------------------------------------------------->
  public int getDelete(int num, String pw) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from board where num=" + num);
      resultSet = psTmt.executeQuery();

      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (pw.equals(dbPw)) {
          psTmt =
            connecTion.prepareStatement("delete from board where num=" + num);
          psTmt.executeUpdate();
          checkParam = 1;
        }
        else {
          checkParam = -1;
        }
      }
    }
    catch (Exception ex) {
      System.out.println("getDelete() 예외:" + ex);
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }
}
