$(function(){
	$("form").validate({
	  rules: {
	    idial : {
	      required: true,
	      minlength: 8,
		  remote : "process/checkID.jsp"			
	    },   
	    password: {
	      required: true,
	      minlength: 8
	    },
	    cpassword: {
	      required: true,
	      minlength: 8,
	      equalTo: password
	    }
	  },
		nickname:{
			required:true,
			minlength:2
		},
		to: {
		  required: true,
		  email:true
			    },
		messages:{
			idial : {
				required:"필수 항목입니다",
				minlength:"8~20자리",
				remote:"존재하는 아이디 입니다"
			},
			password : {
				required:"필수 항목입니다",
				minlength:"8~20자리",
			},
			cpassword:{
				equalTo="일치하지 않습니다"
			},
			nickname:{
				required:"필수 항목입니다",
				minlength:"8~20자리"
			}
		}
	});	
})