package com.spring.studentmanagement.exceptions;


import lombok.extern.slf4j.Slf4j;

import java.io.Serial;

@Slf4j
public class UserNotFoundExceptions extends Exception {

    @Serial
    private static final long serialVersionUID = 1L;

    public UserNotFoundExceptions(String message) {
        super(message);
        log.error(message);

    }
}
