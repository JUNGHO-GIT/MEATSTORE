package notice;
import java.util.Date;
public class NoticeDTO {

		private int num;//글번호
		private String writer;//글쓴이
		private String Title;//글제목
		private String content;//글내용
		private String pw;//암호

		private Date regdate;//날짜
		private int readcount;//조횟수


	    private String ip;

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		public String getWriter() {
			return writer;
		}

		public void setWriter(String writer) {
			this.writer = writer;
		}


		public String getTitle() {
			return Title;
		}

		public void setTitle(String title) {
			Title = title;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getPw() {
			return pw;
		}

		public void setPw(String pw) {
			this.pw = pw;
		}

		public Date getRegdate() {
			return regdate;
		}

		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}

		public int getReadcount() {
			return readcount;
		}

		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}



		public String getIp() {
			return ip;
		}

		public void setIp(String ip) {
			this.ip = ip;
		}

		@Override
		public String toString() {
			return "NoticeDTO [num=" + num + ", writer=" + writer + ", Title=" + Title + ", content=" + content
					+ ", pw=" + pw + ", regdate=" + regdate + ", readcount=" + readcount + ", ip=" + ip + "]";
		}

		//검색해야하니까 int도 혹시모를 문자열도 일단 한번 더 toStirng해버림



	}
