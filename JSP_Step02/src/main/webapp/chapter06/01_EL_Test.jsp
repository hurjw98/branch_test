<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>01_EL_Test.jsp</title>
<style>
/* 기본적인 스타일 초기화 */
body, h2, h3, p, div {
    margin: 0;
    padding: 0;
}

/* 바디 스타일 */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333;
    padding: 20px;
}

/* 설명 박스 스타일 */
.explanation-box {
    background-color: #fffacd;
    border: 1px solid #e6db55;
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 5px;
}

/* 제목 스타일 */
h2 {
    color: #555;
    margin-bottom: 10px;
}

/* 작은 제목 스타일 */
h3 {
    color: #666;
    margin-bottom: 10px;
}

/* 내용 스타일 */
p {
    margin-bottom: 10px;
}

/* 수평선 스타일 */
hr {
    margin: 20px 0;
    border: none;
    border-top: 1px solid #ccc;
}
</style>
</head>
<body>

<div class="explanation-box">
    JSP(JavaServer Pages)는 자바 서블릿 기술을 기반으로 웹 페이지를 동적으로 생성하는 데 사용됩니다.
    JSP는 HTML과 자바 코드를 혼합하여 작성할 수 있으며,
    이를 통해 서버 측에서 처리된 데이터를 클라이언트에게 전달할 수 있습니다.
    JSP에서 자주 사용되는 요소로는
    스크립트 태그, 스크립트 태그 표현식, 그리고 EL(Expression Language) 표현식이 있습니다.
    각각에 대해 자세히 설명하겠습니다.
</div>

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<h2>1. 스크립트 태그 (Script Tag)</h2>
<div class="explanation-box">
    스크립트 태그는 JSP 페이지 내에서 자바 코드를 작성할 수 있게 해주는 태그입니다.
    주요 스크립트 태그에는 <code>&lt;% ... %&gt;</code> (스크립트릿), <code>&lt;%= ... %&gt;</code> (표현식), <code>&lt;%! ... %&gt;</code> (선언)이 있습니다.
</div>
<%
int i = 3;
out.println("i 값 = " + i);
%>

<br><p></p>
<hr>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<h2>2. 스크립트 태그 표현식</h2>
<div class="explanation-box">
    스크립트 태그 표현식은 <code>&lt;%= ... %&gt;</code>를 사용하여 자바 표현식의 결과를 JSP 페이지에 직접 출력합니다.
    예를 들어 변수의 값을 출력하거나 메소드의 반환 값을 출력하는 데 사용됩니다.
</div>
i값 = <%= i %><br>
i가 4보다 크다 = <%= i > 4 %><br><!-- false -->

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!-- 문자데이터로 연산시 문자타입으로 자동 변환 -->
i4 = <%= 3 + "4" %><!-- 34 -->

<br><p></p>
<hr>

<h2>3. EL 태그 표현식</h2>
<div class="explanation-box">
    EL(Expression Language)은 JSP 2.0부터 도입된 표현식 언어로,
    더 간결하고 읽기 쉬운 방식으로 데이터를 접근하고 조작할 수 있게 해줍니다.
    EL 표현식은 <code>${expression}</code> 형식으로 작성되며, JSP 컨텍스트에서 데이터를 참조합니다.
</div>
<%
int a = 3;
request.setAttribute("b", 4);
request.setAttribute("c", "5");
%>
1. a 값 = ${a}<br><!-- 아무것도 출력되지 않음 -->
2. b 값 = ${b}<br><!-- 4 -->
3. c가 b보다 크다 = ${c > b}<br><!-- true -->
4. b + 7 = ${b + 7}<br><!-- 11 -->
5. c + 7 = ${c + 7}<br><!-- 12 -->

</body>
</html>
