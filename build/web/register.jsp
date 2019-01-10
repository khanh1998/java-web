<%-- 
    Document   : register
    Created on : Dec 8, 2018, 2:53:18 PM
    Author     : KHANHBQSE63463
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a new account</title>
        <s:head/>
    </head>
    <body>
        
        <s:if test="#session.role != 1">
            <p style="color: red">You don't have permission to access this page!</p>
        </s:if>
        <s:if test="#session.role == 1">
            <p style="color: blueviolet">Welcome <s:property value="#session.userId"/></p> | 
            <p style="color: tomato"><a href="logout">Log out</a></p>
            <h1>Register</h1>
            
            <s:form action="register">
                <s:textfield name="userID" label="User ID"/>
                <s:if test='exception.message.indexOf("duplicate") > -1'>
                    <p style="color: red">This user id is used by someone</p>
                </s:if>
                <s:textfield name="email" label="Email"/>
                <s:textfield name="firstName" label="First Name"/>
                <s:textfield name="lastName" label="Last Name"/>
                <s:textfield name="website" label="Website"/>
                <s:password name="password" label="Password"/>
                <s:password name="repassword" label="Re-Password"/>
                <s:checkbox name="sendNotification" label="Send Notification"/>
                <s:radio name="role" list="{0,1}"/>
                <s:submit value="Register"/>
            </s:form>
        </s:if>
    </body>
</html>
