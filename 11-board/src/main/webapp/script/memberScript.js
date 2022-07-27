function checkWrite() {
   // form 객체 구하기
   var frm = document.frm;
   
   if(!frm.name.value) {
      alert("이름을 입력하세요.");
      frm.name.focus();
   } else if(!frm.id.value) {
      alert("아이디를 입력하세요.");
      frm.id.focus();
   } else if(!frm.pwd.value) {
      alert("비밀번호를 입력하세요.");
      frm.pwd.focus();
   } else if(frm.pwd.value != frm.repwd.value) {
      alert("비밀번호가 맞지 않습니다.");
      frm.repwd.focus();
   } else {
      frm.submit();
   }
}

function checkLogin() {
   var frm = document.loginForm;
   
   if(!frm.id.value) {
      alert("아이디를 입력하세요.");
      frm.id.focus();   
   } else if(!frm.pwd.value) {
      alert("비밀번호를 입력하세요.");
      frm.pwd.focus();
   } else {
      frm.submit();
   }
}

function checkId() {
	var sId = document.frm.id.value;
	
	// 입력 검사
	if(sId == "") {
		alert("먼저 아이디를 입력하세요.");
		document.frm.id.focus();
	} else {
		window.open("checkId.jsp?id=" + sId, "", "width=450 height=150 left=500 top=200");
	}
}

function checkModify() {
   // form 객체 얻어오기	
   var frm = document.modifyForm;
   
   if(!frm.name.value) {
      alert("이름을 입력하세요.");
      frm.name.focus();
   } else if(!frm.pwd.value) {
      alert("비밀번호를 입력하세요.");
      frm.pwd.focus();
   } else if(frm.pwd.value != frm.repwd.value) {
      alert("비밀번호가 맞지 않습니다.");
      frm.repwd.focus();
   } else {
      frm.submit();
   }
}






