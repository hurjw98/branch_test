<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="my_model.MemberDAO"%>
<%@ page import="my_model.MemberDBBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>05_2_Member_Info.jsp</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

h2 {
    color: #333;
}

.info-container, .content-box {
    max-width: 700px;
    margin: 50px auto;
    padding: 20px;
    background: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}

th {
    background-color: #f2f2f2;
}

.button-container {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    padding: 0 20px;
}

.button-container input {
    flex: 1;
    margin: 0 10px;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
    font-size: 16px;
}

.button-container input.update {
    background-color: #007bff;
}

.button-container input.update:hover {
    background-color: #0056b3;
}

.button-container input.delete {
    background-color: #dc3545;
}

.button-container input.delete:hover {
    background-color: #c82333;
}

.button-container input.view-all {
    background-color: #28a745;
}

.button-container input.view-all:hover {
    background-color: #218838;
}

/* 설명 박스 스타일 */
.explanation-box {
    background-color: #fffacd;
    border: 1px solid #e6db55;
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 5px;
    font-size: 14px;
    word-wrap: break-word;
}

/* 코드 블록 스타일 */
.code-container {
    background-color: #fff;
    color: #333;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    margin-bottom: 10px;
}

.code-container code {
    display: block;
    white-space: pre-wrap; /* 줄 바꿈을 유지 */
    word-wrap: break-word; /* 단어 줄 바꿈을 허용 */
    font-family: "Courier New", Courier, monospace;
    color: #333;
}

/* 설명 텍스트 스타일 */
.explanation-box p {
    color: #333;
    margin-top: 0; /* 상단 마진 제거 */
}
</style>
</head>
<body>
    <div class="info-container">
        <center>
            <%
            String memberId = request.getParameter("id");
            if (memberId == null || memberId.isEmpty()) {
                memberId = (String) session.getAttribute("id");
            }

            MemberDAO mDAO = new MemberDAO();
            MemberDBBean member = mDAO.getMemberById(memberId);

            request.setAttribute("memberId", memberId);
            request.setAttribute("member", member);
            %>
            <h2>${memberId}님의 Member Detail Information</h2>
            <c:choose>
                <c:when test="${not empty member}">
                    <table>
                        <tr>
                            <th>아이디</th>
                            <td>${member.id}</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>${member.email}</td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td>${member.phone}</td>
                        </tr>
                        <tr>
                            <th>관심분야</th>
                            <td>${member.hobby}</td>
                        </tr>
                        <tr>
                            <th>직업</th>
                            <td>${member.job}</td>
                        </tr>
                        <tr>
                            <th>패스워드</th>
                            <td>${member.pass1}</td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td>${member.gender}</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>${member.address}</td>
                        </tr>
                        <tr>
                            <th>연령</th>
                            <td>${member.age}</td>
                        </tr>
                        <tr>
                            <th>하고 싶은 말</th>
                            <td>${member.info}</td>
                        </tr>
                    </table>
                </c:when>
                <c:otherwise>
                    <table>
                        <tr>
                            <td colspan="2">해당 회원의 정보가 없습니다.</td>
                        </tr>
                    </table>
                </c:otherwise>
            </c:choose>
        </center>
        <div class="button-container">
            <input type="button" value="전체회원보기" class="view-all" onclick="location.href='05_1_Member_list.jsp'" />
        </div>
    </div>

    <div class="content-box">
        <h2>코드 설명</h2>
        <div class="explanation-box">
            <div class="code-container">
                <code>&lt;c:choose&gt;&lt;/c:choose&gt;</code>
            </div>
            <p>조건부 논리를 처리하는 태그입니다. <code>c:when</code>과 <code>c:otherwise</code>를 포함하여 사용합니다.</p>
        </div>
        <div class="explanation-box">
            <div class="code-container">
                <code>&lt;c:when test="${condition}"&gt;&lt;/c:when&gt;</code>
            </div>
            <p>조건이 참일 때 실행되는 블록입니다. <code>c:choose</code> 안에 위치합니다.</p>
        </div>
        <div class="explanation-box">
            <div class="code-container">
                <code>&lt;c:otherwise&gt;&lt;/c:otherwise&gt;</code>
            </div>
            <p>모든 <code>c:when</code> 조건이 거짓일 때 실행되는 블록입니다.</p>
        </div>
        <div class="explanation-box">
            <div class="code-container">
                <code>request.setAttribute("memberId", memberId);</code><br>
                <code>request.setAttribute("member", member);</code>
            </div>
            <p>EL 표현식에서 사용할 수 있도록 데이터를 request 객체에 저장합니다.</p>
        </div>
    </div>
</body>
</html>
