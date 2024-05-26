<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 내가 직접 작성해야 하는 코드 -->
<%@page import="my_model.MemberDBBean"%>
<%@page import="java.util.Vector"%>
<%@page import="my_model.MemberDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>05_1_Member_list.jsp</title>
<style>
/* 기본적인 스타일 초기화 */
body, h2, table, th, td {
    margin: 0;
    padding: 0;
    border: 0;
}

/* 바디 스타일 */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: 100vh;
    padding: 20px;
}

/* 컨텐츠 박스 스타일 */
.content-box {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    width: 100%;
    max-width: 800px;
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

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
}

/* 링크 스타일 */
a {
    color: #4CAF50;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>
    <div class="content-box">
        <h2>전체 회원 보기</h2><br>
        <%
        MemberDAO mdao = new MemberDAO();
        Vector<MemberDBBean> myV = mdao.getMembers();
        // EL 자체가 일반변수선언은 인지하지 못함 그러므로 web server에 저장하여 사용
        request.setAttribute("vec", myV);
        %>
        <table>
            <tr>
                <th>아이디</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>취미</th>
                <th>직업</th>
            </tr>
            <c:forEach var="myBean" items="${vec}">
                <tr>
                    <!-- myBean.getId()를 쓸 필요없이, myBean.id로 해도 된다 -->
                    <td><a href="05_2_Member_Info.jsp?id=${myBean.id}">${myBean.id}</a></td>
                    <td>${myBean.email}</td>
                    <td>${myBean.phone}</td>
                    <td>${myBean.hobby}</td>
                    <td>${myBean.job}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="content-box">
        <h2>코드 설명</h2><br>
        <div class="explanation-box">
            <div class="code-container">
                <code>&lt;%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %&gt;</code>
            </div>
            <p>JSTL 코어 라이브러리를 JSP 페이지에 선언합니다.</p>
        </div>
    </div>
</body>
</html>
