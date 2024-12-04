<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_login.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_productDetails.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_productDetails.css" rel="stylesheet">
    <title>${requestScope.product.product_name}</title>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <div class="header">
        <input id="tid" type="hidden" value="${requestScope.product.product_category.category_id}"/>

        <div class="shopSearchHeader">
            <form action="${pageContext.request.contextPath}/product" method="get">
                <div class="shopSearchInput">
                    <input type="text" class="searchInput" name="product_name" placeholder=""
                           maxlength="50">
                    <input type="submit" value="搜索" class="searchTmall">
                </div>
            </form>

        </div>
    </div>
</nav>

<div class="loginModel"></div>
<div class="loginDiv">


    <div class="pwdLogin">
        <span class="loginTitle">密码登录</span>
        <form method="post" class="loginForm">
            <div class="loginInputDiv">
                <label for="name" class="loginLabel"><img
                        src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/2018-04-27_235518.png"
                        width="38px" height="39px" title="会员名"/></label>
                <input type="text" name="name" id="name" class="loginInput" placeholder="会员名/邮箱/手机号">
            </div>
            <div class="loginInputDiv">
                <label for="password" class="loginLabel"><img
                        src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/2018-04-27_235533.png"
                        width="38px" height="39px" title="登录密码"/></label>
                <input type="password" name="password" id="password" class="loginInput">
            </div>
            <input type="submit" class="loginButton" value="登 录">
        </form>
        <div class="loginLinks">

            <a href="${pageContext.request.contextPath}/register" target="_blank">免费注册</a>
        </div>
        <div class="error_message">
            <p id="error_message_p"></p>
        </div>
    </div>0
</div>



<div class="context">
    <div class="context_left">
        <div class="context_img_ks">
            <img src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${requestScope.product.singleProductImageList[0].productImage_src}"
                 width="800px" height="800px">
        </div>
        <div class="context_img">
            <img src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${requestScope.product.singleProductImageList[0].productImage_src}"
                 class="context_img_main" width="400px" height="400px"/>
            <div class="context_img_winSelector"></div>
        </div>
        <ul class="context_img_ul">
            <c:forEach var="img" items="${requestScope.product.singleProductImageList}">
                <li class="context_img_li"><img
                        src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${img.productImage_src}"/>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>



    <div class="context_info">
        <div class="context_info_name_div">
            <p class="context_info_name">${requestScope.product.product_name}</p>
        </div>


            <dl class="context_promotePrice_panel">
                <dt>促销价</dt>
                <dd><em>¥</em><span>${requestScope.product.product_sale_price}0</span></dd>
            </dl>


        <dl class="context_info_member">
            <dt>数量</dt>
            <dd>
                <input type="text" value="1" maxlength="8" title="请输入购买量" class="context_buymember">
                <input type="hidden" id="stock" value="1000">
                <span class="amount-btn">
                    <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/up.png"
                         class="amount_value_up">
                    <img src="${pageContext.request.contextPath}/res/images/fore/WebsiteImage/down.png"
                         class="amount_value-down">
                </span>
                <span class="amount_unit">件</span>

            </dd>
        </dl>

        <div class="context_buy">
            <script>
                $(function () {
                    //点击购买按钮时
                    $(".context_buy_form").submit(function () {
                        if ('${sessionScope.userId}' === "") {
                            $(".loginModel").show();
                            $(".loginDiv").show();
                            return false;
                        }
                        var number = isNaN($.trim($(".context_buymember").val()));
                        if (number) {
                            location.reload();
                        } else {
                            location.href = "${pageContext.request.contextPath}/order/create/${requestScope.product.product_id}?product_number=" + $.trim($(".context_buymember").val());
                        }
                        return false;
                    });
                    //点击加入购物车按钮时
                    $(".context_buyCar_form").submit(function () {
                        if ('${sessionScope.userId}' === "") {
                            $(".loginModel").show();
                            $(".loginDiv").show();
                            return false;
                        }
                        var number = isNaN($.trim($(".context_buymember").val()));
                        if (number) {
                            location.reload();
                        } else {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/orderItem/create/${requestScope.product.product_id}?product_number=" + $.trim($(".context_buymember").val()),
                                type: "POST",
                                data: {"product_number": number},
                                dataType: "json",
                                success: function (data) {
                                    if (data.success) {
                                        $(".msg").stop(true, true).animate({
                                            opacity: 1
                                        }, 550, function () {
                                            $(".msg").animate({
                                                opacity: 0
                                            }, 1500);
                                        });
                                    } else {
                                        if (data.url != null) {
                                            location.href = "/tmall" + data.url;
                                        } else {
                                            alert("加入购物车失败，请稍后再试！");
                                        }
                                    }
                                },
                                beforeSend: function () {

                                },
                                error: function () {
                                    alert("加入购物车失败，请稍后再试！");
                                }
                            });
                            return false;
                        }
                    });
                });
            </script>
            <form method="get" class="context_buy_form">
                <input class="context_buyNow" type="submit" value="立即购买"/>
            </form>

        </div>

    </div>


<div class="msg">
    <span>商品已添加</span>
</div>

</body>