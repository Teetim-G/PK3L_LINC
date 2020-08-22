var winObject = null;
	function popupWindow(userid) {
		let popHeight = 400; // 팝업사이즈 높이
		let popWidth  = 350; // 파업사이즈 너비
	     
	    let winWidth  = document.body.clientWidth;  // 현재창의 너비
	    let winHeight = document.body.clientHeight; // 현재창의 높이

	    let winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
	    let winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표

	    let left = winX + (winWidth - popWidth) / 2;
	    let top = winY + (winHeight - popHeight) / 2;
		var settings = 'toolbar=0,directories=0,status=no,menubar=no,scrollbars=auto,height='+popHeight+',width='+popWidth+',left='+left+',top='+top;
		winObject = window.open("LINC_Adminblockuserpop.jsp", userid, settings);
}


	function popupWindow2() {
		let popHeight = 250; // 팝업사이즈 높이
		let popWidth  = 350; // 파업사이즈 너비
	     
	    let winWidth  = document.body.clientWidth;  // 현재창의 너비
	    let winHeight = document.body.clientHeight; // 현재창의 높이

	    let winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
	    let winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표

	    let left = winX + (winWidth - popWidth) / 2;
	    let top = winY + (winHeight - popHeight) / 2;

		var uid = document.form.mem_uid.value;
		var url = "LINC_UserBlockpop.jsp?uid=" + uid;
		var settings = 'toolbar=0,directories=0,status=no,menubar=no,scrollbars=auto,height='+popHeight+',width='+popWidth+',left='+left+',top='+top;
		winObject = window.open(url, "idcheck", settings);
		}
		
		
	function popupWindow3() {
		let popHeight = 10; // 팝업사이즈 높이
		let popWidth  = 200; // 파업사이즈 너비
	     
	    let winWidth  = document.body.clientWidth;  // 현재창의 너비
	    let winHeight = document.body.clientHeight; // 현재창의 높이

	    let winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
	    let winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표

	    let left = winX + (winWidth - popWidth) / 2;
	    let top = winY + (winHeight - popHeight) / 2;

		var uid = document.form.mem_uid.value;
		var url = "LINC_UpdateUserBlockEnd.jsp?uid=" + uid;
		var settings = 'toolbar=0,directories=0,status=no,menubar=no,location=no,scrollbars=auto,height='+popHeight+',width='+popWidth+',left='+left+',top='+top;
		winObject = window.open(url, "idcheck", settings);
		}
