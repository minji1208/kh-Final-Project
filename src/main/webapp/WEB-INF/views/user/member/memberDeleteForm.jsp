<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/delete.css" />
	<link type="text/css" rel="stylesheet" href="/resources/include/css/signUp.css" />
    <script type="text/javascript">
      $(function(){
    	  $(".content_wrap .page-header h1").html("회원 탈퇴");
          $("#btn").click(function(){
              var result = confirm("탈퇴 하시겠습니까?");
              if(result)
              {
                  $("#u_status").attr('value','N');
                  $("#memberDelete").attr({
                      "method" :"post",
                      "action" : "/member/memberDelete"
                  })
                  $("#memberDelete").submit();
                  alert("회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
              }
          })
          $("#btn1").click(function(){
              location.href="/member/mypage";
          })
      })
    </script>
   </head>
   <body>
	    <form id="memberDelete">
	        <input type="hidden" name="u_no" value="${memberLogin.u_no }" />
	        <input type="hidden" id="u_status" name="u_status" value="${memberLogin.u_status }" />
	        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin: 150px;border: 1px solid #baac9a;width: 700px;margin-top: 40px;">
	            <div id="container" style="margin-left: -285px;">
	                <div class="join_wrap">
	                    <div id="join_container">
	                        <div class="join_header">
	                            <h1 style="font-size: 30px;">회원탈퇴</h1>                  
	                        </div>
	                        <div id="complet2" class="join_content individual">
	                            <h1 style="margin-bottom: 30px; font-size: 30px">OhMyBaby를 탈퇴하신다니 아쉬워요.</h1>
	                            <p> 
	                                <em style="color: #0b83e6"> * 탈퇴하시려는 이유를 작성해 주세요. 더 나은 서비스를 위해 개선하겠습니다.</em>
	                            </p>
	                            <div class="form tm_required">
	                                <ul>
	                                    <li>
	                                        <input type="checkbox" id="agree" name="agree" class="chk agree">
	                                        <label for="agree">[편의성] 웹사이트 또는 앱 이용하는데 불편해서</label>
	                                    </li>
	                                    <li>
	                                        <input type="checkbox" id="agree2" name="agree" class="chk agree">
	                                        <label for="agree2">[결제] 결제과정이 불편하거나 복잡해서</label>
	                                    </li>
	                                    <li>
	                                        <input type="checkbox" id="agree3" name="agree" class="chk agree">
	                                        <label for="agree3">[고객센터] 불편사항에 대한 처리 응대가 마음에 안들어서</label>
	                                    </li>
	                                    <li>
	                                        <input type="checkbox" id="agree4" name="agree" class="chk agree">
	                                        <label for="agree4">[상품] 내가 찾는 상품이 없거나 가격이 비싸서</label>                            
	                                    </li>
	                                    <li>
	                                        <input type="checkbox" id="agree5" name="agree5" class="chk agree">
	                                        <label for="agree5">기타 </label>      
	                                    </li>
	                                    <li>
	                                        <textarea id="result" placeholder="기타 사유를 입력해주세요" style="outline: none;"></textarea>
	                                    </li>      
	                                </ul>
	                            </div>
	                        </div>
	                        <p class="txt"><em style="color: #0b83e6">＊그동안 OhMyBaby를 이용해주셔서 감사합니다. *</em></p>
	                        <div class="btn_zone agree">
                                <button type="button" id="btn" class="btn_Atype btn_a" style="border-radius: 4px; width: 200px; margin-right:30px outline: none;"><span>회원탈퇴</span></button>
                                <button type="button" id="btn1" class="btn_Atype btn_a" style="border-radius: 4px; width: 200px; margin-right: 150px; outline: none;"><span>이전</span></button>
                            </div>
	                    </div>
	                </div> 
	            </div>
	        </div>
	    </form>
   </body>
</html>