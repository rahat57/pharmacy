package com.tpl.hca.service;

import com.tpl.hca.Util.EncrypterUtil;
import com.tpl.hca.dao.UserDao;
import com.tpl.hca.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public int addUser(User user) {
        user.setPassword(EncrypterUtil.
                getEncryptedPassword(user.getPassword()));
        user.setIsEnable(true);
        return userDao.addUser(user);
    }

    @Override
    public User getUser(User user) {
        return userDao.getUser(user);
    }
}
