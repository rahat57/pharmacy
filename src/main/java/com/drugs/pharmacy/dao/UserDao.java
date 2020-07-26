/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drugs.pharmacy.dao;

import com.drugs.pharmacy.model.User;

/**
 *
 * @author Rahat
 */

public interface UserDao {

    public int addUser(User user);
    public User getUser(User user);

}
