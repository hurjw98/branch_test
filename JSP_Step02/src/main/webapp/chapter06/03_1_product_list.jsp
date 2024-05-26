<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>03_1_product_list.jsp</title>
<style>
/* 기본적인 스타일 초기화 */
body, h2, form, select, input {
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
}

/* 중앙 정렬을 위한 컨테이너 스타일 */
.container {
	width: 100%;
	max-width: 600px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* 폼 스타일 */
form {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	width: 100%;
}

/* 제목 스타일 */
h2 {
	color: #555;
	margin-bottom: 20px;
	text-align: center;
}

/* 셀렉트 박스 스타일 */
select {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

/* 버튼 스타일 */
input[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease-in-out;
}

/* 버튼 호버 스타일 */
input[type="submit"]:hover {
	background-color: #45a049;
}

/* 설명 박스 스타일 */
.explanation-box {
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 5px;
	font-size: 14px;
	width: 100%;
	word-wrap: break-word;
}

.page-scope {
	background-color: #fffacd;
	border: 1px solid #e6db55;
}

.request-scope {
	background-color: #d5f4e6;
	border: 1px solid #9de7c0;
}

.session-scope {
	background-color: #ffcccb;
	border: 1px solid #f4a7a1;
}

.application-scope {
	background-color: #e0e0e0;
	border: 1px solid #b3b3b3;
}

/* 코드 블록 스타일 */
code {
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	padding: 10px;
	border-radius: 4px;
	overflow-x: auto; /* 가로 스크롤 추가 */
	white-space: pre-wrap; /* 줄 바꿈 */
	display: block; /* 블록 요소로 설정 */
	margin: 0; /* 공백 제거 */
}
</style>
</head>
<body>
	<div class="container">
		<form action="03_2_product_sell.jsp" method="post">
			<jsp:useBean id="product" class="jsp_book.MyProduct" scope="session" />
			<h2>상품 목록</h2>
			<select name="sell">
				<%
				for (String item : product.getProductList()) {
					out.println("<option>" + item + "</option>");
				}
				%>
			</select> <input type="submit" value="선택" />
		</form>

		<!-- 아래는 코드에 대한 설명이다. -->
		<div class="explanation-box page-scope">
			<strong>page 스코프:</strong> 객체가 현재 JSP 페이지 내에서만 유효합니다. 페이지가 처리되는 동안에만
			객체가 존재하며, 다른 페이지에서는 객체에 접근할 수 없습니다. 기본값이 page 입니다.
			<code>&lt;jsp:useBean id="product" class="jsp_book.MyProduct" scope="page" /&gt;</code>
		</div>

		<div class="explanation-box request-scope">
			<strong>request 스코프:</strong> 객체가 하나의 HTTP 요청 동안 유효합니다. 같은 요청 내에서 다른
			JSP 페이지, 서블릿, 또는 다른 자원으로 포워딩할 때도 객체에 접근할 수 있습니다.
			<code>&lt;jsp:useBean id="product" class="jsp_book.MyProduct" scope="request" /&gt;</code>
		</div>

		<div class="explanation-box session-scope">
			<strong>session 스코프:</strong> 객체가 사용자의 세션 동안 유효합니다. 같은 세션 내에서 모든 JSP
			페이지와 서블릿에서 객체에 접근할 수 있습니다.
			<code>&lt;jsp:useBean id="product" class="jsp_book.MyProduct" scope="session" /&gt;</code>
		</div>

		<div class="explanation-box application-scope">
			<strong>application 스코프:</strong> 객체가 웹 애플리케이션 전역에서 유효합니다. 모든 사용자와 모든
			JSP 페이지, 서블릿에서 객체에 접근할 수 있습니다.
			<code>&lt;jsp:useBean id="product" class="jsp_book.MyProduct" scope="application" /&gt;</code>
		</div>
	</div>
</body>
</html>
