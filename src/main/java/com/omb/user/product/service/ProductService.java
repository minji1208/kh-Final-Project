package com.omb.user.product.service;

import java.util.List;

import com.omb.user.member.vo.MemberVO;
import com.omb.user.product.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> selectProductList(ProductVO pvo);
	
	public List<ProductVO> selectProductBuyList(MemberVO mvo);
	public List<ProductVO> selectProductSellList(MemberVO mvo);
	public List<ProductVO> selectProductLikeList(MemberVO mvo);
	public List<ProductVO> selectProductMyPageList(MemberVO mvo);
	public ProductVO selectProductDetail(int p_no);

	public int insertProduct(ProductVO pvo) throws Exception;
	
	public int insertProductLike(ProductVO pvo);

	public List<ProductVO> category(ProductVO pvo);
	
	public int productMyPageListCnt(ProductVO pvo);

	public int deleteProductLike(ProductVO pvo);

	public int productListCnt(ProductVO pvo);

	public int productCateListCnt(ProductVO pvo);

	public List<ProductVO> selectLocal(ProductVO pvo);

	public int productLcoalListCnt(ProductVO pvo);
	
	public void productStatus(ProductVO pvo);
	
	

	public List<ProductVO> myWrite(ProductVO pvo);

	public int WriteListCnt(ProductVO pvo);

	public ProductVO updateForm(ProductVO pvo);


	public int update(ProductVO pvo) throws Exception;

	public int delete(ProductVO pvo) throws Exception;

}
