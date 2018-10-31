<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>

<form onsubmit="return go()">
	id : <input type="text" name="id"><br>
	pwd : <input type="password" name="pwd"><br>
	pwdchk : <input type="password" name="pwdChk"><br>
	age : <input type="number" name="age"><br>
	email : <input type="email" name="email"><br>
	
	<button>읭긯</button>
</form>



<script>
function go(){
	var v = document.querySelectorAll('input');
	var val = {};
	
	v.forEach((e) => {
		val[e.name] = e.value;
	});
	
	if(val['id'].trim().length < 5){
		alert('아이디는 5글자 이상이야');
		return false;
	}
	
	if(val['pwd'].trim().length < 8){
		alert('비번은 8글자 이상이야');
		return false;
	}
	
	if(val['pwdChk'].trim() !== val['pwd'].trim()){
		alert('비번이 서로 안맞자너;');
		return false;
	}
	
	if(val['age'].trim().length == 0){
		alert('나이를 적어야지');
		return false;
	}
	
	if(val['age'] < 0 || val['age'] > 130){
		alert('나이는 0살부터 130까지만 가능해');
		return false;
	}
	
	if(val['email'].indexOf('@') == -1 || val['email'].indexOf('.') == -1){
		alert('이메일 형식이 아닌것가튼대;');
		return false
	}
	
	return true;
}

</script>



</body>
</html>