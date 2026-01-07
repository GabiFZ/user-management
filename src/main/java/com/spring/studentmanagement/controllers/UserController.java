package com.spring.studentmanagement.controllers;


import com.spring.studentmanagement.exceptions.UserNotFoundExceptions;
import com.spring.studentmanagement.models.AppUser;
import com.spring.studentmanagement.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(path = "/users")
@RequiredArgsConstructor
public class UserController {


      private final UserService userService;

    @GetMapping()
    public String getUserView(Model model) {
        final List<AppUser> users = this.userService.findAllUsers();
        model.addAttribute("userList", users);
        return "users";
    }

    @GetMapping(path = "/{userId}")
    public String getUserProfile(@PathVariable(name = "userId", required = false) Long userId, Model model)  {
        try{
            AppUser user = this.userService.getUserById(userId);
            model.addAttribute("user", user);
            return "user";
        }catch(UserNotFoundExceptions e){
            return "redirect:/error";
        }

    }

    @DeleteMapping
    public String deleteUserById(@RequestParam(name = "userId") Long userId) {
        this.userService.deleteUserById(userId);
        return "redirect:/users";
    }

}
