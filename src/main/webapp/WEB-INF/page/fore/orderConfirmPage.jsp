<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderConfirmPage.css" rel="stylesheet"/>
    <title>确认收货</title>
    <script>

    </script>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
</nav>

<div class="content">
    <div class="order_info">
        <h2>确认订单信息</h2>
        <table class="table_order_orderItem">
            <thead>
            <tr>
                <th>商品</th>
                <th>单价</th>
                <th>数量</th>
                <th>合计</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.productOrder.productOrderItemList}" var="orderItem" varStatus="i">
                <tr class="tr_product_info">
                    <td width="500px"><img
                            src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${orderItem.productOrderItem_product.singleProductImageList[0].productImage_src}"
                            style="width: 50px;height: 50px;"/><span class="span_product_name"><a
                            href="${pageContext.request.contextPath}/product/${orderItem.productOrderItem_product.product_id}"
                            target="_blank">${orderItem.productOrderItem_product.product_name}</a></span>
                    </td>
                    <td><span
                            class="span_product_sale_price">${orderItem.productOrderItem_product.product_sale_price}0</span>
                    </td>
                    <td><span class="span_productOrderItem_number">${orderItem.productOrderItem_number}</span></td>
                    <td><span class="span_productOrderItem_price"
                              style="font-weight: bold">${orderItem.productOrderItem_price}0</span></td>
                </tr>
            </c:forEach>
            <tr class="order-ft">
                <td colspan="4">
                    <div class="total-price">实付款：￥<strong>${requestScope.orderTotalPrice}0</strong></div>
                </td>
            </tr>
            </tbody>
            <tbody class="misc-info">
            <tr class="set-row">
                <td colspan="4"></td>
            </tr>

            </tbody>
        </table>
        <div class="order-dashboard">
            <div class="bd">
                <ul>
                    <li class="message">提示：这只是测试交易按钮</li>
                </ul>
                <script>
                    function confirmOrder() {
                        var yn = confirm("点击确认后，您将付款 ${requestScope.orderTotalPrice}0 元！");
                        if (yn) {
                            $.ajax({
                                url: "/tmall/order/success/${requestScope.productOrder.productOrder_code}",
                                type: "PUT",
                                data: null,
                                dataType: "json",
                                success: function (data) {
                                    if (data.success) {
                                        location.href = "/tmall/order/success/${requestScope.productOrder.productOrder_code}";
                                    } else {
                                        alert("订单确认异常，请稍后再试！");
                                        location.href = "/tmall/order/0/10";
                                    }
                                },
                                error: function (data) {
                                    alert("订单确认异常，请稍后再试！");
                                    location.href = "/tmall/order/0/10";
                                }
                            });
                        }
                    }
                </script>
                <a href="javascript:void(0)" onclick="confirmOrder()">确定</a>
            </div>
        </div>
    </div>
</div>

</body>
