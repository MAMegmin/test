<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_register.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_register.css" rel="stylesheet">
    <title>注册页面</title>
    <script>
        $(function () {
            $("span.address_province").text($("#select_order_address_province").find("option:selected").text());
            $("span.address_city").text($("#select_order_address_city").find("option:selected").text());
            $("span.address_district").text($("#select_order_address_district").find("option:selected").text());
        })
    </script>
    <style>
        #nav {
            width: auto;
            height: 32px;
            font-family: "Microsoft YaHei UI", Tahoma, serif;
            font-size: 12px;
            position: relative !important;
            background: #f2f2f2;
            z-index: 999;
            border-bottom: 1px solid #e5e5e5;
        }

        /* 表单居中布局 */
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* 垂直居中 */
            background-color: #f9f9f9; /* 背景色 */
        }

        .form-list {
            width: 700px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* 表单项容器 */
        .form-item {
            display: flex;
            flex-direction: row; /* 水平排列标签和输入框 */
            align-items: center;
            margin-bottom: 15px; /* 适当减少行间距 */
        }

        /* 标签样式 */
        .form-label {
            width: 120px; /* 固定标签宽度 */
            text-align: left; /* 标签左对齐 */
            margin-right: 15px; /* 标签和输入框之间的间距 */
            font-weight: bold; /* 标签加粗 */
        }

        /* 输入框样式 */
        .form-text {
            flex: 1; /* 输入框占满剩余空间 */
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-text:focus {
            outline: none;
            border-color: #4CAF50; /* 聚焦时的边框颜色 */
        }

        /* 单选框 */
        .form-item input[type="radio"] {
            margin-right: 10px;
        }

        /* 地址部分的下拉框布局 */
        .form-item select {
            width: 32%; /* 设置每个下拉框的宽度 */
            margin-right: 5%; /* 各下拉框之间的间距 */
        }

        .form-item select:last-child {
            margin-right: 0; /* 最后一个下拉框没有右边距 */
        }

        /* 提交按钮 */
        #register_sub {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }

        #register_sub:hover {
            background-color: #45a049;
        }

        .msg {
            text-align: center;
            color: #28a745;
            font-size: 18px;
            padding: 10px;
            display: none; /* 默认不显示 */
        }

    </style>
</head>
<body>
<div class="content">
    <div class="form-list">
        <div class="steps">
            <div class="steps_main">
                <span class="steps_tsl">注册信息</span>
            </div>
        </div>
        <div class="form-item">
            <label class="form-label tsl">用户名：</label>
            <input name="user_name" id="user_name" class="form-text err-input" placeholder="请输入用户名" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">登录密码：</label>
            <input name="user_password" type="password" id="user_password" class="form-text err-input"
                   placeholder="请设置登录密码" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">确认密码：</label>
            <input name="user_password_one" type="password" id="user_password_one" class="form-text err-input"
                   placeholder="请再次输入你的密码" maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">昵称：</label>
            <input name="user_nickname" id="user_nickname" class="form-text err-input" placeholder="请输入昵称"
                   maxlength="20">
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">性别：</label>
            <input name="user_gender" type="radio" id="form_radion" value="0" checked="checked">男
            <input name="user_gender" type="radio" id="form_radions" value="1">女
        </div>
        <div class="form-item">
            <label class="form-label tsl">出生日期：</label>
            <input type="date" name="user_birthday" id="user_birthday" class="form-text err-input"/>
            <span class="form_span"></span>
        </div>
        <div class="form-item">
            <label class="form-label tsl">居住地址：</label>
            <select class="selectpicker" id="select_user_address_province" data-size="8" data-live-search="true">
                <c:forEach items="${requestScope.addressList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.addressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
            <select class="selectpicker" id="select_user_address_city" data-size="8" data-live-search="true">
                <c:forEach items="${requestScope.cityList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.cityAddressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
            <select name="user_address" class="selectpicker" id="select_user_address_district" data-size="8"
                    data-live-search="true">
                <c:forEach items="${requestScope.districtList}" var="address" varStatus="i">
                    <option value="${address.address_areaId}"
                            <c:if test="${requestScope.districtAddressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-item">
            <input type="button" id="register_sub" class="btns btn-large tsl" value="注 册"/>
        </div>
    </div>
</div>

<!-- 提示信息区域，注册成功后显示 -->
<div class="msg">
    <span>注册成功，跳转到登陆页面</span>
</div>

<script>
    // 这里假设后台处理注册后返回成功
    $('#register_sub').on('click', function () {
        // 模拟注册成功
        setTimeout(function() {
            $('.msg').show(); // 显示成功信息
            setTimeout(function() {
                window.location.href = '/login'; // 跳转到登录页面
            }, 2000); // 延迟2秒后跳转
        }, 1000); // 模拟注册延迟1秒
    });
</script>

<link href="${pageContext.request.contextPath}/res/css/fore/fore_foot_special.css" rel="stylesheet"/>
</body>
