<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<script src="${pageContext.request.contextPath}/res/js/fore/fore_productList.js"></script>
<link href="${pageContext.request.contextPath}/res/css/fore/fore_productList.css" rel="stylesheet">
<body>
<title><c:choose><c:when test="${requestScope.searchValue != null}">${requestScope.searchValue}</c:when>
    <c:otherwise><c:choose><c:when
            test="${requestScope.productList != null && fn:length(requestScope.productList)>0}">${requestScope.productList[0].product_category.category_name}</c:when><c:otherwise>没找到相关商品</c:otherwise></c:choose></c:otherwise></c:choose></title>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div class="shopSearchHeader">
            <form action="${pageContext.request.contextPath}/product" method="get">
                <div class="shopSearchInput">
                    <input type="text" class="searchInput" name="product_name" placeholder="搜索"
                           value="${requestScope.searchValue}" maxlength="50">
                    <input type="submit" value="搜 索" class="searchBtn">
                </div>
            </form>
        </div>
    </div>
</nav>
<div class="context">
    <c:choose>
        <c:when test="${requestScope.productList != null && fn:length(requestScope.productList)>0}">
            <br><br><br>
            <div class="context_main">
                <c:forEach items="${requestScope.productList}" var="product">
                    <div class="context_productStyle">
                        <div class="context_product">
                            <a href="${pageContext.request.contextPath}/product/${product.product_id}"
                               target="_blank"><img class="context_product_imgMain"
                                                    src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${product.singleProductImageList[0].productImage_src}"/></a>
                            <ul class="context_product_imgList">
                                <c:forEach items="${product.singleProductImageList}" var="img">
                                    <li><img
                                            src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${img.productImage_src}"/>
                                    </li>
                                </c:forEach>
                            </ul>
                            <p class="context_product_price"><span>¥</span>${product.product_sale_price}</p>
                            <p class="context_product_name"><a href="/tmall/product/${product.product_id}"
                                                               target="_blank">${product.product_name}</a></p>


                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="error">
                <br><br><br>
                <h2>没找到“${requestScope.searchValue}”，数据库里商品比较少，请搜索“女装”</h2>

            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>