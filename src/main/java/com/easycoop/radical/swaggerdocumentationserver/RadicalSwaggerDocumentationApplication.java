package com.easycoop.radical.swaggerdocumentationserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
@EnableConfigurationProperties({SwaggerServicesConfig.class,SwaggerServicesConfig.SwaggerServices.class})
public class RadicalSwaggerDocumentationApplication {

	public static void main(String[] args) {
		SpringApplication.run(RadicalSwaggerDocumentationApplication.class, args);
	}
}
