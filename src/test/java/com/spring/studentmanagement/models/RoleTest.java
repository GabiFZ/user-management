package com.spring.studentmanagement.models;

import com.spring.studentmanagement.utils.EntityFactoryTestUtils;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class RoleTest {

    private Role roleTest;

    private Role roleTestTwo;

    @BeforeEach
    void setUp() {
    this.roleTest = Role.builder()
            .roleId(Long.MAX_VALUE)
            .roleName("ROLE_TEST")
            .build();

        this.roleTestTwo = EntityFactoryTestUtils.ROLE_VISITOR;
    }

    @AfterEach
    void tearDown() {

    }


    @Test
    void roleTestExample() {
        Assertions.assertNotEquals(roleTest, roleTestTwo);
    }
}
