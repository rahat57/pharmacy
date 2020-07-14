package com.drugs.pharmacy;/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author Rahat
 */
@SpringBootApplication(scanBasePackages = {"com.*"})

public class Application {
     @Autowired
    ApplicationContext context;

    public static void main(String[] args) {
       
        SpringApplication.run(Application.class, args);
       
    }
}
