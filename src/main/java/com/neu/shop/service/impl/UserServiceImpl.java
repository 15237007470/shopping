package com.neu.shop.service.impl;

import com.neu.shop.dao.UserMapper;
import com.neu.shop.pojo.User;
import com.neu.shop.pojo.UserExample;
import com.neu.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private UserMapper userMapper;

    @Override
    public User selectByPrimaryKey(int userId) {
        return  userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public List<User> selectByExample(UserExample userExample) {
        return userMapper.selectByExample(userExample);
    }

    @Override
    public void insertSelective(User user) {
        userMapper.insertSelective(user);
    }

    @Override
    public void deleteUserById(Integer userid) {
        userMapper.deleteByPrimaryKey(userid);
    }

    @Override
    public void updateByPrimaryKeySelective(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<User> selectByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public void save(User user) {
        userMapper.save(user);
    }

    @Override
    public void save1(List<User> list) {
        userMapper.save1(list);
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }




   /* @Override
    public User selectByPrimaryKeyAndPassword(int userId,String password){return userMapper.selectByPrimaryKeyAndPassword();}*/
}
