package com.travel.dao;

import java.util.List;

import com.travel.bean.Product;

public interface FileDao {
	/**
	 * 查询所有的图片
	 * @return
	 */
	List<Product> list(Product product);
	
	/**
	 * 上传一张图片
	 * @param product
	 * @return
	 */
	Integer save(Product product);



}
