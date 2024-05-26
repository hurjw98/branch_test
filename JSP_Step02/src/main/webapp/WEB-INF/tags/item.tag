<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="bgcolor" required="false" %>
<%@ attribute name="border" required="false" %>
<%@ attribute name="borderColor" required="false" %>
<%@ tag import="jsp_book.MyProduct" %>
<jsp:useBean id="product" class="jsp_book.MyProduct" scope="page" />

<style>
.table-container {
    background-color: ${bgcolor};
    border: ${border}px solid ${borderColor};
    width: 150px;
}

.table-container table {
    width: 100%;
    border-collapse: collapse;
}

.table-container th, .table-container td {
    border: ${border}px solid ${borderColor};
    color: black;
    text-align: left;
    padding: 10px;
}
</style>

<h3><jsp:doBody /></h3> <!-- 본체의 내용 그대로 출력 -->

<div class="table-container">
    <table>
        <c:forEach var="item" items="${product.productList}">
            <tr>
                <td>${item}</td>
            </tr>
        </c:forEach>
    </table>
</div>




<%-- 
body-content : 몸체 내용의 종류를 입력, 
empty: 바디가 비어있어야 한다 (출력코드가 있으면 안된다)
tagdependent :  태그의 몸체에 있는 것은 태그 자체의 구현에 의해 해석
scriptless : 액션 태그가 몸체에 올 수 있고  스크립트 요소는 올 수 없다
중 한가지를 사용, 기본값은 scriptless
--%>