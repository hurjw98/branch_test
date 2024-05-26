<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>04_jstl_test.jsp</title>
<style>
/* 기본적인 스타일 초기화 */
body, h2, h3, form, select, input, div, p {
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
    align-items: center;
    flex-direction: column;
    min-height: 100vh;
    padding: 20px 0;
}

/* 컨텐츠 박스 스타일 */
.content-box {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    width: 100%;
    max-width: 600px;
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

/* 제목 스타일 */
h2, h3 {
    color: #555;
    margin-bottom: 10px;
}

/* 코드 블록 스타일 */
code {
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    padding: 5px;
    border-radius: 4px;
    font-family: "Courier New", Courier, monospace;
    font-size: 14px;
    display: block;
    white-space: pre-wrap; /* 줄 바꿈을 유지 */
    word-wrap: break-word; /* 단어 줄 바꿈을 허용 */
    margin: 10px 0;
}

/* 설명 텍스트 스타일 */
.explanation-box p {
    color: #333;
    margin-top: 0; /* 상단 마진 제거 */
}

/* 제목에 있는 코드 스타일 해제 */
h2 code, h3 code {
    background-color: transparent;
    border: none;
    padding: 0;
    border-radius: 0;
    font-family: inherit;
    font-size: inherit;
    display: inline;
    white-space: normal;
    word-wrap: normal;
}
</style>
</head>
<body>
    <div class="content-box">
        <h2>비교 연산</h2>
        <%
        request.setAttribute("small", 1); 
        request.setAttribute("big", 9999);
        %>
        big가 small보다 크다 = ${big > small}<br>
        <!-- true -->
    </div>

    <div class="content-box">
        <h2>JSTL <code>&lt;c:set&gt;</code></h2>
        <c:set var="i" value="4" />
        <div class="code-container">
            <code>코드 1: &lt;c:set var="i" value="4" /&gt;</code>
        </div>
        <div class="code-container">
            <code>코드 2: &lt;%equest.setAttribute("i", 4);%&gt;</code>
        </div>
        <p>코드 1과 코드 2는 같다</p>
        <div class="explanation-box">
            <h3>JSTL <code>&lt;c:set&gt;</code> 설명</h3>
            <p><code>&lt;c:set&gt;</code> 태그는 JSP에서 변수를 설정할 때 사용됩니다. <code>var</code> 속성은 변수 이름을 지정하고, <code>value</code> 속성은 변수가 가질 값을 지정합니다.</p>
        </div>
    </div>

    <div class="content-box">
        <h2>JSTL <code>&lt;c:if&gt;</code></h2>
        <div class="explanation-box">
            <h3>JSTL <code>&lt;c:if&gt;</code> 설명</h3>
            <p><code>&lt;c:if&gt;</code> 태그는 조건부로 JSP 페이지의 일부를 렌더링하는 데 사용됩니다. <code>test</code> 속성에 조건을 지정하여, 조건이 참이면 해당 블록이 실행됩니다.</p>
        </div>
        <h3>if문 예제</h3>
        <c:if test="${i > 3}">
            안녕하세요. 'i가 3보다 크다'는 참입니다.<br>
        </c:if>
    </div>

    <div class="content-box">
        <h2>JSTL <code>&lt;c:forEach&gt;</code></h2>
        <div class="explanation-box">
            <h3>JSTL <code>&lt;c:forEach&gt;</code> 설명</h3>
            <p><code>&lt;c:forEach&gt;</code> 태그는 JSP에서 반복문을 구현할 때 사용됩니다. <code>begin</code> 속성은 시작 값을, <code>end</code> 속성은 끝 값을, <code>step</code> 속성은 증가 값을 지정합니다.</p>
        </div>
        <h3>forEach문 예제</h3>
        <c:forEach var="count" begin="1" end="5">
            5번 반복되는 문장입니다.<br>
        </c:forEach>
        ------------------------------<br>
        <c:set var="numList" value="" />
        <c:forEach var="i" begin="1" end="10">
            <c:set var="numList" value="${numList} ${i}" />
        </c:forEach>
        1부터 10까지의 수 : ${numList}<br>
        ------------------------------<br>
        <c:set var="mySum1" value="0" />
        <c:forEach var="i" begin="1" end="10">
            <c:set var="mySum1" value="${mySum1 + i}" />
        </c:forEach>
        1부터 10까지의 합은 ${mySum1}입니다.<br>
        ------------------------------<br>
        <c:set var="mySum2" value="0" />
        <c:forEach var="j" begin="1" end="10" step="2">
            <c:set var="mySum2" value="${mySum2 + j}" />
        </c:forEach>
        숫자 1, 3, 5, 7, 9의 합은 ${mySum2}입니다.<br>
    </div>
</body>
</html>
