<%--
  Created by IntelliJ IDEA.
  User: Jackie
  Date: 2017/2/13
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CAS &#8211; Central Authentication Service</title>

    <%--<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">--%>
    <link rel="icon" href="<c:url value="/favicon-16x16.png" />" type="image/x-icon" sizes="16x16"/>

    <link rel="stylesheet" href="<c:url value="/plugins/bootstrap-3.3.7-dist/css/bootstrap.css" />" />
    <link rel="stylesheet" href="<c:url value="/css/customLogin.css" />" />
    <script src="<c:url value="/js/jquery-1.11.3.js" />"></script>
    <script src="<c:url value="/plugins/bootstrap-3.3.7-dist/js/bootstrap.js" />"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div id="box">
            <h2>IK Login</h2>
            <hr>
            <%--<form class="form-horizontal" action=" " method="" id="contact_form">--%>
            <form:form cssClass="form-horizontal" method="post" id="fm1" commandName="${commandName}" htmlEscape="true">
                <fieldset>
                    <!-- Form Name -->

                    <div class="form-group">
                        <div class="col-md-12" style="display: none">
                            <form:errors path="*" id="msg" cssClass="errors" element="div" htmlEscape="false"/>
                        </div>
                    </div>
                    <!-- Text input-->

                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>

                                <c:choose>
                                    <c:when test="${not empty sessionScope.openIdLocalId}">
                                        <strong><c:out value="${sessionScope.openIdLocalId}"/></strong>
                                        <input type="hidden" id="username" name="username"
                                               value="<c:out value="${sessionScope.openIdLocalId}" />"/>
                                    </c:when>
                                    <c:otherwise>
                                        <spring:message code="screen.welcome.label.netid.accesskey"
                                                        var="userNameAccessKey"/>
                                        <%--<form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="off" htmlEscape="true" />--%>
                                        <form:input cssClass="required form-control" cssErrorClass="error" id="username"
                                                    size="25" tabindex="1" accesskey="${userNameAccessKey}"
                                                    path="username" autocomplete="off" htmlEscape="true"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">

                        <div class="col-md-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <form:password cssClass="required form-control" cssErrorClass="error" id="password"
                                               size="25" tabindex="2" path="password" accesskey="${passwordAccessKey}"
                                               htmlEscape="true" autocomplete="off"/>
                                <span id="capslock-on" style="display:none;"><p><img src="images/warning.png"
                                                                                     valign="top"> <spring:message
                                        code="screen.capslock.on"/></p></span>
                                    <%--<input name="email" placeholder="Password" class="form-control" type="text">--%>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="hidden" name="lt" value="${loginTicket}"/>
                            <input type="hidden" name="execution" value="${flowExecutionKey}"/>
                            <input type="hidden" name="_eventId" value="submit"/>

                            <input class="btn-reset btn btn-md btn-default pull-right" name="reset" accesskey="c"
                                   value="<spring:message code="screen.welcome.button.clear" />" tabindex="7"
                                   type="reset"/>
                            <input class="btn-submit btn btn-md btn-success pull-right" name="submit" accesskey="l"
                                   value="<spring:message code="screen.welcome.button.login" />" tabindex="6"
                                   type="submit"/>
                                <%--<button type="submit" class="btn btn-md btn-danger pull-right">Login</button>--%>
                        </div>
                    </div>

                </fieldset>
            </form:form>
            <%--</form>--%>
        </div>
    </div>
</div>
</body>
</html>
