function checkWrite(){
	var fm = document.frm;

	if(!fm.imageId.value || fm.imageId.value=="img_"){
		alert("상품코드를 입력하세요.");
		fm.imageId.focus();
	} else if(!fm.imageName.value){
		alert("상품명을 입력하세요.");
		fm.imageName.focus();
	}else if(!fm.imagePrice.value){
		alert("단가를 입력하세요.");
		fm.imagePrice.value="";
		fm.imagePrice.focus();
	}else if(isNaN(fm.imagePrice.value)){
		alert("단가를 *숫자로 입력하세요.");
		fm.imagePrice.value="";
		fm.imagePrice.focus();
	}else if(!fm.imageQty.value){
		alert("수량을 입력하세요.(*숫자로 기재)");
		fm.imageQty.value="";
		fm.imageQty.focus();
	}else if(isNaN(fm.imageQty.value)){
		alert("수량을 *숫자로 입력하세요.");
		fm.imageQty.value="";
		fm.imageQty.focus();
	}else if(!fm.imageContent.value){
		alert("내용을 입력하세요.");
		fm.imageContent.focus();
	}else { 
		fm.submit();
	}
}