<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="${root}/css/member/member_signup.css">
<script type="text/javascript" src="${root }/javascript/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
    $("input:radio[name=member_level]").click(function(){  	 
        if($("input[name=member_level]:checked").val() == "BR"){
 			$("#if_broker").show();
        } else {
        	$("#if_broker").hide();
        }
    });
    
    $("#idCheck").click(function(){
		var data = $("input[name=member_id]").val();
	    console.log(data);
    	$.ajax({
			url: "${root}/member/idcheck",
			data: {
				"member_id" : data
			},
			type: "POST",
			success: function(resp) {
				console.log(resp);
				if (resp == 0) {
					alert("아이디를 사용하실 수 있습니다.");
				} else if (resp > 0) {
					alert("아이디를 사용하실 수 없습니다.");
				}
			},
			error: function(resp) {
				console.log(resp);
			}
		});
    });
});

function validate(forms) {
    var idReg = /^[a-zA-Z0-9]{5,19}$/;
    var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&~`])[A-Za-z\d$@$!%*#?&~`]{8,12}$/;
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var numReg = /^[0-9]+$/;
	
    var id = forms.member_id.value;
	var pw = forms.member_pwd.value;
	var email = forms.member_email.value;
	var num2 = forms.num2.value;
	var num3 = forms.num3.value;
	
    if(!idReg.test(id)) {
		alert("아이디는 6~20자의 영문 대소문자와 숫자로만 입력");
		forms.member_id.focus();
		return false;
    }

    if(!pwReg.test(pw)) {
		alert("비밀번호는 숫자,문자,특수문자를 1회 이상 포함하여 8~12자 사이로 입력");
		forms.member_pwd.focus();
		return false;
    }

    if(pw != forms.member_pwd_chk.value) {
		alert("비밀번호가 다릅니다. 다시 확인");
		forms.member_pwd_chk.focus();
		return false;
    }

    if(forms.member_name.value == "") {
		alert("이름을 입력해 주세요");
		forms.member_name.focus();
		return false;
    }

    if(!emailReg.test(email)) {
		alert("적합하지 않은 이메일 형식입니다.");
		forms.member_email.focus();
		return false;
    }

    if(forms.member_level.value == "") {
		alert("가입 유형을 선택해 주세요");
		return false;
    }

    if(forms.member_level.value == "BR") {
		if(forms.num2.value == "" || forms.num3.value == "") {
			alert("핸드폰 번호를 입력해 주세요");
			if(forms.num2.value == "") {
				forms.num2.focus();
			} else if(forms.num3.value == "") {
				forms.num3.focus();
			}
			return false;
		}

		if(!numReg.test(num2) || !numReg.test(num3)) {
			alert("핸드폰 번호는 숫자만 입력해 주세요");
			forms.num2.focus();
			return false;
		}
    }
    
}
</script>
</head>
<body>
	<form id="plus_info" action="${root}/member/joinOk" method="post" onsubmit = "return validate(this)">
		<div class="tit">추가 정보 입력</div>
		<input type="hidden" name="member_kakao_id" value="${member_kakao_id}"/>
		<div class="nickname">
			<div class="label">아이디</div>
			<input type="text" name="member_id" class="col-sm-4 h-25 form-control" maxlength="15" 
				placeholder="6~20자 사이의 대소문자와 숫자만"/>
			<button class="btn btn-outline-warning btn-sm" type="button" id="idCheck" style="margin-top:2px;">중복 확인</button>
		</div>
		<div class="nickname">
			<div class="label">비밀번호</div>
			<input type="password" name="member_pwd" class="col-sm-4 h-25 form-control" maxlength="15" 
				placeholder="8~12자,영문자/숫자/특수문자 포함"/>
		</div>
		<div class="nickname">
			<div class="label">비밀번호 확인</div>
			<input type="password" name="member_pwd_chk" class="col-sm-4 h-25 form-control"/>
		</div>
		<div class="nickname">
			<div class="label">이름</div>
			<input type="text" name="member_name" class="col-sm-4 h-25 form-control" maxlength="15" value="${member_kakao_name}"/>
			
		</div>
		<div class="email">
			<div class="label">이메일</div>
			<input type="text" name="member_email" class="col-sm-5 h-25 form-control" autocomplete="off" value="${member_kakao_email}"
			placeholder="ex) abcd12@naver.com"/>
		</div>
		<div class="member_level">
			<div class="label">가입 유형</div>
			<input type="radio" name="member_level" value="GE"/>
			일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			<input type="radio" name="member_level" value="BR"/>
			중개업자
		</div>
		
		<div id="if_broker" style="display:none;">
			<div class="msg">국가공간정보포털의 부동산중개업 정보에 등록된<br/>대표 공인중개사만 회원가입이 가능합니다.</div>
			<div class="phone_num">
				<div class="label2">대표공인중개사<br/>휴대폰 번호</div>
				<select class="col-sm-2 h-25 custom-select" name="num1">
					<option selected>010</option>
					<option value="1">011</option>
					<option value="2">016</option>
				</select>
				<div style="color:black;">-</div>
				<input type="text" class="col-sm-2 h-25 form-control" name="num2">
				<div style="color:black;">-</div>
				<input type="text" class="col-sm-2 h-25 form-control" name="num3">
			</div>	
		</div>
		
		<div class="last_btn">
			<input type="submit" value="완료" class="btn btn-warning btn-sm"/>
			<input type="reset" value="취소" class="btn btn-light btn-sm"/>
		</div>
	</form>
</body>
</html>