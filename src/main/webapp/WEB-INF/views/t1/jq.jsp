<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>

id : <input type="text" id="id"><br>
pwd : <input type="password" id="pwd"><br>

<button onclick="go()">읭긯</button>

<script>

	function go(){
		
		$.post({
			url : '/ict1-erp2/userlogin',
			data : {id:$('#id')[0].value,pwd:$('#pwd')[0].value},
			success : function(res){
				if(res == 1){
					alert('로그인 성공!');
				}else if(res == 0){
					alert('로그인 실패!');
				}
			},
			error : function(res){
				console.log(res);
			}
		});
		
	}

</script>

</body>
</html>