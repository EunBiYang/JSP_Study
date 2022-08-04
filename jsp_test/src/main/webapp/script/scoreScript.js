function checkWrite(){
	
	var fm = document.frm;
	
	if(!fm.hak.value){
		alert("학번을 입력하세요");
		fm.hak.focus();
	}else if(!fm.name.value){
		alert("이름을 입력하세요");
		fm.name.focus();
	} else{
		fm.submit();
	}
}