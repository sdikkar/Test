<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>Mr. Faulty Users Page</title>
  </head>
  <body>
		<%@include file="Header.jsp" %>
		
		<h4>All Users</h4>
		
		<c:if test="${!empty msg}">
	  		<c:out value="${msg}"/><br/><br/>
	  	</c:if>
		   
		  <c:if test="${!empty param.usertype}">
		  	<c:set var="logonid" value="${param.usertype}"/>
		  </c:if>
		  
		  <jsp:useBean id="userFault" class="mrfault.user.UserFaultBean">
				<jsp:setProperty name="userFault" property="logonid" value="${logonid}" />
		  </jsp:useBean>  
		  
		  <form method="post" action="/FaultSystem/jsps/AllUsers.jsp" id="usersForm" name="usersForm">
			  Select User Type:
			  <select id="usertype" name="usertype" onchange="formSubmit()">
			  	  <option value="adminuser" <c:if test="${'adminuser' eq logonid}">selected="selected"</c:if>>All</option>
				  <option value="Developer" <c:if test="${'Developer' eq logonid}">selected="selected"</c:if>>Developer</option>
				  <option value="Reporter" <c:if test="${'Reporter' eq logonid}">selected="selected"</c:if>>Reporter</option>
			  </select>	<br/>
		  </form>  
		  
		  <c:choose>
		  	<c:when test="${logonid eq 'adminuser'}">
		  		<c:set var="users" value="${userFault.allUsers}"/>
		  	</c:when>
		  	<c:otherwise>
		  		<c:set var="users" value="${userFault.usersByType}"/>
		  	</c:otherwise>
		  </c:choose>
		  
		   <table class="gridtable">
			  <tbody>
			    <!-- Results table headers -->
			    <tr>
			      <th><b>Logon Id</b></th>
			      <th><b>First Name</b></th>
			      <th><b>Last Name</b></th>
			      <th><b>Email</b></th>
			      <th><b>User Type</b></th>
			      <th><b>Delete Action</b></th>
			    </tr> 
				  <c:forEach items="${users}" var="eachUser" varStatus="status">
					<tr>
						<td><c:out value="${eachUser.logonid}"/></td> 
						<td><c:out value="${eachUser.firstname}"/></td>
						<td><c:out value="${eachUser.lastname}"/></<td>
						<td><c:out value="${eachUser.email}"/></td>
						<td><c:out value="${eachUser.usertype}"/></td>
						<td>
							<c:if test="${eachUser.logonid ne 'adminuser'}">
								<c:set var="formName" value="deleteuserForm_${status.count}"/>
								<form method="post" action="/FaultSystem/deleteuser.do" id="${formName}" name="${formName}">
									<a href="#" onclick="deleteUserFormSubmit('${formName}')"> Delete this user </a>
									<input type="hidden" id="logonid" name="logonid" value="${eachUser.logonid}"/>
								</form>
							</c:if>
						</td>
					</tr>
				  </c:forEach>
			   </tbody>
	      </table>
		  
		  <script type="text/javascript">
			  	function formSubmit()
				{
					document.getElementById("usersForm").submit();
				}
		  		
		  		function deleteUserFormSubmit(formName)
				{
					document.getElementById(formName).submit();
				}
		  </script>
		  
		  <%@include file="Footer.jsp" %>
		  
	</body>
</html>