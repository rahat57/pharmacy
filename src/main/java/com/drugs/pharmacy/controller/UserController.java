/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drugs.pharmacy.controller;

import com.drugs.pharmacy.Util.ResourceNotFoundException;
import com.drugs.pharmacy.model.User;
import com.drugs.pharmacy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Rahat
 */
@RestController
@RequestMapping("/admin")
//@RequestScope
@CrossOrigin(origins = "http://localhost", allowedHeaders = {})
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public int addUser(@RequestBody User user) {

        return this.userService.addUser(user);

    }


    @RequestMapping(value = "/user/login", method = RequestMethod.GET)
    public User getUser() throws  IOException {
        Authentication authentication = SecurityContextHolder.getContext().
                getAuthentication();
        String username = authentication.getName();
        User user = new User();
        user.setEmail(username);

        return this.userService.getUser(user);
    }


    @RequestMapping(value = "/greetings", method = RequestMethod.GET)
    public String greetings() {

        return "Welcome";

    }

    @ExceptionHandler({ResourceNotFoundException.class})
    void handleResourceNotFoundRequests(HttpServletResponse response) throws
            IOException {
        response.sendError(HttpStatus.NOT_FOUND.value());

    }

}
