<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="./css/application.css" />
<div class="container">
    <form action="ApplicationServlet" class="login-form">
        <h2>报名</h2>
        <input type="hidden" name="matchId" value="${param.matchId}">
        <input type="text" name="teamName" placeholder="队名">
        <input type="text" name="description" placeholder="简介">
        <input type="text" name="member1" placeholder="队员1">
        <input type="text" name="member2" placeholder="队员2">
        <input type="text" name="member3" placeholder="队员3">
        <button type="submit">提交</button>
    </form>
</div>



