<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>

<form enctype="multipart/form-data">
	ID : <input type="text" name="id"><br>
	PWD : <input type="text" name="pwd"><br>
	<button type="button" onclick="go()">읭긯</button>
</form>

<script>


function go(){
var form = document.querySelector('form');
var formData = new FormData(form);
	
	var params = {};
formData.forEach((e,k) =>{
	params[k] = e;
});

 $.ajax({
	url:'/ict1-erp2/userlogin',
	type:'post',
	data: {id:'111',pwd:'asd'},
	contentType: "application/json",
	dataType:'json',
	success:  function(res){
		 alert(res);
	 }
	
}); 
 

 
 
}


</script>

</body>
</html>