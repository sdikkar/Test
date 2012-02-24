<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
  <head>
    <title>Mr. Faulty Logon Page</title>
  </head>
  <body>
  
  <h1>MR FAULTY.</h1>
  
  <h4>Please Logon On :</h4>  
  
  <c:if test="${!empty msg}">
  	<c:out value="${msg}"/><br/><br/>
  </c:if>
  
  <form method="post" action="/FaultSystem/logon.do" id="logonForm" name="logonForm">
  	<label>Logon Id :</label>
  	<input type="text" name="logonId"  maxlength="50" id="logonId" value=""/><br/><br/>
  	<label>Password :</label>
  	<input type="password" name="password" maxlength="50" id="password" value=""/><br><br>
  	<input type="button" onclick="formSubmit()" value="Log On" />
  </form>
  
  <script type="text/javascript">
		function formSubmit()
		{
			document.getElementById("logonForm").submit();
		}
  </script>
  
  <%@include file="Footer.jsp" %>

  </body>
</html>