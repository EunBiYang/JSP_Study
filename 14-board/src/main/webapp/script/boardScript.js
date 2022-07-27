
function checkWrite(){
	var fm = document.fm;

	if(!fm.subject.value){
		alert("제목을 입력하세요");
		fm.subject.focus();
	}else if(!fm.content.value){
		alert("내용를 입력하세요");
		fm.content.focus();
	}else { 
		fm.submit();
	}
}

function reset1(){
	var fm = document.fm;
	
	fm.subject.value = "";
	fm.content.value = "";
}