<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2020/6/22
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>log in</title>
</head>
<body>
<form method="post" action="validate.jsp">
    <h1>欢迎您的登录</h1>
    账户：<input type="text" name="username"/><br>
    密码：<input type="password" name="password" /><br>
    <input type="submit" name="button" value="注册"/>
    <input type="submit" name="button" value="登录"/>
</form>
</body>
</html>
