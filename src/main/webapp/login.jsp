<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="login.title"/></title>
    <meta name="heading" content="<fmt:message key='login.heading'/>"/>
    <meta name="menu" content="Login"/>

    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/${appConfig["csstheme"]}/layout-1col.css'/>" />
    <script type="text/javascript">
        if (getCookie("username") != null) {
            $("j_username").value = getCookie("username");
            $("j_password").focus();
        } else {
            $("j_username").focus();
        }

        function saveUsername(theForm) {
            var expires = new Date();
            expires.setTime(expires.getTime() + 24 * 30 * 60 * 60 * 1000); // sets it for approx 30 days.
            setCookie("username",theForm.j_username.value,expires,"<c:url value="/"/>");
        }

        function validateForm(form) {
            return validateRequired(form);
        }

        function passwordHint() {
            if ($("j_username").value.length == 0) {
                alert("<fmt:message key="errors.required"><fmt:param><fmt:message key="label.username"/></fmt:param></fmt:message>");
                $("j_username").focus();
            } else {
                location.href="<c:url value="/passwordHint.html"/>?username=" + $("j_username").value;
            }
        }

        function required () {
            this.aa = new Array("j_username", "<fmt:message key="errors.required"><fmt:param><fmt:message key="label.username"/></fmt:param></fmt:message>", new Function ("varName", " return this[varName];"));
            this.ab = new Array("j_password", "<fmt:message key="errors.required"><fmt:param><fmt:message key="label.password"/></fmt:param></fmt:message>", new Function ("varName", " return this[varName];"));
        }
</script>
</head>
<body id="login"/>

<form method="post" id="loginForm" action="<c:url value='/j_security_check'/>"
    onsubmit="saveUsername(this);return validateForm(this)">
<fieldset style="padding-bottom: 0">
<ul>
<c:if test="${param.error != null}">
    <li class="error">
        <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
        <fmt:message key="errors.password.mismatch"/>
        <%--${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}--%>
    </li>
</c:if>
    <li>
       <label for="j_username" class="required desc">
            <fmt:message key="label.username"/> <span class="req">*</span>
        </label>
        <input type="text" class="text medium" name="j_username" id="j_username" tabindex="1" />
    </li>

    <li>
        <label for="j_password" class="required desc">
            <fmt:message key="label.password"/> <span class="req">*</span>
        </label>
        <input type="password" class="text medium" name="j_password" id="j_password" tabindex="2" />
    </li>

<c:if test="${appConfig['rememberMeEnabled']}">
    <li>
        <input type="checkbox" class="checkbox" name="_spring_security_remember_me" id="rememberMe" tabindex="3"/>
        <label for="rememberMe" class="choice"><fmt:message key="login.rememberMe"/></label>
    </li>
</c:if>
    <li>
        <input type="submit" class="button" name="login" value="<fmt:message key='button.login'/>" tabindex="4" />
    </li>
</ul>
</fieldset>
</form>

<%--<%@ include file="/scripts/login.js"%> --%>
