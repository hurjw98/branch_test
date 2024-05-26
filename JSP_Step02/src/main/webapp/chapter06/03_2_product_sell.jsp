<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>03_2_product_sell.jsp</title>
<style>
/* 기본적인 스타일 초기화 */
body, h2, p, div {
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
	height: 100vh;
	padding: 20px;
}

/* 중앙 정렬 div 스타일 */
.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 60%;
}

/* 설명 박스 스타일 */
.explanation-box {
	background-color: #fffacd;
	border: 1px solid #e6db55;
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 5px;
	text-align: left;
	font-size: 14px;
}

/* 제목 스타일 */
h2 {
	color: #555;
	margin-bottom: 20px;
}

/* 수평선 스타일 */
hr {
	margin: 20px 0;
	border: none;
	border-top: 1px solid #ccc;
}

/* 본문 텍스트 스타일 */
p {
	margin-bottom: 10px;
	font-size: 16px;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
	%>
	<div class="container">
		<h2>상품 선택</h2>
		<hr />
		<p>1. 선택한 상품 : ${param.sell}</p>
		<p>2. num1 + num2 = ${product.num1 + product.num2}</p>
		<!-- 10 + 20이므로 30 -->
		<br>
		<div class="explanation-box">
			<p>
				<strong>EL(Expression Language) : </strong> JSP 2.0부터 도입된 표현식 언어로, 더
				간결하고 읽기 쉬운 방식으로 데이터를 접근하고 조작할 수 있게 해줍니다. EL 표현식은
				<code>${expression}</code>
				형식으로 작성되며, JSP 컨텍스트에서 데이터를 참조합니다.
			</p>
			<p>
				<strong>param 객체 : </strong> 요청 파라미터 값을 읽을 때 사용됩니다.
				<code>${param.name}</code>
				형식으로 작성하면 HTTP 요청 파라미터 중 name에 해당하는 값을 가져올 수 있습니다.
			</p>
		</div>
	</div>
</body>
</html>
