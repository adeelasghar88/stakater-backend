package com.stakater.sample.test.resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author aasghar
 *
 */
@RestController
@CrossOrigin
public class HelloNameResource
{

	@GetMapping
	public String getHelloName() {
		final String prefix = "Hello ";
		String postfix = System.getenv().getOrDefault("NAME", "Stakater");

        if (postfix == null) {
        	postfix = "Adeel";
        }

        return prefix + postfix;
	}

}
