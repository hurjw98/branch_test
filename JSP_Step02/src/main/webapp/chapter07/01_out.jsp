<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 내가 직접 작성해야 하는 코드 -->
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%><!-- 내가 직접 작성해야 하는 코드 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>01_out.jsp</title>
<style>
/* 기본적인 스타일 초기화 */
body, h2, table, th, td, p {
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
    min-height: 100vh;
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
    text-align: left; /* 왼쪽 정렬 추가 */
}

/* 테이블 스타일 */
table {
    width: 50%;
    border-collapse: collapse;
    margin: 20px auto;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
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

/* 코드 컨테이너 스타일 */
.code-container {
    background-color: #fff;
    color: #333;
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
}

.code-container code {
    display: block;
    white-space: pre-wrap; /* 줄 바꿈을 유지 */
    word-wrap: break-word; /* 단어 줄 바꿈을 허용 */
    font-family: "Courier New", Courier, monospace;
}
</style>
</head>
<body>
    <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
    <div class="content-box">
        <center>
            <h2>&lt;c:out&gt;</h2>
            <table>
                <tr>
                    <th>이름</th>
                    <th>이메일</th>
                </tr>
                <c:forEach var="member" items="${members}">
                    <tr>
                        <td>${member.name }</td>
                        <td><c:out value="${member.email }" escapeXml="false">
                        <!-- false가 아니라 true이면 email 없음은 나오지 않음 -->
                                <font color=red>email 없음</font>
                            </c:out></td>
                    </tr>
                </c:forEach>
            </table>
        </center>
    </div>
    <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
    <div class="content-box">
        <h2>암기하세요</h2>
        <p>서버는 application, 브라우저가 session, 페이지는 request</p>
    </div>
    <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
    <div class="content-box">
        <h2>코드 설명</h2>
        <br>
        <div class="explanation-box">
            <strong>&lt;&nbsp;c:out&nbsp;&gt;&nbsp;태그 설명 :</strong>
            <p>
                <code>&lt;c:out&gt;</code>
                태그는 JSP에서 EL 표현식을 출력할 때 사용됩니다. 이 태그는 HTML 엔티티를 이스케이프 처리하여 XSS(크로스 사이트 스크립팅) 공격을 방지합니다.
            </p>
            <div class="code-container">
                <code>&lt;c:out value="${expression}" default="default value" escapeXml="true" /&gt;</code>
            </div>
        </div>
        <br>
        <div class="explanation-box">
            <strong>escapeXml 속성 설명 :</strong>
            <p>
                <code>escapeXml</code> 속성은 출력할 때 HTML 엔티티를 이스케이프할지 여부를 결정합니다. 기본값은 <code>true</code>이며, 이는 HTML 엔티티를 이스케이프하여 XSS 공격을 방지합니다. 만약 <code>false</code>로 설정하면 HTML 태그가 그대로 출력됩니다.
            </p>
            <div class="code-container">
                <code>&lt;c:out value="${expression}" escapeXml="false" /&gt;</code>
            </div>
        </div>
        <br>
        <div class="explanation-box">
            <strong>value 속성 설명 :</strong>
            <p>
                <code>value</code> 속성은 출력할 표현식을 지정합니다. 이 속성에는 출력할 값을 EL 표현식으로 지정할 수 있습니다.
            </p>
            <div class="code-container">
                <code>&lt;c:out value="${expression}" /&gt;</code>
            </div>
        </div>
        <br>
        <div class="explanation-box">
            <strong>default 속성 설명 :</strong>
            <p>
                <code>default</code> 속성은 <code>value</code> 속성이 <code>null</code>이거나 빈 문자열일 때 출력할 기본값을 지정합니다.
            </p>
            <div class="code-container">
                <code>&lt;c:out value="${expression}" default="기본값" /&gt;</code>
            </div>
        </div>
        <br>
    </div>
    <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</body>
</html>
