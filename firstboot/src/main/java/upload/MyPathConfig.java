package upload;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //xmnl 대신 자바파일
public class MyPathConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers (ResourceHandlerRegistry registry) {
	registry.addResourceHandler("806/upload/**").addResourceLocations("file:///c:/kdt/upload/");
	//‹resources mapping=" /upload/**" location="file:///c:/kdt/upload/" /› : file:/kdt/upload
	}

}
