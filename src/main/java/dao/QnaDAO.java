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
import dto.QnaDTO;

public class QnaDAO {

  private static final Logger LOGGER = LoggerFactory.getLogger(QnaDAO.class);

  // 전역변수 선언 -------------------------------------------------------------------------------->
  Connection connecTion = null;
  PreparedStatement psTmt = null;
  Statement sTmt = null;
  ResultSet resultSet = null;
  String sqlParam = "";
  String dbPw = "";
  int checkParam = -100;

  // 프라이빗 생성자를 통한 싱글톤 패턴 구현 ------------------------------------------------------>
  private QnaDAO() {}

  // 싱글톤 패턴을 위한 객체 생성 ----------------------------------------------------------------->
  private static QnaDAO instance = new QnaDAO();

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
  public static QnaDAO getInstance() {
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

  // 1. 목록 갯수 구하기 -------------------------------------------------------------------------->
  public int getCount ()  {
    int count = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select count(*) from qna");
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
  public void insertQna (QnaDTO dto)  {
    int num = dto.getNum();
    int ref = dto.getRef();
    int re_step = dto.getRe_step();
    int re_indent = dto.getRe_indent();
    int number = 0;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select max(num) from qna");
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        number = resultSet.getInt(1) + 1;
      }
      else {
        number = 1;
      }

      if (num != 0) {
        sqlParam = "update qna set re_step=re_step+1 where ref=? and re_step>?";
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

      sqlParam = "insert into qna(writer, subject, content, pw, regDate, ref, re_step, re_indent)";
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
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
  }



  // ---------------------------------------------------------------------------------------------->
  public List getList(int start, int count) {
    List<QnaDTO> list = new ArrayList<QnaDTO>();
    try {
      connecTion = getConnection();
      sqlParam = "select * from qna order by ref desc, re_indent asc limit ?, ?";
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.setInt(1, start - 1);
      psTmt.setInt(2, count);
      resultSet = psTmt.executeQuery();

      while (resultSet.next()) {
        QnaDTO dto = new QnaDTO();
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
      LOGGER.error("EXCEPTION", ex);
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
      psTmt = connecTion.prepareStatement("select count(*) from qna where " + keyword + " like '%" +
      search + "%'");
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
  public List<QnaDTO> listSearch(int start, int count, String subject, String writer) {
    List<QnaDTO> list = new ArrayList<>();
    try {
      connecTion = getConnection();
      String selectClause = "SELECT * FROM qna";
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
        QnaDTO dto = new QnaDTO();
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
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return list;
  }

  // ---------------------------------------------------------------------------------------------->
  public QnaDTO getQna (int num)  {
    QnaDTO dto = null;
    try {
      connecTion = getConnection();
      sqlParam = "update qna set views=views+1 where num=" + num;
      psTmt = connecTion.prepareStatement(sqlParam);
      psTmt.executeUpdate();
      psTmt = connecTion.prepareStatement("select * from qna where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dto = new QnaDTO();
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
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return dto;
  }

  // ---------------------------------------------------------------------------------------------->
  public QnaDTO getUpdate (int num)  {
    QnaDTO dto = null;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select * from qna where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dto = new QnaDTO();
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
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return dto;
  }

  // ---------------------------------------------------------------------------------------------->
  public int updateQna (QnaDTO dto) {
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from qna where num=?");
      psTmt.setInt(1, dto.getNum());
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (dto.getPw().equals(dbPw)) {
          sqlParam = "update qna set writer=?, subject=?, content=? where num=?";
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
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }

  // ---------------------------------------------------------------------------------------------->
  public int getDelete (int num, String pw)  {
    String dbPw = "";
    checkParam = -100;
    try {
      connecTion = getConnection();
      psTmt = connecTion.prepareStatement("select pw from qna where num=" + num);
      resultSet = psTmt.executeQuery();
      if (resultSet.next()) {
        dbPw = resultSet.getString("pw");
        if (pw.equals(dbPw)) {
          psTmt = connecTion.prepareStatement("delete from qna where num=" + num);
          psTmt.executeUpdate();
          checkParam = 1;
        }
        else {
          checkParam = -1;
        }
      }
    }
    catch (Exception ex) {
      LOGGER.error("EXCEPTION", ex);
    }
    finally {
      exceptionHandling();
    }
    return checkParam;
  }
}
