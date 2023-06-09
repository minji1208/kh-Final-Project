<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link type="text/css" rel="stylesheet" href="/resources/include/css/detailView.css" />

		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("상품 상세 정보");
				
				$("#payment_btn").click(function(){
					$("#f_data").attr({
						"method":"get",
						"action":"/safe/productOrder"
					});
					$("#f_data").submit();
				});
				
				$("#unablePayment_btn").click(function(){
					alert("본인이 등록한 상품은 결제할 수 없습니다.");
				});
				
				$("#soldOutBtn").click(function(){
					alert("판매완료된 상품입니다.");
				});
				
			});
		</script>
	</head>
	<body>
		<div class="container">
			<form name="f_data" id="f_data">
				<input type="hidden" name="sp_no" value="${ detail.sp_no }" />
			</form>

			
			<%-- ================= 상세 정보 보여주기 시작 ================= --%>
            <div class="location">
                <span class="location_right">
                    <a href="/safe/productList" class="list_btn">
                        <span class="list_icon"></span>
                        목록으로 가기
                    </a>
                </span>
            </div>
            <div class="detail_wrap">
                <div class="item_info">
                    <div class="left_area">
                        <h3 class="sp_title">${ detail.sp_title }</h3>
                        <div class="sp_price_area">
                            <p class="price">판매가

                                <span class="sp_price">
                                	<fmt:formatNumber value="${detail.sp_price}" groupingUsed="true"/>
                                </span>
                                원
                            </p>
                        </div>
                        <p class="detail_info">
                            ${ detail.sp_created_at }
                            <span class="dv">l</span>
                            판매자 ${ detail.u_id }
                        </p>
                        <p class="detail_info">
                            택배배송
                            <span class="dv">l</span>
                            택배비(판매자부담)
                        </p>
                    </div>
                    <div class="right_area">
	                    <c:choose>
							<c:when test="${ memberLogin.u_no eq detail.u_no }">
								<button type="button" id="unablePayment_btn" class="unablePayment_btn">결제하기</button>
							</c:when>
							<c:when test="${ detail.sp_status eq '판매완료' }">
								<button type="button" id="soldOutBtn" class="unablePayment_btn">판매완료</button>
							</c:when>
							<c:otherwise>
								<button type="button" id="payment_btn" class="payment_btn">결제하기</button>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>
                <div class="item_img_wrap">
                    <span class="item_img"></span>
                </div>
                <div class="item_detail">
                    <span>
                        <p>${ detail.sp_content }</p>
                    </span>
                </div>
                <div class="caution_info_wrap">
                    <p class="detail_info">
                        <span class="list_img"></span>
                        오마이베이비에 등록된 상품의 정보는 판매자가 등록한 것이므로, 상품문의는 판매자에게 해주시기 바랍니다.
                    </p>
                    <p class="detail_info">
                        <span class="list_img"></span>
                        거래로 인해 알게 된 개인정보는 거래 진행 시에만 사용해야 하며, 그 외의 용도로 사용 시에는 관련 법에 따라 조치될 수 있습니다.
                    </p>
                </div>
            
			</div>
			<%-- ================= 상세 정보 보여주기 끝 ================= --%>
		</div>
	</body>
</html>