package com.spring.studentmanagement.services;

import com.spring.studentmanagement.exceptions.UserNotFoundExceptions;
import com.spring.studentmanagement.models.AppUser;

import java.util.List;

public interface UserService {

    List<AppUser> findAllUsers();
    void deleteUserById(Long userId);
    AppUser getUserById(Long userId) throws UserNotFoundExceptions;
    //AppUser saveUser(AppUser user);
    //AppUser findByUsername(String username);



}
