<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>

<form action="#" onsubmit="return go()">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pwd"><br>
비번확인 : <input type="password" name="pwdChk"><br>
나이 : <input type="number" name="age"><br>
이메일 : <input type="email" name="email"><br>

<button>읭긯</button>
</form>

<script>

function go(){
	var id = document.querySelector('input[name=id]');
	var pwd = document.querySelector('input[name=pwd]');
	var pwdChk = document.querySelector('input[name=pwdChk]');
	var age = document.querySelector('input[name=age]');
	var email = document.querySelector('input[name=email]');
	
	if(id.value.trim().length < 5){
		alert('응 아이디 5글자 이상이야');
		id.value='';
		id.focus();
		return false;
	}
	if(pwd.value.trim().length < 8){
		alert('비번은 8글자 이상으로해줘');
		pwd.value='';
		pwd.focus();
		return false;
	}
	if(pwdChk.value.trim() !== pwd.value.trim()){
		alert('비번이 서로 맞지않아');
		pwdChk.value='';
		pwdChk.focus();
		return false;
	}
	
	if(age.value.trim().length == 0){
		alert('나이를 입력해야지');
		age.focus();
		return false;
	}
	
	if(age.value < 0 || age.value > 130){
		alert('나이는 0살 부터 130 살 까지만 가능해');
		age.value='';
		age.focus();
		return false;
	}
	
	if(email.value.indexOf('@') == -1 || email.value.indexOf('.') == -1){
		alert('이메일 형식이 맞지않아');
		email.value='';
		email.focus();
		return false;
	}
	
	
	alert('굳')
	return true;
    
}


</script>

</body>
</html>