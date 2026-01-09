package com.spring.studentmanagement.services;

import com.spring.studentmanagement.exceptions.UserNotFoundExceptions;
import com.spring.studentmanagement.models.AppUser;
import com.spring.studentmanagement.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;


    @Override
    public List<AppUser> findAllUsers() {
        return userRepository.findAll();
    }

//    @Override
//    public AppUser saveUser(AppUser user) {
//        return userRepository.save(user);
//    }

    @Override
    public AppUser getUserById(Long userId) throws UserNotFoundExceptions {
        final Optional<AppUser> userOptional = this.userRepository.findById(userId);
        log.info("Trying to getUserById with param: userId = {}", userId);
        return this.userRepository.findById(userId).orElseThrow(() -> new UserNotFoundExceptions("User not found!"));


//        if(userOptional.isPresent()){
//            return userOptional.get();
//        }else{
//            throw new IllegalArgumentException("User not found!");
//        }

        // return userRepository.findById(userId);
    }

//    @Override
//    public AppUser findByUsername(String username) {
//        return userRepository.findById()
//    }

    @Override
    public void deleteUserById(Long userId) {
        userRepository.deleteById(userId);



    }

    @Override
    public AppUser saveUser(AppUser user){
        user.setDateAdded(LocalDateTime.now());
        return userRepository.save(user);
    }
}
