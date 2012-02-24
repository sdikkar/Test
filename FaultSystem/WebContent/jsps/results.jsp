<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
  <head>
    <title>Mr. Faulty My results page</title>
  </head>
  <body>
   
  <%@include file="Header.jsp" %>
  
  <h4>My faults</h4>
  
  <c:if test="${!empty msg}">
  	<c:out value="${msg}"/><br/><br/>
  </c:if>

  <jsp:useBean id="userFault" class="mrfault.user.UserFaultBean">
		<jsp:setProperty name="userFault" property="logonid" value="${logonid}" />
  </jsp:useBean>
 
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
	      <th><b>Action</b></th>
	    </tr> 
		  <c:forEach items="${userFault.allFaultsForUser}" var="eachFault">
		  	<tr>
			  	<td><c:out value="${eachFault.faultid}"/></td>
			  	<td><c:out value="${eachFault.shortdescription}"/></td>
			  	<td><c:out value="${eachFault.longdescription}"/></td>
			  	<td><c:out value="${eachFault.reporter}"/></td>
			  	<td><c:out value="${eachFault.status}"/></td>
			  	<td><c:out value="${eachFault.priority}"/></td>
			  	<td><a href="/FaultSystem/jsps/UpdateFault.jsp?faultId=${eachFault.faultid}">Update this fault</a></td>
			</tr>
		  </c:forEach>
		</tbody>
	</table>
	
	<%@include file="Footer.jsp" %>
	
  </body>
</html>