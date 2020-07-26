package com.drugs.pharmacy.model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet rs, int i) throws SQLException {

        User user = new User();
        user.setUserId(rs.getInt("user_id"));
        user.setUserName(rs.getString("username"));
        user.setEmail(rs.getString("email"));
        user.setIsEnable(rs.getBoolean("is_enable"));
        user.setTimeStamp(rs.getTimestamp("time_stamp"));

        return user;
    }
}
