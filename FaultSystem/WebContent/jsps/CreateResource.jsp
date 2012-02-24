<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>Mr. Faulty Create Resource Page</title>
  </head>
  <body>
	<%@include file="Header.jsp" %>

	<h4>Create Resource</h4>
	  <table class="gridtable">
		  <tbody>
		    <!-- Results table headers -->
		    <tr>
		      <th><b>Logon Id</b></th>
		      <th><b>Password</b></th>
		      <th><b>First Name</b></th>
		      <th><b>Last Name</b></th>
		      <th><b>Email</b></th>
		      <th><b>User Type</b></th>
		      <th><b>Action</b></th>
		    </tr> 
			  <form method="post" action="/FaultSystem/createresource.do" id="resourceForm" name="resourceForm">
			  	<tr>
			  	<td><label>Logon Id: </label>
			  	<input type="text" name="logonId"  maxlength="50" id="logonId" value=""/></td>
			  	
			  	<td><label>Password :</label>
			  	<input type="password" name="password" maxlength="50" id="password" value=""/></td>
			  	
			  	<td><label>First Name :</label>
			  	<input type="text" name="firstname" maxlength="50" id="firstname" value=""/></td>
			  	
			  	<td><label>Last Name :</label>
			  	<input type="text" name="lastname" maxlength="50" id="lastname" value=""/></td>
			  	
			  	<td><label>Email :</label>
			  	<input type="text" name="email" maxlength="50" id="email" value=""/></td>
			  	
			  	<%-- <label>User Type :</label>
			  	<input type="text" name="usertype" maxlength="50" id="usertype" value=""/>  --%>
			  	
			  	<td>
			  	<select id="usertype" name="usertype">
				  <option value="Developer">Developer</option>
				  <option value="Reporter">Reporter</option>
				</select>
				</td>
			  	
			  	
			  	<td><input type="button" onclick="formSubmit()" value="Create Resource" /></td>
			  	</tr>
			  </form>
		   </tbody>
		</table>
	  
	   <script type="text/javascript">
			function formSubmit()
			{
				document.getElementById("resourceForm").submit();
			}
	  </script>
	  
	  <%@include file="Footer.jsp" %>
	  
	</body>
</html>