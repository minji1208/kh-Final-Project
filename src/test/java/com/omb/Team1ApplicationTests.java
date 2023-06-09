package com.omb;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.omb.user.orderInfo.dao.OrderInfoDAO;
import com.omb.user.payment.dao.PaymentDAO;
import com.omb.user.safeProduct.dao.SafeProductDAO;
import com.omb.user.safeProduct.vo.SafeProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class Team1ApplicationTests {

	@Test
	void contextLoads() {
	}
	
	@Setter(onMethod_ = @Autowired)
	private SafeProductDAO safeProductDAO;
	
	@Setter(onMethod_ = @Autowired)
	private PaymentDAO paymentDAO;
	
	@Setter(onMethod_ = @Autowired)
	private OrderInfoDAO orderInfoDAO;
	
	/* 
	@Test
	public void testSelectSafeProductList() {
		log.info("testSelectSafeProductList 메서드 실행");
		
		List<SafeProductVO> list = safeProductDAO.selectSafeProductList();
		log.info("list 출력 : " + list);
		
		for(SafeProductVO spvo : list) {
			log.info("리스트 조회 : " + spvo);
		}
	}
	*/
	
	/* 
	@Test
	public void testSelectSafeProductPrice() {
		log.info("testSelectSafeProductPrice 메서드 실행");
		
		SafeProductVO safevo = new SafeProductVO();
		safevo.setSp_no(1);
		
		int price = 0;
		
		price = safeProductDAO.selectSafeProductPrice(safevo);
		
		log.info("price : " + price);


	@Setter(onMethod_ = @Autowired)
	private MemberAddressDAO memberAddressDAO;
	
	@Setter(onMethod_ = @Autowired)
	private OrderInfoDAO orderInfoDAO;
	
	@Setter(onMethod_ = @Autowired)
	private AdmDepositInfoDAO admDepositInfoDAO;

	
	/* 
	@Test
	public void testSelectSafeProductList() {
		log.info("testSelectSafeProductList 메서드 실행");
		
		List<SafeProductVO> list = safeProductDAO.selectSafeProductList();
		log.info("list 출력 : " + list);
		
		for(SafeProductVO spvo : list) {
			log.info("리스트 조회 : " + spvo);
		}
	}
	*/
	
	/* 
	@Test
	public void testSelectSafeProductPrice() {
		log.info("testSelectSafeProductPrice 메서드 실행");
		
		SafeProductVO safevo = new SafeProductVO();
		safevo.setSp_no(1);
		
		int price = 0;
		
		price = safeProductDAO.selectSafeProductPrice(safevo);
		
		log.info("price : " + price);
	} */
	
	
	/* 
	@Test
	public void testInsertPaymentInfo() {
		
		PaymentVO pvo = new PaymentVO();
		
		pvo.setU_no(1);
		pvo.setSp_no(1);
		pvo.setPay_id("imp_123123123123");
		pvo.setPrice(100);
		
		log.info("pvo : " + pvo);
		
		int result = 0;
		result = paymentDAO.insertPaymentInfo(pvo);
		
		log.info("result : " + result);
	} */
	
	
	/* 
	@Test
	public void testMemberAddressInfo() {
		
		log.info("testMemberAddressInfo 메서드 호출");
		
		MemberVO mvo = new MemberVO();
		
		mvo.setU_no(1);
		
		log.info("mvo : " + mvo);		
		
		MemberAddressVO memberAddressVO = null;
		
		memberAddressVO =  memberAddressDAO.memberAddressInfo(mvo);
		
		log.info("memberAddressVO : " + memberAddressVO);
	} */
	
	
	/* 안심상품 판매상태 수정 쿼리문 테스트
	@Test
	public void testUpdateSafeProductStatus() {
		
		log.info("testUpdateSafeProductStatus 메서드 호출");
		
		SafeProductVO safevo = new SafeProductVO();
		safevo.setSp_no(1);
		
		int result = 0;
		
		result = safeProductDAO.updateSafeProductStatus(safevo);
		
		log.info("출력된 행의 수 : " + result);
		
	} */
	
	
	/* 주문내역 추가 쿼리문 테스트
	@Test
	public void testInsertOrderInfo() {
		
		OrderInfoVO ovo = new OrderInfoVO();
		
		ovo.setO_id("12341234-12341234");
		ovo.setPay_no(5);
		ovo.setU_no(1);
		ovo.setSp_no(1);
		ovo.setReceiver("김한솔");
		ovo.setReceiver_tel("010-1234-1234");
		ovo.setO_address("(12345)경기 광명");
		
		int result = 0;
		result = orderInfoDAO.insertOrderInfo(ovo);
		
		log.info("입력된 행의 수 :  " + result);
		
	} */
	
	
	/* 주문내역 추가에 필요한 결제번호 조회 쿼리문 테스트 
	@Test
	public void testSelectPaymentNo() {
		PaymentVO pvo = new PaymentVO();
		
		pvo.setPay_id("imp_123123123123");
		
		PaymentVO pvoNo = paymentDAO.selectPaymentNo(pvo);
		
		log.info("조회된 결제 번호 : " + pvoNo);
		
	} */
	
	
	/* 배송지 추가 쿼리문 테스트
	@Test
	public void testInsertMemberAddress() {
		
		MemberAddressVO addvo = new MemberAddressVO();
		
		addvo.setU_no(1);
		addvo.setZip("12345");
		addvo.setAddress("서울시 구로구");
		addvo.setSub_address("123");
		
		int result = memberAddressDAO.insertMemberAddress(addvo);
		
		log.info("입력된 행의 수 : " + result);
	} */
	
	
	/* 판매완료 목록 조회 테스트
	@Test
	public void testSellOrderInfoList() {
		MemberVO mvo = new MemberVO();
		
		mvo.setU_no(1);
		
		List<OrderInfoVO> sellList = orderInfoDAO.sellOrderInfoList(mvo);
		
		for(OrderInfoVO ovo : sellList) {
			log.info("리스트 조회 : " + ovo);
		}
		
	} */
	
	
	/* 주문번호로 결제id 가져오기
	@Test
	public void testSelectPaymentId() {
		OrderInfoVO ovo = new OrderInfoVO();
		
		ovo.setO_no(1);
		
		PaymentVO pvo = orderInfoDAO.selectPaymentId(ovo);
		
		log.info("pvo : " + pvo);
	} */
	
	
	/* 주문상태 변경
	@Test
	public void testUpdateOrderStatus() {
		OrderInfoVO ovo = new OrderInfoVO();
		
		ovo.setO_no(1);
		
		int result = orderInfoDAO.updateOrderStatusCancel(ovo);
		
		log.info("출력된 행의 수 : " + result);
		
		
	} */
	
	/* 입금정보 추가
	@Test
	public void testInsertDeposit() {
		OrderInfoVO ovo = new OrderInfoVO();
		
		ovo.setO_no(1);
		ovo.setSp_price(100);
		
		int result = admDepositInfoDAO.insertDepositInfo(ovo);
		
		log.info("출력된 행의 수 : " + result);

	} */

	
	/* 결제정보 추가
	@Test
	public void testInsertPaymentInfo() {
		
		PaymentVO pvo = new PaymentVO();
		
		pvo.setU_no(1);
		pvo.setSp_no(1);
		pvo.setPay_id("imp_123123123123");
		pvo.setPrice(100);
		
		log.info("pvo : " + pvo);
		
		int result = 0;
		result = paymentDAO.insertPaymentInfo(pvo);
		
		log.info("result : " + result);
	} */
	
	/* 안심상품 등록 테스트
	@Test
	public void testInsertSafeProduct() {
		
		SafeProductVO svo = new SafeProductVO();
		
		svo.setU_no(1);
		svo.setP_no(1);
		svo.setSp_title("테스트 제목");
		svo.setSp_name("아기옷");
		svo.setSp_content("테스트 내용");
		svo.setSp_pwd("1234");
		
		log.info("svo : " + svo);
		
		int result = 0;
		
		result = safeProductDAO.insertSafeProduct(svo);
		
		log.info("입력된 행의 수 : " + result);
	} */
	
	/* 안심상품 수정 테스트
	@Test
	public void testUpdateSafeProduct() {
		
		SafeProductVO svo = new SafeProductVO();
		
		svo.setSp_no(8);
		svo.setSp_title("테스트 제목");
		svo.setSp_price(1000);
		svo.setSp_content("테스트 내용");
		svo.setSp_pwd("1234");
		
		log.info("svo : " + svo);
		
		int result = 0;
		
		result = safeProductDAO.updateSafeProduct(svo);
		
		log.info("입력된 행의 수 : " + result);
	} */
	
	/* 
	@Test
	public void testUpdateComplete() {
		OrderInfoVO ovo = new OrderInfoVO();
		
		ovo.setO_no(15);
		int result = 0;
		result = orderInfoDAO.updateCompleteSafe(ovo);
		
		log.info("출력된 행의 수 : " + result);
		
	} */
	
	@Test
	public void testSafeProductListCnt() {
		
		SafeProductVO spvo = new SafeProductVO();
		
		int total = safeProductDAO.safeProductListCnt(spvo);
		
		log.info("전체 레코드 수 : " + total);
	}
	
}
