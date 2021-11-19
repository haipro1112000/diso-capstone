package com.capstone.config;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;

@Configuration
public class WebApplicationContextConfig {
	
//	@Override
//	public Validator getValidator() {
//		return validator();
//	}
//	@Bean
//	public LocalValidatorFactoryBean validator() {
//		LocalValidatorFactoryBean v = new LocalValidatorFactoryBean();
//		v.setValidationMessageSource(messageSource());
//		return v;
//	}
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
		source.setBasename("messages");
		return source;
	}

}
