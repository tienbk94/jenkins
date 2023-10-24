package com.example.jenkins;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class JenkinsApplication {

	@Value("${app-name}")
	private String appName;

	public static void main(String[] args) {
		SpringApplication.run(JenkinsApplication.class, args);
	}

	@GetMapping("/app-name")
	public String getAppName() {
		return appName;
	}
}
