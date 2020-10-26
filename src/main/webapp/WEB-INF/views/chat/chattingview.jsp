<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="javascript/dialog/zebra_dialog.src.js"></script>
<link rel="stylesheet" href="css/dialog/zebra_dialog.css" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


</head>
<body>
	<h1>Chatting Page (id: ${userid})</h1>
	<div>
		<input type="button" id="chattinglistbtn" value="채팅 참여자 리스트">
	</div>
	
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"/>
	<div class="well" id="chatdata">
   		<!-- User Session Info Hidden -->
   		<input type="hidden" value='${userid}' id="sessionuserid">
   	</div>
	<div id="messageArea"></div>
</body>
<script>
// jQuery import 바로아래에 넣어 주면 됩니다.
// Cannot read property 'msie' of undefined 에러 나올때
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>
<script type="text/javascript">
	$(function(){
		$("#chattinglistbtn").click(function(){
			var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>채팅방 참여자 리스트</p>',{
				title: 'Chatting List',
				type: 'confirmation',
				print: false,
				width: 260,
				buttons: ['닫기'],
				onClose: function(caption){
					if(caption == '닫기'){
						//alert('yes click');
					}
				}
			});
	    });
	});
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	let sock = new SockJS("http://127.0.0.1:8080/jejusari/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		/* $("#messageArea").append(data + "<br/>"); */

		var sessionid = null;
		var message = null;
		
		//문자열을 splite//
		var strArray = data.split('|');
		
		for(var i=0; i<strArray.length; i++){
			console.log('str['+i+']: ' + strArray[i]);
		}
		
		//current session id//
		var currentuser_session = $('#messageArea').val();
		console.log('current session id: ' + currentuser_session);
		
		sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
		message = strArray[1]; //현재 메세지를 저장//
		
		//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
		if(sessionid == currentuser_session){
			var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-info'>";
			printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
			printHTML += "</div>";
			printHTML += "</div>";
			
			$("#chatdata").append(printHTML);
		} else{
			var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-warning'>";
			printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
			printHTML += "</div>";
			printHTML += "</div>";
			
			$("#chatdata").append(printHTML);
		}
		
		console.log('chatting data: ' + data);
		
	  	/* sock.close(); */
	}
	
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
	}
	
</script>
</html>