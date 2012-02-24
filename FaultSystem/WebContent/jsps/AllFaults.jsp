<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>Mr. Faulty Faults Page</title>
  </head>
  <body>
	<%@include file="Header.jsp" %>

		<h4>All Faults</h4>
		
		<c:if test="${!empty msg}">
	  		<c:out value="${msg}"/><br/><br/>
	  	</c:if>
		  
		  <c:if test="${!empty param.selectedUser}">
		  	<c:set var="logonid" value="${param.selectedUser}"/>
		  </c:if>
		    
		  <jsp:useBean id="userFault" class="mrfault.user.UserFaultBean">
				<jsp:setProperty name="userFault" property="logonid" value="${logonid}" />
		  </jsp:useBean>	
		  
		  <form method="post" action="/FaultSystem/jsps/AllFaults.jsp" id="usersfaultForm" name="usersfaultForm">
		  	  User Specific Faults: 
			  <select id="userId" name="userId" onchange="formSubmit()">
				  <c:forEach items="${userFault.allUsers}" var="eachUser">
				  	<c:choose>
				  		<c:when test="${eachUser.logonid eq 'adminuser'}">
				  			<option value="${eachUser.logonid}" <c:if test="${eachUser.logonid eq logonid}">selected="selected"</c:if>>All</option>
				  		</c:when>
				  		<c:otherwise>
				  			<option value="${eachUser.logonid}" <c:if test="${eachUser.logonid eq logonid}">selected="selected"</c:if>>${eachUser.logonid}</option>
				  		</c:otherwise>
				  	</c:choose>
				  </c:forEach>
			  </select> <br/>
			  <input type="hidden" id="selectedUser" name="selectedUser"/>
		  </form>
		  
		  <c:choose>
		  	<c:when test="${logonid eq 'adminuser'}">
		  		<c:set var="faults" value="${userFault.allFaults}"/>
		  	</c:when>
		  	<c:otherwise>
		  		<c:set var="faults" value="${userFault.allFaultsForUser}"/>
		  	</c:otherwise>
		  </c:choose>
		    
		  <table class="gridtable">
			  <tbody>
			    <!-- Results table headers -->
			    <tr>
			      <th><b>Fault Id</b></th>
			      <th><b>Short Description</b></th>
			      <th><b>Long Description</b></th>
			      <th><b>Reporter</b></th>
			      <th><b>Status</b></th>
			      <th><b>Priority</b></th>
			      <th><b>Delete Action</b></th>
			      <th><b>Update Action</b></th>
			    </tr> 
				  <c:forEach items="${faults}" var="eachFault" varStatus="status">
				  	<tr>
					  	<td><c:out value="${eachFault.faultid}"/></td>
					  	<td><c:out value="${eachFault.shortdescription}"/></td>
					  	<td><c:out value="${eachFault.longdescription}"/></td>
					  	<td><c:out value="${eachFault.reporter}"/></td>
					  	<td><c:out value="${eachFault.status}"/></td>
					  	<td><c:out value="${eachFault.priority}"/></td>
					  	<c:set var="formName" value="deletefaultForm_${status.count}"/>
					  	<td>
						  	<c:if test="${typeOfUser eq 'Admin'}">
						  		<form method="post" action="/FaultSystem/deletefault.do" id="${formName}" name="${formName}">
						  			<a href="#" onclick="deleteFaultFormSubmit('${formName}')">Delete this fault.</a>
						  			<input type="hidden" id="faultid" name="faultid" value="${eachFault.faultid}"/>
						  		</form>
						  	</c:if>
					  	</td>
					  	<td><a href="/FaultSystem/jsps/UpdateFault.jsp?faultId=${eachFault.faultid}">Update this fault</a></td>
					</tr>
				  </c:forEach>
				</tbody>
		   </table>
		  
		   <script type="text/javascript">
				function deleteFaultFormSubmit(formName)
				{
					document.getElementById(formName).submit();
				}
				
				function formSubmit()
				{
					document.getElementById("selectedUser").value = document.getElementById("userId").value;
					document.getElementById("usersfaultForm").submit();
				}
		  </script>
		  
		  <%@include file="Footer.jsp" %>
		  
	</body>
</html>