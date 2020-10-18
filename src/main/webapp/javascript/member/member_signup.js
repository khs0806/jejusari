/**
 * 
 */

$(function(){
    $("input:radio[name=member_level]").click(function(){  	 
        if($("input[name=member_level]:checked").val() == "BR"){
 			$("#if_broker").show();
        }else{
        	$("#if_broker").hide();
        }
    });
	
    $("#idCheck").click(function(){
		var data = $("input[name=member_id]").val();
	    console.log(data);
    	$.ajax({
			url: "idcheck",
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
})

function validate(forms) {
    var idReg = /^[a-zA-Z0-9]{5,19}$/;
    var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var birthReg = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	var numReg = /^[0-9]+$/;
	
    var id = forms.member_id.value;
	var pw = forms.member_pwd.value;
	var email = forms.member_email.value;
	var birthday = forms.member_birthday.value;
	var num2 = forms.num2.value;
	var num3 = forms.num3.value;
	
    if(!idReg.test(id)) {
		alert("아이디는 6~20자의 영문 대소문자와 숫자로만 입력");
		forms.member_id.focus();
		return false;
    }

    /*if(!pwReg.test(pw)) {
		alert("비밀번호는 숫자,문자,특수문자를 1회 이상 포함하여 8~12자 사이로 입력");
		forms.member_pwd.focus();
		return false;
    }*/

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

    if(!birthReg.test(birthday)) {
		alert("적합하지 않은 생년월일 형식입니다.");
		forms.member_birthday.focus();
		return false;
    }

    if(!emailReg.test(email)) {
		alert("적합하지 않은 이메일 형식입니다.");
		forms.member_email.focus();
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