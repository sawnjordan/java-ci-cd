package com.example.task_demo;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
@RestController
public class WelCome {
    @RequestMapping("/welcome")
    public String hello() {
        return "WelCome to Java CI/CD. My name is Sanjog Gomden.";
    }
}
