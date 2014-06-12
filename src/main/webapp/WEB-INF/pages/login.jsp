<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link href="<c:url value="/resources/libs/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js" />"> </script>
    <script type="text/javascript" src="<c:url value="/resources/libs/bootstrap/js/bootstrap.min.js" />"> </script>
    <title>Log in</title>
</head>
<body class="preview" id="top" data-spy="scroll">
<%--<jsp:include page="include/menu.jsp" />--%>
  <div class="container">
    <div class="row">
        <br>
        <br>
        <br>
      <div class="well span4 offset4">

        <h1>Log in</h1>
          <div id="login-error">${error}</div>

        <form action="j_spring_security_check" method="post">
          <table>
            <tr>
              <th>Username:&nbsp;&nbsp;&nbsp;</th>
              <td><input class="form-control" name="j_username" type="text" /></td>
            </tr>
              <tr>
                  <th>&nbsp;&nbsp;&nbsp;</th>
                  <td>&nbsp;&nbsp;&nbsp;</td>
              </tr>
            <tr>
              <th>Password:&nbsp;&nbsp;&nbsp;</th>
              <td><input class="form-control" name="j_password" type="password" /></td>
            </tr>
            <tr>
              <th />
                <br>
                <br>
                <br>
              <td><input class="btn  btn-default" type="submit" value="Log in" /></td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</body>
</html>