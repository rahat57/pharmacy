/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drugs.pharmacy.service;

import com.drugs.pharmacy.model.User;

;

/**
 *
 * @author Rahat
 */

public interface UserService {

    public int addUser(User user);
    public User getUser(User user);

}
