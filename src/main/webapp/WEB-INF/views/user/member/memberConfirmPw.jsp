 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />	
		<title>Insert title here</title>
	
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		<link type="text/css" rel="stylesheet" href="/resources/include/css/comfirmPw.css" />
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){
			let getPwdChk = RegExp(/^(?=.*[A-Z]|[a-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/);
			let chk4 = false , chk5=false;
			$('#u_pwd').keyup(function(){
    			
    			if(getPwdChk.test($(this).val())){
    				//$('#pwdCheck').html('사용가능합니다.').css('color','green');
    				chk4= false;
    			}else{
    				$('#pwdCheck').html('8~16자의 영문 대소문자, 숫자, 특수문자를 입력해주세요').css('color','red');
    				chk4= false;
    			}
    			
    			if($(this).val() === ''){
    				$('#pwdCheck').html('');
    				chk4= false;
    			}
    			
    			 /* if($("#u_pwd").val()!==$("#u_rpwd").val() && $("#u_pwd").val()!==''){
    				 $('#pwdCheck').html('비밀번호 불일치');
    			 }else{
    				 $('#pwdCheck').html('비밀번호 일치');
    			 } */
    		})
    		
    		$('#u_rpwd').keyup(function(){
    			getPwdChk.test($(this));
    			
    			if($(this).val() === ''){
    				$('#pwdCheck').html('');
    				chk5= false;
    			}
    			
    			if($("#u_pwd").val()!==$("#u_rpwd").val() && $("#u_pwd").val()!==''){
   				 $('#pwdCheck').html('비밀번호 불일치').css('color','red');
   				chk5= false;
   			 }else{
   				 $('#pwdCheck').html('비밀번호 일치').css('color','green');
   		
   			 }
    		})
    		
    		
    		$("#btn").click(function(){
    			if(!chkData("#u_pwd","비밀번호를")) return;
    			else if(!chkData("#u_rpwd","비밀번호 확인을")) return;
    			else{
    			$.ajax({
 					url : "/member/pwdChk",
 					type : "post",
 					dataType : "json",
 					data : {"u_pwd" : $("#u_pwd").val() , "u_no" : $("#u_no").val()},
 					success : function(data){
 						if(data == 1){
 							chk4=true;
	     				
 						}else if(data == 0){
 							alert("입력하신 비밀번호를 확인해주세요");
 							chk4 =false;
 						}
 					}
 				})
    			}
 				if(chk4){
 					$("#PwdCheck").attr({
	     					"method" :"get",
	     					"action" : "/member/updateForm"
	     				})
	     				$("#PwdCheck").submit(); 
 				}
     		})
		})
		</script>
	</head>
	<body>
		<form id="PwdCheck" class="section section-login">
		<input type="hidden" name="u_no" id="u_no" value="${memberLogin.u_no }" />
		<input type="hidden" name="u_name" value="${memberLogin.u_name }" />
		<input type="hidden" name="u_id" id="u_id" value="${update.u_id }" />
            <div id="ux-container" class="page-confirm-password">
            <div class="header">
                <h1 class="title" style="text-align: center;">비밀번호 입력</h1>
                <p class="direction">
                    
                        ${memberLogin.u_name} ( <em style="color:#0b83e6;">${memberLogin.u_id}</em> ) 님,<br>
                                    
                    본인 확인을 위해 비밀번호를 입력해주세요.</p>
            </div>
            <div class="content">
                    <label class="field">
                        <span class="section-label">비밀번호</span>                        
                        <span class="role-holder holds-tbox"><input id="u_pwd" name="u_pwd" type="password" class="tbox" placeholder="비밀번호" title="비밀번호 입력" data-click-id="comm_web_confirmpw_ko_pw"></span>
                    </label>
                    <label class="field">
                        <span class="section-label">비밀번호확인</span>                        
                        <span class="role-holder holds-tbox"><input id="u_rpwd" name="u_rpwd" type="password" class="tbox" placeholder="비밀번호확인" title="비밀번호 입력" data-click-id="comm_web_confirmpw_ko_pw"></span>
                    </label>                    				
                    <div class="field btn-field">					
                        <input type="button" id="btn" class="btn btn-purple btn-wide" value="확인" data-click-id="comm_web_confirmpw_ko_confirm" style="background:#baac9a; color:#fff; cursor: pointer; text-align: center;">
                    </div>           		
            </div>
  </div>
   </form>	
	</body>
</html>