<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/6/28
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>报名页面</title>
    <style>
        html,
        body {
            margin: 0;
        }

        .container {
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: aliceblue;
            background-size:contain;
        }

        .login-form {
            width: 400px;
            height: 500px;
            display: flex;
            flex-direction: column;
            padding: 40px;
            text-align: center;
            position: relative;

            z-index: 100;
            /* background: inherit; */
            /*留给大家的小惊喜，把代码注释去掉会有不一样的效果奥*/
            border-radius: 18px;
            overflow: hidden;
        }

        .login-form::before {
            content: '';
            width: calc(100% + 20px);
            height: calc(100% + 20px);
            box-shadow: inset 0 0 0 200px rgba(255, 255, 255, .5);
            /*box-shadow: inset 0 0 0 200px gray;*/
            position: absolute;
            top: -10px;
            left: -10px;
            z-index: -1;
            filter: blur(6px);
            overflow: hidden;
        }

        .login-form h2 {
            font-size: 25px;
            font-weight: 700;
            color: darkorange;
        }

        .login-form input,
        .login-form button {
            text-align: center;
            margin: 15px 0;
            height: 45px;
            border: none;
            /*background-color: rgba(22, 62, 132, .4);*/
            border-radius: 4px;
            padding: 0 14px;
            color: gray;
            outline: gray;
        }

        .login-form input{
            text-align: left;
        }
        .login-form button {
            margin-top: 24px;
            /*background-color: rgba(22, 62, 132, .3);*/
            color: gray;
            position: relative;
            overflow: hidden;
            cursor: pointer;
            transition: .6s;
        }

        .login-form button:hover {
            background-color: gray;
            color:#fff;
        }

        .login-form button::before {
            content: '';
            display: block;
            width: 60px;
            height: 100%;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0.5;
            position: absolute;
            left: 0;
            top: 0;
            transform: skewX(-45deg);
            filter: blur(10px);
            overflow: hidden;
            transform: translateX(-80px);
        }

        .login-form button:hover::before {
            transition: 1s;
            transform: translateX(320px);
            opacity: 0.8;
        }

        .login-form input::placeholder {
            text-align: left;
            color: gray;
        }
    </style>
</head>

<body>
<div class="container">
    <form action="#" class="login-form">
        <h2>报名</h2>
        <input type="text" name="teamName" placeholder="teamName">
        <p></p>
        <input type="text" name="member1" placeholder="member1">
        <input type="text" name="member2" placeholder="member2">
        <input type="text" name="member3" placeholder="member3">
        <button type="submit">提交</button>
    </form>
</div>
</body>

</html>
