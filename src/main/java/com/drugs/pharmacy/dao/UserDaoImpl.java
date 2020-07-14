package com.tpl.hca.dao;

import com.tpl.hca.Util.ResourceNotFoundException;
import com.tpl.hca.model.User;
import com.tpl.hca.model.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DescriptiveResource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

@Repository
public class UserDaoImpl extends JdbcDaoSupport implements UserDao {
    @Autowired
    DataSource ds;

    @PostConstruct
    public void initialize() {
        setDataSource(ds);
    }


    @Override
    public int addUser(User user) {
        String sql = "INSERT INTO users (username,email,password,is_enable) values (?,?,?,?);";
        int noInsertedRows = getJdbcTemplate().update(sql, new Object[]{
                user.getUserName(),
                user.getEmail(),
                user.getPassword(),
                user.getIsEnable()
        });
        return noInsertedRows;
    }

    @Override
    public User getUser(User userEmail) {
        String sql = "select * from users where email = ? ;";
        User user = null;
       try {
           user = (User) getJdbcTemplate().queryForObject(sql, new Object[]{userEmail.getEmail()}, new UserRowMapper());
    } catch (DataAccessException e) {
           System.out.println("error "+e.getMessage());
    }
    if(user==null) {
            throw new ResourceNotFoundException(userEmail.getEmail(),
                    new DescriptiveResource("email"));
        }
        return user;
    }
}
