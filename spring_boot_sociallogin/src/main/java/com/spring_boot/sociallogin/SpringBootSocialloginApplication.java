package com.spring_boot.sociallogin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackageClasses = MainController.class)
public class SpringBootSocialloginApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootSocialloginApplication.class, args);
	}
 
}
 