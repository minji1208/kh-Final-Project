<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link type="text/css" rel="stylesheet" href="/resources/include/css/insertView.css" />
		<link type="text/css" rel="stylesheet" href="/resources/include/css/order.css" />
		<script type="text/javascript" src="/resources/include/js/common.js" ></script>

		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("상품수정");
			
			/* 전화번호 자동 입력 */
			let u_phone1 = "${fn:substring(memberLogin.u_phone,0,3)}";
			let u_phone2 = "${fn:substring(memberLogin.u_phone,3,7)}";
			let u_phone3 = "${fn:substring(memberLogin.u_phone,7,11)}";
			$("#sp_phone1").val(u_phone1);
			$("#sp_phone2").val(u_phone2);
			$("#sp_phone3").val(u_phone3);
			
			
			/* 기본정보 입력창에 노출 */
			let sp_title = "${detail.sp_title}";
			let sp_name = "${detail.sp_name}";
			let sp_price = "${detail.sp_price}";
			let sp_content = "${detail.sp_content}";
			
			console.log("sp_title : " + sp_title);
			console.log("sp_name : " + sp_name);
			console.log("sp_price : " + sp_price);
			console.log("sp_content : " + sp_content);
			
			$("#sp_title").val(sp_title);
			$("#sp_name").val(sp_name);
			$("#sp_price").val(sp_price);
			$("#sp_content").val(sp_content);
			
			
			
			/* 가격입력창 숫자만 입력 */
			$('input[onlyNumber]').on('keyup', function () {
				
			    $(this).val($(this).val().replace(/[^0-9]/g, ""));
			    
			});
			
			
			/* 수정버튼 클릭 시 */
			$("#updateBtn").click(function(){
				let u_no = $("#u_id").parents("tr").attr("data-no");
				console.log("u_no = " + u_no);
				
				let sp_no = $("#sp_title").parents("td").attr("data-num");
				console.log("sp_no = " + sp_no);
				
				$("#u_no").val(u_no);
				$("#sp_no").val(sp_no);
				console.log("u_no : " + $("#u_no").val());
				console.log("sp_no : " + $("#sp_no").val());
				console.log("sp_title : " + $("#sp_title").val());
				console.log("sp_name : " + $("#sp_name").val());
				console.log("sp_price : " + $("#sp_price").val());
				console.log("sp_content : " + $("#sp_content").val());
				
				if($("input:radio[id='yes']").is(":checked")){
					if(!chkData("#sp_pwd", "비밀번호를")) return;
				}
				
				console.log("입력한 상품 가격 : " + $("#sp_price").val());
				
				// 입력값 체크
				if(!chkData("#sp_title", "제목을")) return;
				else if(!selectData("#sp_name", "상품을")) return;
				else if(!chkData("#sp_price", "가격을")) return;
				else if(!chkData("#sp_price", "가격을")) return;
				else if(!chkData("#sp_content", "내용을")) return;
				else {
					
					if($("#sp_price").val() < 1000){
						alert("상품 가격은 1000원보다 작을 수 없습니다.");
						return;
					}
					
					$("#updateForm").attr({
						"method":"post",
						"enctype":"multipart/form-data", // enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
						"action":"/safe/productUpdate"
					});
					$("#updateForm").submit();
				}
				
			});

		});
		</script>
	</head>
	<body>
	
		<c:if test="${!empty msg}">
			<script>
				alert("${msg}");
				<c:remove var="msg"/>
			</script>
		</c:if>
		<div class="container">
			
			<%-- ================= 입력 정보 보여주기 시작 ================= --%>
            <div class="info_wrapper">

	            <div class="list_item_info mt30">
	                <h3 class="info_title">판매자정보</h3>
	                <table class="order_user_info">
	                    <colgroup>
	                        <col style="width: 150px;">
	                        <col>
	                    </colgroup>
	                    <tbody>
	                        <tr data-no="${memberLogin.u_no}">
	                            <th>이름/아이디</th>
	                            <td id="u_id">${memberLogin.u_name}/${memberLogin.u_id}</td>
	                        </tr>
	                        <tr>
	                            <th>연락처</th>
	                            <td>
	                            	${fn:substring(memberLogin.u_phone,0,3)}-${fn:substring(memberLogin.u_phone,3,7)}-${fn:substring(memberLogin.u_phone,7,11)}
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>계좌번호</th>
	                            <td>
	                                신한은행 123123123123
	                                <a href="" class="accBtn ml15">입금계좌 등록/변경</a>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            
	            <div class="list_item_info mt30">
	                <h3 class="info_title">상품정보</h3>
	                <form id="updateForm">
	                	<input type="hidden" name="u_no" id="u_no" />
	                	<input type="hidden" name="sp_no" id="sp_no" />
	                    <table class="order_product_info">
	                        <colgroup>
	                            <col style="width: 150px;">
	                            <col>
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th>제목</th>
	                                <td data-num="${detail.sp_no}">
	                                    <input type="text" name="sp_title" id="sp_title" class="w400" maxlength="50" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>상품명</th>
	                                <td>
	                                    <input type="text" name="sp_name" id="sp_name" class="w400" maxlength="50" readonly="readonly"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>가격</th>
	                                <td>
	                                    <input type="text" onlyNumber name="sp_price" id="sp_price" class="w200 tr pr5" maxlength="8" /> 원
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>연락처</th>
	                                <td>
	                                    <input type="text" name="sp_phone1" id="sp_phone1" class="w50 tl pl2" maxlength="3" readonly="readonly" />
	                                    <input type="text" name="sp_phone2" id="sp_phone2" class="w50 tl pl2" maxlength="3" readonly="readonly" />
	                                    <input type="text" name="sp_phone3" id="sp_phone3" class="w50 tl pl2" maxlength="3" readonly="readonly" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>결제 비밀번호</th>
	                                <td class="pwdRadio">
	                                	<input type="radio" id="no" name="pwdCheck" checked>
	                                    <label for="no" class="mr10">비밀번호 사용안함</label>
	                                    <input type="radio" id="yes" name="pwdCheck">
	                                    <label for="yes" class="mr10">비밀번호 사용</label>
	                                	
	                                    <input type="password" name="sp_pwd" id="sp_pwd" class="w145 pl10" maxlength="15" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>상세정보</th>
	                                <td><textarea name="sp_content" id="sp_content" cols="60" class="w700" rows="20"></textarea></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </form>
	            </div>
	
	            <div class="payBtn_bg">
	                <button type="button" id="updateBtn" class="btn_blue">수정하기</button>
	            </div>
	        </div>
			<%-- ================= 입력 정보 보여주기 끝 ================= --%>
		</div>
	</body>
</html>