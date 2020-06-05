package com.travel.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.travel.bean.Product;
import com.travel.dao.FileDao;
import com.travel.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	@Autowired
	private FileDao fileDao;

	public List<Product> list() {
		return fileDao.list(null);
	}

	public String save(MultipartFile file, Product product, ModelMap map) {
		
		// 保存图片的路径，图片上传成功后，将路径保存到数据库
		String filePath = "F:\\upload";
		// 获取原始图片的扩展名
		String originalFilename = file.getOriginalFilename();
		// 生成文件新的名字
		String newFileName = UUID.randomUUID() + originalFilename;
		// 封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		// 保存到数据库
		product.setPimage(newFileName);
		fileDao.save(product);
		return "redirect:/listImages";
	}

	public List<Product> list(Product product) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer save(Product product) {
		// TODO Auto-generated method stub
		return null;
	}
}
