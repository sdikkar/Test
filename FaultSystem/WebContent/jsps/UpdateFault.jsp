<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Mr. Faulty Update Fault Page</title>
  </head>
  <body>
	<%@include file="Header.jsp" %>
	
	<h4>Update Fault # ${param.faultId}</h4>
	

		  <jsp:useBean id="userFault" class="mrfault.user.UserFaultBean">
				<jsp:setProperty name="userFault" property="logonid" value="${logonid}" />
				<jsp:setProperty name="userFault" property="faultid" value="${param.faultId}" />
		  </jsp:useBean>
		  
		  <table class="gridtable">
			  <tbody>
			    <!-- Results table headers -->
			    <tr>
			      <th><b>Assign To</b></th>
			      <th><b>Short Description</b></th>
			      <th><b>Long Description</b></th>
			      <th><b>Reporter <br/>(read only)</b></th>
			      <th><b>Priority</b></th>
			      <th><b>Status</b></th>
			      <th><b>Action</b></th>
			    </tr> 
		  
				  <c:forEach items="${userFault.faultByFaultId}" var="eachFault" varStatus="status">
				  	<tr>
					  <form method="post" action="/FaultSystem/updatefault.do" id="faultform_${status.count}" name="faultform_${status.count}">
					  	
					  	<input type="hidden" name="faultId" maxlength="50" id="faultId" value="${eachFault.faultid}"/>
					  	
					  	<td><label>Assign To: </label>
					  	
					  	<select id="logonId" name="logonId">
						  <c:forEach items="${userFault.allUsers}" var="eachUser">
						  	<option value="${eachUser.logonid}"  <c:if test="${eachFault.logonid eq eachUser.logonid}">selected="selected"</c:if>>${eachUser.logonid}</option>
						  </c:forEach>
						</select> </td>
					  	
					  	<td><label>Short Description :</label>
					  	<input type="text" name="shortdescription" maxlength="50" id="shortdescription" value="${eachFault.shortdescription}"/></td>
					  	
					  	<td><label>Long Description :</label>
					  	<input type="text" name="longdescription" maxlength="50" id="longdescription" value="${eachFault.longdescription}"/></td>
					  	
					  	<td><label>Reporter :</label>
					  	<input type="text" readonly="readonly" name="reporter" maxlength="50" id="reporter" value="${eachFault.reporter}"/></td>  	
					  	
					  	
					  	<td><label>Priority</label>
					  	<select id="priority" name="priority">
						  <option value="Blocker" <c:if test="${eachFault.priority eq 'Blocker'}">selected="selected"</c:if>>Blocker</option>
						  <option value="Critical" <c:if test="${eachFault.priority eq 'Critical'}">selected="selected"</c:if>>Critical</option>
						  <option value="Major" <c:if test="${eachFault.priority eq 'Major'}">selected="selected"</c:if>>Major</option>
						  <option value="Minor" <c:if test="${eachFault.priority eq 'Minor'}">selected="selected"</c:if>>Minor</option>
						  <option value="Trivial" <c:if test="${eachFault.priority eq 'Trivial'}">selected="selected"</c:if>>Trivial</option>
						</select></td>
					  	
					  	<td><label>Status</label>
					  	<select id="status" name="status">
						  <option value="Assigned" <c:if test="${eachFault.status eq 'Assigned'}">selected="selected"</c:if>>Assigned</option>
						  <option value="In Progress" <c:if test="${eachFault.status eq 'In Progress'}">selected="selected"</c:if>>In Progress</option>
						  <option value="Cannot Reproduce" <c:if test="${eachFault.status eq 'Cannot Reproduce'}">selected="selected"</c:if>>Cannot Reproduce</option>
						  <option value="In Test" <c:if test="${eachFault.status eq 'In Test'}">selected="selected"</c:if>>In Test</option>
						  <option value="Closed" <c:if test="${eachFault.status eq 'Closed'}">selected="selected"</c:if>>Closed</option>
						  <option value="Deferred" <c:if test="${eachFault.status eq 'Deferred'}">selected="selected"</c:if>>Deferred</option>
						  <option value="Test Fail" <c:if test="${eachFault.status eq 'Test Fail'}">selected="selected"</c:if>>Test Fail</option>
						  <option value="Duplicate" <c:if test="${eachFault.status eq 'Duplicate'}">selected="selected"</c:if>>Duplicate</option>
						</select></td>
					  	
					  	
					  	<c:set var="formName" value="faultform_${status.count}"/>
					  	<td><input type="button" onclick="formSubmit('${formName}')" value="Update Fault" /></td>
					  	<td><a href="/FaultSystem/jsps/results.jsp"><c:out value="Cancel"/></a></td>
					  </form>	
				  	</tr>
				  </c:forEach>
		  
		  
		  <script type="text/javascript">
				function formSubmit(formName)
				{
					document.getElementById(formName).submit();
				}
		  </script>
		
		<%@include file="Footer.jsp" %>
		  
	</body>
</html>