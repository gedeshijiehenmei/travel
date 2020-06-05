package com.travel.service;

import java.util.List;

import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.travel.bean.Product;

public interface ProductService {
	/**
	 * 查询所有的图片
	 * @return
	 */
	List<Product> list(Product product);
	
	/**
	 * 上传一张图片
	 * @param file 
	 * @param product
	 * @param map 
	 * @return
	 */
	String save(MultipartFile file, Product product, ModelMap map);
}
