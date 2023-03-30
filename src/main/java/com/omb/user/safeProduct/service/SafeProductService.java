package com.omb.user.safeProduct.service;

import java.util.List;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.vo.ProductVO;
import com.omb.user.safeProduct.vo.SafeProductVO;

public interface SafeProductService {
	
	public List<SafeProductVO> selectSafeProductList();
	
	public SafeProductVO selectSafeProductDetail(SafeProductVO spvo);
	
	public int selectSafeProductPrice(SafeProductVO spvo);	// DB 저장된 상품 금액 조회
	
	public int updateSafeProductStatus(SafeProductVO spvo);	// 결제 완료시 상품 판매상태 변경 (판매중 -> 판매완료)
	
	public List<ProductVO> selectProductList(MemberVO mvo);	// 상품목록 조회 메서드

}
