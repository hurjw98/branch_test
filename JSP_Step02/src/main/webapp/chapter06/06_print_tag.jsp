<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 내가 직접 작성해야 하는 코드 -->
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags" %><!-- 내가 직접 작성해야 하는 코드 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>06_print_tag.jsp</title>
<style>
/* 기본적인 스타일 초기화 */
body, h2 {
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
    <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
    <div class="content-box">
        <h2>print.tag 사용하기</h2>
        <mytag:print/>
    </div>
    <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
    <div class="content-box">
        <h2>item.tag 사용하기</h2>
        <mytag:item border="1" bgcolor="white" borderColor="lightblue">
            <!-- 사용자 정의 태그의 본체 내용 -->
            상품 목록
        </mytag:item>
    </div>
    <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</body>
</html>
