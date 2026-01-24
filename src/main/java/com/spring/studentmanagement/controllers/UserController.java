package com.spring.studentmanagement.controllers;


import com.spring.studentmanagement.exceptions.UserNotFoundExceptions;
import com.spring.studentmanagement.models.AppUser;
import com.spring.studentmanagement.services.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(path = "/users")
@RequiredArgsConstructor
@Slf4j
public class UserController {


      private final UserService userService;
      private final HttpServletRequest request;

    @GetMapping()
    public String getUserView(Model model) {
        final List<AppUser> users = this.userService.findAllUsers();
        final HttpSession session = this.request.getSession();
        AppUser principal = (AppUser) session.getAttribute("userPrincipal");
        model.addAttribute("principal", principal);
        model.addAttribute("userList", users);
        return "users";
    }

    @GetMapping(path = "/{userId}")
    public String getUserProfile(@PathVariable(name = "userId", required = false) Long userId, Model model)  {
        log.info("principal =   {} ", request.getSession().getAttribute("userPrincipal"));
        try{
            AppUser user = this.userService.getUserById(userId);
            model.addAttribute("user", user);
            return "user";
        }catch(UserNotFoundExceptions e){
            return "redirect:/error";
        }

    }

    @PostMapping
    public String deleteUserById(@RequestParam(name = "userId") Long userId) {
        this.userService.deleteUserById(userId);
        return "redirect:/users";
    }


}
