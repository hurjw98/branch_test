package my_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MemberDAO {
    private Connection conn = null; // 접근 설정
    private PreparedStatement pstmt = null; // 쿼리로 형변환
    private String message = ""; // 메시지 저장 변수

    // 데이터베이스 연결정보
    final String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
    final String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
    final String dbUser = "system";
    final String dbPw = "12345";

    // 오라클에 연결하는 메서드
    public void getConnection() {
        try {
            // 1. 오라클 드라이버 인식 (ojdbc8.jar)
            Class.forName(jdbc_driver);
            // 2. 오라클 접속
            conn = DriverManager.getConnection(jdbc_url, dbUser, dbPw);
        } catch (Exception e) {
            e.printStackTrace();
        } // try-catch
    } // method

    // 오라클과의 연결을 종료하는 메서드
    public void closeConnection() {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } // try-catch
    } // method

    // insert하는 메서드
    public boolean insertMember(MemberDBBean mDTO) {
        boolean isSuccess = false;
        try {
            getConnection();
            // 3. SQL 작성
            String sql = "INSERT INTO member (id, pass1, pass2, email, gender, address, phone, hobby, job, age, info) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mDTO.getId());
            pstmt.setString(2, mDTO.getPass1());
            pstmt.setString(3, mDTO.getPass2());
            pstmt.setString(4, mDTO.getEmail());
            pstmt.setString(5, mDTO.getGender());
            pstmt.setString(6, mDTO.getAddress());
            pstmt.setString(7, mDTO.getPhone());
            pstmt.setString(8, mDTO.getHobby());
            pstmt.setString(9, mDTO.getJob());
            pstmt.setString(10, mDTO.getAge());
            pstmt.setString(11, mDTO.getInfo());

            pstmt.executeUpdate();
            message = "데이터가 성공적으로 삽입되었습니다.";
            isSuccess = true; // 성공 시 true 반환
        } catch (Exception e) {
            message = "데이터 삽입 중 오류가 발생했습니다: " + e.getMessage();
            e.printStackTrace();
        } finally {
            closeConnection();
        } // try-catch
        return isSuccess;
    }

    public String getMessage() {
        return message;
    } // method

    // 회원 정보를 조회하는 메서드
    public Vector<MemberDBBean> getMembers() {
        Vector<MemberDBBean> memberVector = new Vector<>();
        ResultSet rs = null;

        try {
            getConnection();
            String sql = "SELECT * FROM member";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(); // 오라클 -> MemberDBBean

            while (rs.next()) {
                MemberDBBean member = new MemberDBBean();
                member.setId(rs.getString("id"));
                member.setPass1(rs.getString("pass1"));
                member.setEmail(rs.getString("email"));
                member.setGender(rs.getString("gender"));
                member.setAddress(rs.getString("address"));
                member.setPhone(rs.getString("phone"));
                member.setHobby(rs.getString("hobby"));
                member.setJob(rs.getString("job"));
                member.setAge(rs.getString("age"));
                member.setInfo(rs.getString("info"));
                memberVector.add(member);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        } // try-catch
        return memberVector;
    } // method

    // 아이디 중복 여부를 확인하는 메서드
    public boolean isIdExist(String id) {
        boolean isExist = false;
        ResultSet rs = null;
        
        try {
            getConnection();
            String sql = "SELECT COUNT(*) FROM member WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                isExist = rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        } // try-catch
        return isExist;
    } // method

    // 비밀번호 검증 메서드
    public boolean isPasswordCorrect(String id, String password) {
        boolean isCorrect = false;
        ResultSet rs = null;

        try {
            getConnection();
            String sql = "SELECT pass1 FROM member WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                isCorrect = password.equals(rs.getString("pass1"));
            } // if
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        } // try-catch
        return isCorrect;
    } // method
    
    // 특정 회원의 정보를 가져오는 메서드
    public MemberDBBean getMemberById(String id) {
        MemberDBBean member = null;
        ResultSet rs = null;

        try {
            getConnection();
            String sql = "SELECT * FROM member WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new MemberDBBean();
                member.setId(rs.getString("id"));
                member.setPass1(rs.getString("pass1"));
                member.setEmail(rs.getString("email"));
                member.setGender(rs.getString("gender"));
                member.setAddress(rs.getString("address"));
                member.setPhone(rs.getString("phone"));
                member.setHobby(rs.getString("hobby"));
                member.setJob(rs.getString("job"));
                member.setAge(rs.getString("age"));
                member.setInfo(rs.getString("info"));
            } // if
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        } // try-catch
        return member;
    } // method
    
    // 회원 정보를 수정하는 메서드
    public void updateMember(MemberDBBean member) {
		try {
            getConnection();
            String sql = "UPDATE member SET email = ?, address=?, phone=?, info=? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getEmail());
            pstmt.setString(2, member.getAddress());
            pstmt.setString(3, member.getPhone());
            pstmt.setString(4, member.getInfo());
            pstmt.setString(5, member.getId());
            pstmt.executeUpdate();
		} catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        } // try-catch
	} // method
    
    // 회원을 삭제하는 메서드
    public void deleteMember(String id) {
		try {
            getConnection();
            String sql = "delete from member where id like ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
		} catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        } // try-catch
	} // method

} // class
