<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_orderList.css" rel="stylesheet"/>
    <title>订单</title>
    <script>
        $(function () {
            $('#btn-ok').click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/order/close/" + $("#order_id_hidden").val(),
                    type: "PUT",
                    data: null,
                    dataType: "json",
                    success: function (data) {
                        if (data.success !== true) {
                            alert("订单处理异常，请稍候再试！");
                        }
                        location.href = "/tmall/order/0/10";
                    },
                    beforeSend: function () {

                    },
                    error: function () {
                        alert("订单取消出现问题，请稍后再试！");
                        location.href = "/tmall/order/0/10";
                    }
                });
            });
        });

        function closeOrder(orderCode) {
            if (isNaN(orderCode) || orderCode === null) {
                return;
            }
            $("#order_id_hidden").val(orderCode);
            $('#modalDiv').modal();
        }

        function getPage(index) {
            let name = $(".tab_select").children("a").attr("name");
            if (name === undefined) {
                name = "";
            }
            location.href = "${pageContext.request.contextPath}/order/" + index + "/10" + "?" + name;
        }
    </script>
</head>
<body>
<nav>
    <%@ include file="include/navigator.jsp" %>
    <br><br>
</nav>
<div class="content">
    <ul class="tabs_ul">
        <li <c:if test="${requestScope.status == null}">class="tab_select"</c:if>><a
                href="${pageContext.request.contextPath}/order/0/10">订单详情</a></li>

    </ul>
    <table class="table_orderList">
        <thead>
        <tr>
            <th>商品</th>
            <th width="80px">单价</th>
            <th width="80px">数量</th>
            <th width="140px">付款</th>
            <th width="140px">状态</th>
            <th width="140px">操作</th>
        </tr>
        </thead>
        <c:choose>
            <c:when test="${requestScope.productOrderList != null && fn:length(requestScope.productOrderList)>0}">
                <c:forEach items="${requestScope.productOrderList}" var="productOrder">
                    <tbody>
                    <tr class="tr_order_info">
                        <td colspan="6"><span class="span_pay_date">${productOrder.productOrder_pay_date}</span><span
                                class="span_order_code_title">订单号:</span><span
                                class="span_order_code">${productOrder.productOrder_code}</span></td>
                    </tr>
                    <c:forEach items="${productOrder.productOrderItemList}" var="productOrderItem" varStatus="i">
                        <tr class="tr_orderItem_info">
                            <td><img class="orderItem_product_image"
                                     src="${pageContext.request.contextPath}/res/images/item/productSinglePicture/${productOrderItem.productOrderItem_product.singleProductImageList[0].productImage_src}"
                                     style="width: 80px;height: 80px;"/><span class="orderItem_product_name"><a
                                    href="${pageContext.request.contextPath}/product/${productOrderItem.productOrderItem_product.product_id}">${productOrderItem.productOrderItem_product.product_name}</a></span>
                            </td>
                            <td><span
                                    class="orderItem_product_price">￥${productOrderItem.productOrderItem_price/productOrderItem.productOrderItem_number}</span>
                            </td>
                            <td><span
                                    class="orderItem_product_number">${productOrderItem.productOrderItem_number}</span>
                            </td>
                            <td class="td_order_content"><span
                                    class="orderItem_product_realPrice">￥${productOrderItem.productOrderItem_price}</span>
                            </td>
                            <c:if test="${i.count == 1}">
                                <c:choose>
                                    <c:when test="${productOrder.productOrder_status==0}">
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                            <span class="span_order_status" title="等待买家付款">等待买家付款</span>
                                        </td>
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                            <a class="order_btn pay_btn"
                                               href="${pageContext.request.contextPath}/order/pay/${productOrder.productOrder_code}">立即付款</a>
                                            <p class="order_close"><a class="order_close" href="javascript:void(0)"
                                                                      onclick="closeOrder('${productOrder.productOrder_code}')">取消订单</a>
                                            </p>
                                        </td>
                                    </c:when>
                                    <c:when test="${productOrder.productOrder_status==1}">
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                            <span class="span_order_status" title="买家已付款，等待卖家发货">等待卖家发货</span>
                                        </td>
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                            <a class="order_btn delivery_btn"
                                               href="${pageContext.request.contextPath}/order/delivery/${productOrder.productOrder_code}">提醒发货</a>
                                        </td>
                                    </c:when>
                                    <c:when test="${productOrder.productOrder_status==2}">
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                            <span class="span_order_status" title="卖家已发货，等待买家确认">等待买家收获</span>
                                        </td>
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                            <a class="order_btn confirm_btn"
                                               href="${pageContext.request.contextPath}/order/confirm/${productOrder.productOrder_code}">确认收货</a>
                                        </td>
                                    </c:when>
                                    <c:when test="${productOrder.productOrder_status==3}">
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                            <span class="span_order_status" title="交易成功">交易成功</span>
                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                            <span class="td_error" title="交易关闭">交易关闭</span>
                                        </td>
                                        <td class="td_order_content"
                                            rowspan="${fn:length(requestScope.productOrderItemList)}">
                                        </td>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            <c:if test="${productOrder.productOrder_status==3 && productOrderItem.isReview != null && !productOrderItem.isReview}">

                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tbody>
                <tr>

                    <td colspan="6" class="no_search_result"><span
                            class="error_msg">没有符合条件的宝贝，请尝试其他搜索条件。</span></td>
                </tr>
                </tbody>
            </c:otherwise>
        </c:choose>
    </table>
</div>
<%-- 模态框 --%>
<div class="modal fade" id="modalDiv" tabindex="-1" role="dialog" aria-labelledby="modalDiv" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">提示</h4>
            </div>
            <div class="modal-body">您确定要取消该订单吗？取消订单后，不能恢复。</div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="btn-ok">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close">关闭</button>
                <input type="hidden" id="order_id_hidden">
            </div>
        </div>
        <%-- /.modal-content --%>
    </div>
    <%-- /.modal --%>
</div>

</body>
