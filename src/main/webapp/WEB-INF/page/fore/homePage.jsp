<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/jquery-color-2.1.2.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_home.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_home.css" rel="stylesheet"/>
    <title>网络应用开发购物网站</title>
    <style>
        /* 居中导航栏 */
        nav {
            width: 100%;
            text-align: center; /* 将整个导航栏内容居中 */
        }

        /* 居中搜索栏 */
        .header .mallSearch {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            max-width: 800px; /* 限制最大宽度 */
            margin-left: auto;
            margin-right: auto; /* 水平居中 */
            margin-top: 20px;
        }

        /* 对齐输入框和按钮 */
        .mallSearch-input {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%; /* 确保宽度 */
        }

        .header_search_input {
            width: 75%; /* 设置输入框宽度 */
            padding: 10px;
            font-size: 14px;
            height: 40px; /* 设置输入框的高度 */
            border: 1px solid #ccc; /* 设置输入框的边框 */
            border-right: none; /* 去掉右边框，确保输入框和按钮对接 */
        }

        .header_search_button {
            padding: 10px 16px;
            font-size: 14px;
            height: 40px; /* 设置按钮的高度与输入框一致 */
            border: 1px solid #ccc; /* 设置按钮的边框 */
            background-color: #3498db; /* 设置按钮的背景色 */
            color: white; /* 设置按钮文字颜色 */
            cursor: pointer; /* 鼠标悬停时显示为手形 */
            border-left: none; /* 去掉左边框，使按钮和输入框无缝连接 */
        }

        .header_search_button:hover {
            background-color: #2980b9; /* 鼠标悬停时按钮背景色变化 */
        }

        /* 使商品展示部分居中 */
        .banner_do {
            display: flex;
            justify-content: center;
            padding: 20px 0;
        }

        .banner_goods {
            width: 80%; /* 设置一个适当的宽度 */
        }

        .banner_goods_type {
            margin-bottom: 30px;
        }

        .banner_goods_title {
            font-size: 20px;
            text-align: center;
            margin-bottom: 10px;
        }

        .banner_goods_items {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .banner_goods_item {
            margin: 10px;
            text-align: center;
        }

        .banner_goods_item img {
            width: 200px;
            height: 200px;
            object-fit: cover;
        }

        .banner_goods_item .goods_name {
            display: block;
            margin-top: 10px;
            font-size: 16px;
        }

        .banner_goods_item .goods_price {
            display: block;
            margin-top: 5px;
            font-size: 18px;
            color: #e74c3c;
        }
    </style>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <div class="mallSearch">
            <form action="${pageContext.request.contextPath}/product" method="get">
                <div class="mallSearch-input">
                    <input class="header_search_input" type="text" name="product_name" placeholder="商品"
                           maxlength="50">
                    <input class="header_search_button" type="submit" value="搜索">
                </div>
            </form>
        </div>
    </div>
</nav>

<div class="banner_do">
    <div class="banner_goods">
        <c:forEach items="${requestScope.categoryList}" var="category">
            <c:if test="${fn:length(category.productList)>0}">
                <div class="banner_goods_type">

                    <div class="banner_goods_items">
                        <c:forEach items="${category.productList}" var="product" varStatus="i">
                            <c:if test="${i.index<8}">
                                <div class="banner_goods_item">
                                    <a href="product/${product.product_id}" class="goods_link"></a>
                                    <img src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${product.singleProductImageList[0].productImage_src}">
                                    <a href="product/${product.product_id}"
                                       class="goods_name">${product.product_name}</a>
                                    <span class="goods_price">￥${product.product_sale_price}</span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

</body>
