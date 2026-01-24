package com.spring.studentmanagement.services;

import com.spring.studentmanagement.models.AppUser;
import com.spring.studentmanagement.repositories.UserRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

import static com.spring.studentmanagement.utils.EntityFactoryTestUtils.getUserEntityList;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class UserServiceImplTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserServiceImpl userService;

    @Test
    @DisplayName("Should return all users when findAllUsers is called")
    void findAllUsersReturnAllUsers() {

        List<AppUser> expectedUsers = getUserEntityList();

        when(userRepository.findAll()).thenReturn(expectedUsers);

        List<AppUser> actualUsers = userService.findAllUsers();

        assertEquals(expectedUsers, actualUsers, "The returned users should match");
        verify(userRepository, times(1)).findAll();



    }


}
