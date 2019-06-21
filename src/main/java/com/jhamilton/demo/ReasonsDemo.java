package com.jhamilton.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

// Program entry point
@SpringBootApplication
public class ReasonsDemo extends SpringBootServletInitializer {
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ReasonsDemo.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(ReasonsDemo.class, args);
	}

}
