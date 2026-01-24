package com.spring.studentmanagement;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
@AutoConfigureMockMvc
class StudentManagementApplicationTests implements StudentManagementTest {

    private final Environment environment;
    private final ApplicationContext context;
    @Autowired
    public StudentManagementApplicationTests(Environment environment, ApplicationContext context) {
        this.environment = environment;
        this.context = context;
    }

    @Test
    void contextLoads() {
        Assertions.assertNotNull(context, "Application context is not configured");
    }

}
