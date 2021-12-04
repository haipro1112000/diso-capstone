package com.capstone.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Configuration
public class CloudinaryConfig {
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		 CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		 resolver.setDefaultEncoding("UTF-8");
		 resolver.setMaxUploadSize(10000000);
		 return resolver;
	}
	
	@Bean
	public Cloudinary couCloudinary() {
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", "nguyenhai",
				"api_key", "967682256154461",
				"api_secret", "MAyjn9EfbRqU6zqf3qyIC0fvpkQ",
				"secure", true));
		return cloudinary;
	}
	
	
}
