<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderPaySuccess.css" rel="stylesheet"/>
    <title>支付成功</title>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div class="shopSearchHeader">

            <ul>
                <c:forEach items="${requestScope.categoryList}" var="category" varStatus="i">
                    <li>
                        <a href="${pageContext.request.contextPath}/product?category_id=${category.category_id}">${category.category_name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</nav>
<div class="content">
    <div class="content_main">
        <div id="J_AmountList">
            <h2>成功付款</h2>
            <div class="summary_pay_done">
            </div>
        </div>
        <div id="J_ButtonList">
            <span class="info">   </span>
            <a class="J_MakePoint" href="${pageContext.request.contextPath}/order/0/10">查看已买到的商品</a>
        </div>


    </div>
</div>

</body>