function checkWrite(){
	//form 객체 구하기
	var fm = document.frm;
	
	if(!fm.name.value){
		alert("이름을 입력하세요");
		fm.name.focus();
	}else if(!fm.id.value){
		alert("아이디를 입력하세요");
		fm.id.focus();
	}else if(!fm.pwd.value){
		alert("비밀번호를 입력하세요");
		fm.pwd.focus();
	}else if(fm.pwd.value != fm.repwd.value){
		alert("비밀번호가 맞지 않습니다.");
		fm.repwd.focus();
	}else { 
		fm.submit();
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

function checkId(){
	var sId = document.frm.id.value;
	
	//입력 체크
	if(sId ==""){
		alert("먼저 아이디를 입력하세요.")
	}else{
		window.open("checkId.jsp?id="+sId, "", "width=500 height =300 left=500 top=200")
	}

}