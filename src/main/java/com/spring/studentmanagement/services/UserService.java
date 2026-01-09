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

    // Security
  AppUser saveUser(AppUser user); // save the new user (sign-up)
   // AppUser findByUsernameOrEmail(String usernameOrEmail); // used by  login

}
