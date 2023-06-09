<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageSub.css" />
<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageService.css" />
<script src="/resources/include/js/common.js"></script>
   <script>
   
   $(function(){
	  $(".content_wrap .page-header h1").html("문의 내역");
	  let msg = "<c:if test='${empty memberLogin}'>회원만 이용할 수 있습니다.</c:if>";
		let word="<c:out value='${serviceCenterVO.keyword}' />";
		let value="";
		if(word!= ""){
			$("#keyword").val("<c:out value='${serviceCenterVO.keyword}' />");
			$("#search").val("<c:out value='${serviceCenterVO.search}' />");
			
			if($("#search").val()!='sc_content'){
				if($("#search").val()=='sc_title') value="#list tr td";
				else if($("#search").val()=='u_name') value="#list tr td";
				console.log($(value+":contains('"+word+"')").html());
				$(value+":contains('"+word+"')").each(function(){
					let regex = new RegExp(word,'gi');
					$(this).html($(this).html().replace(regex,"<span>"+word+"</span>"));
				});
			}
		}
		
		$("#keyword").bind("keydown", function(event){
			if(event.keyCode == 13){
				event.preventDefault();
			}
		});
		
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if($("search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		$("#searchData").click(function(){
			if($("#search").val()!='all'){
				if(!chkData("#keyword", "검색어를")) return;
			}
			$("#pageNum").val(1);
			goPage();
		});
		
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		});
		
		$(".goDetail").click(function(){
			let sc_no = $(this).parents("tr").attr("data-no");
			$("#sc_no").val(sc_no);
			if(msg!=""){
				alert("로그인을 진행해주세요.");
			} else{				
				$("#detailForm").attr({
					"method":"get",
					"action":"/serviceCenter/servicePwdConfirm"
				});
				$("#detailForm").submit();
			}
		});
		
		$(".replyDetail").click(function(){
			let as_no = $(this).parents("tr").attr("data-num");
			$("#as_no").val(as_no);
			
			$("#replyDetailForm").attr({
				"method":"get",
				"action":"/admin/servicePwdConfirm"
			});
			$("#replyDetailForm").submit();
		});
		
		
		$("#writeBtn").click(function(){
			if(msg!=""){
				alert("로그인을 진행해주세요.");
			} else{
				location.href="/serviceCenter/writeForm"
			}
		});
		
	});
	
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method":"get",
			"action":"/member/myPageServiceList"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin:0;">
<div class="contentContainer container">

	<form id="detailForm">
		<input type="hidden" id="sc_no" name="sc_no">
	</form>
	<form id="replyDetailForm">
		<input type="hidden" id="as_no" name="as_no" />
	</form>
	
	<div id="serviceSearch" class="text-right">
		<form id="f_search" name="f_search" class="form-inline">
			<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }">
			<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }">
			<div class="form-group">
				<label>검색조건</label>
				<select id="search" name="search" class="form-control">
					<option value="all">전체</option>
					<option value="sc_title">제목</option>
					<option value="u_name">작성자</option>
				</select>
				<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control">
				<button type='button' id="searchData" class="btn btn_success">검색</button>
			</div>
		</form>
	</div>
	<div id="serviceList" class="community_table mt30">
		<table summary="문의 리스트">
			<colgroup>
              <col style="width: 7%">
              <col>
              <col style="width: 13%">
              <col style="width: 13%">
              <col style="width: 7%">
          </colgroup>
			<thead>
				<tr class="text-center">
					<th data-value="sc_no" >NO</th>
					<th >TITLE</th>
					<th data-value="u_name" scope="col">NAME</th>
					<th data-value="sc_created_at" scope="col">DATE</th>
					<th data-value="sc_readcnt" scope="col">HITS</th>
				</tr>
			</thead>
			<tbody id="list">
				<c:choose>
					<c:when test="${not empty serviceMyPageList }">
						<c:forEach var="serviceMyPageList" items="${serviceMyPageList}" varStatus="status">
							<tr class="text-center" data-no='${serviceMyPageList.sc_no }'>
								<td>${serviceMyPageList.sc_no }</td>
								<td class="goDetail text-left" style="cursor:pointer;">${serviceMyPageList.sc_title }</td>
								<td class="text-center">${serviceMyPageList.u_name }</td>
								<td class="text-center">${serviceMyPageList.sc_created_at }</td>
								<td class="text-center">${serviceMyPageList.sc_readcnt }</td>
							</tr>
							<c:choose>
								<c:when test="${not empty admServiceList}">
									<c:forEach var="admservice" items="${admServiceList}" varStatus="status">
										<c:set var="as" value="${admservice.sc_no}" />
										<c:set var="sc" value="${serviceMyPageList.sc_no}" />
										<fmt:parseNumber var="asno" type="number" value="${as}"/>
										<fmt:parseNumber var="scno" type="number" value="${sc}"/>
										<c:if test="${asno eq scno }">
											<tr data-num='${admservice.as_no}'>
												<td class="text-center"></td>
												<td class="replyDetail text-left" style="cursor:pointer;">${admservice.as_title}</td>
												<td class="text-center">${admservice.a_name}</td>
												<td class="text-center">${admservice.as_created_at}</td>
												<td></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<td colspan="5" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	<div class="text-center">
	<div class="text-right">
		<input type="button" class="btn btn-default" value="WRITE" id="writeBtn">
	</div>
		<ul class="pagination">
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
			<c:if test="${pageMaker.prev }">
				<li class="paginate_button previous">
					<a href="${pageMaker.startPage -1 }">Previous</a>
				</li>
			</c:if>
			
			<!-- 바로가기 번호 출력 -->
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
					<a href='${num }'>${num }</a>
				</li>
			</c:forEach>
			
			<!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
			<c:if test="${pageMaker.next }">
				<li class="paginate_button next">
					<a href="${pageMaker.endPage+1 }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>
</div>
</body>
</html>