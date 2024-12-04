<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="include/header.jsp" %>
<head>
    <script src="${pageContext.request.contextPath}/res/js/fore/fore_userDatiles.js"></script>
    <link href="${pageContext.request.contextPath}/res/css/fore/fore_userDatiles.css" rel="stylesheet">
    <title>个人资料</title>
    <style rel="stylesheet">
        /* 确保body没有外边距，并且填充整个视口 */
        body {
            margin: 0;
            padding: 0;
            font-family: "Microsoft YaHei", Tahoma, serif;
            background-color: #f9f9f9;  /* 背景色 */
        }

        /* 导航栏的样式 */
        #baseNavigator {
            padding: 22px 0;
            width: 1190px;
            height: 44px;
            margin: auto;
        }

        #baseNavigator img {
            width: 190px;
            margin-top: 8px;
        }

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

        /* 注册页面内容区域的样式 */
        .content {
            display: flex;
            justify-content: center;  /* 水平居中 */
            align-items: flex-start;  /* 垂直对齐到顶部 */
            min-height: 100vh;  /* 设置最小高度为视口高度 */
            padding-top: 20px;  /* 上边距 */
        }

        .sns-config {
            width: 100%;  /* 让表单区域宽度100% */
            max-width: 800px;  /* 设置最大宽度为800px */
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  /* 添加阴影效果 */
            border-radius: 10px;  /* 设置圆角 */
            box-sizing: border-box;  /* 确保内边距不会影响宽度 */
        }

        /* 使用flex布局来调整标签和输入框的排版 */
        .form-item {
            display: flex;  /* 设置为flex布局 */
            flex-direction: row;  /* 水平排列 */
            align-items: center;  /* 垂直居中对齐 */
            margin-bottom: 20px; /* 增加表单项之间的间距 */
        }

        .form-label {
            width: 120px;  /* 给标签设置统一的宽度 */
            display: inline-block;
            text-align: left;  /* 标签左对齐 */
            margin-right: 20px;  /* 标签与输入框的间距 */
            font-weight: bold;  /* 加粗标签 */
        }

        .form-text {
            width: 100%;  /* 让输入框充满父容器的宽度 */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;  /* 包括内边距 */
        }

        .btns {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;  /* 按钮上方增加一些间距 */
            box-sizing: border-box;
        }

        .btns:hover {
            background-color: #45a049;
        }

        .radio_value {
            margin-right: 20px;
        }

        .form_span {
            color: red;
            font-size: 12px;
            margin-top: 5px;
            display: block; /* 错误提示文本显示为块级元素 */
        }
    </style>
</head>

<body>
<!-- 导航栏 -->
<nav>
    <%@ include file="include/navigator.jsp" %>
</nav>

<!-- 注册表单区域 -->
<div class="content">
    <div class="sns-config" id="profile">
        <div class="sns-tab tab-app">
            <span>个人资料</span>
        </div>
        <div class="sns-main">
            <form action="${pageContext.request.contextPath}/user/update" method="post" id="register_form">
                <!-- 昵称 -->
                <div class="form-item">
                    <label class="form-label tsl">昵称：</label>
                    <input name="user_nickname" value="${requestScope.user.user_nickname}" id="user_nickname"
                           class="form-text err-input" maxlength="20">
                    <span class="form_span"></span>
                </div>

                <!-- 真实姓名 -->
                <div class="form-item">
                    <label class="form-label tsl">真实姓名：</label>
                    <input name="user_realname" value="${requestScope.user.user_realname}" id="user_realname"
                           class="form-text err-input" maxlength="20">
                    <span class="form_span"></span>
                </div>

                <!-- 登录密码 -->
                <div class="form-item">
                    <label class="form-label tsl">登录密码：</label>
                    <input name="user_password" type="password" id="user_password" class="form-text err-input"
                           placeholder="" maxlength="20">
                    <span class="form_span"></span>
                </div>

                <!-- 确认密码 -->
                <div class="form-item">
                    <label class="form-label tsl">确认密码：</label>
                    <input name="user_password_one" type="password" id="user_password_one" class="form-text err-input"
                           placeholder="" maxlength="20">
                    <span class="form_span"></span>
                </div>

                <!-- 性别 -->
                <div class="form-item">
                    <label class="form-label tsl">性别：</label>
                    <input name="user_gender" type="radio" id="form_radion" value="0"
                           <c:if test="${requestScope.user.user_gender == 0}">checked="checked"</c:if>><span class="radio_value">男</span>
                    <input name="user_gender" type="radio" id="form_radions" value="1"
                           <c:if test="${requestScope.user.user_gender == 1}">checked="checked"</c:if>><span class="radio_value">女</span>
                </div>

                <!-- 生日 -->
                <div class="form-item">
                    <label class="form-label tsl">生日：</label>
                    <input type="date" name="user_birthday" id="user_birthday" class="form-text err-input"
                           value="${requestScope.user.user_birthday}" maxlength="20">
                    <span class="form_span"></span>
                </div>

                <!-- 居住地址 -->
                <div class="form-item last-item">
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
                    <select name="user_address" class="selectpicker" id="select_user_address_district" data-size="8" data-live-search="true">
                        <c:forEach items="${requestScope.districtList}" var="address" varStatus="i">
                            <option value="${address.address_areaId}"
                                    <c:if test="${requestScope.districtAddressId==address.address_areaId}">selected</c:if>>${address.address_name}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- 提交按钮 -->
                <div class="form-item">
                    <input type="submit" id="register_sub" class="btns btn-large tsl" value="提 交"/>
                </div>
            </form>
        </div>
    </div>
</div>

<link href="${pageContext.request.contextPath}/res/css/fore/fore_foot_special.css" rel="stylesheet"/>
</body>
</html>
