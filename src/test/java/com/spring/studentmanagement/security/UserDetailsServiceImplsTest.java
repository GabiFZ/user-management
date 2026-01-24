package com.spring.studentmanagement.security;

import com.spring.studentmanagement.exceptions.AuthenticationException;
import com.spring.studentmanagement.models.AppUser;
import com.spring.studentmanagement.repositories.UserRepository;
import com.spring.studentmanagement.utils.EntityFactoryTestUtils;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class UserDetailsServiceImplsTest {


    private @Mock UserRepository userRepository;
    private @InjectMocks UserDetailsServiceImpls userDetailsService;

    private  String usernameOrEmail ;

    @BeforeEach
    void setUp(){
        this.usernameOrEmail = "MockUsernameOrEmail";
    }

    @Test
    @Order(0)
    @DisplayName("Should return all users when findAllUsers is called")
    void loadByUsernameOrEmail() throws AuthenticationException {

      final AppUser expectedAppUser = EntityFactoryTestUtils.USER_TEST_ONE;
      final Optional<AppUser> optionalAppUser = Optional.of(expectedAppUser);

      when(this.userRepository.findByUsernameOrEmail(this.usernameOrEmail)).thenReturn(optionalAppUser);

      final AppUser actualUser =   this.userDetailsService.loadByUsernameOrEmail(this.usernameOrEmail);

      assertEquals(expectedAppUser, actualUser, "Users are not equal");

      assertNotNull(actualUser.getUsername() );
      assertNotNull(actualUser.getFirstName() );
      assertNotNull(actualUser.getLastName() );

    }

    @Test
    @Order(1)
    void loadByUsernameOrEmailThrowsAuthenticationExceptionTest()  {

            when(this.userRepository.findByUsernameOrEmail(this.usernameOrEmail)).thenReturn(Optional.empty());

            Exception exception   = assertThrows(Exception.class,
                    () -> this.userDetailsService.loadByUsernameOrEmail(this.usernameOrEmail)
           );

          assertTrue(exception instanceof AuthenticationException);
          AuthenticationException authenticationException;
          AtomicReference<AuthenticationException> authExceptionRef = new AtomicReference<>();
          assertDoesNotThrow(() -> {
                AuthenticationException authException = (AuthenticationException) exception;
                authExceptionRef.set(authException);
          });

          assertNotNull(authExceptionRef.get());
          AuthenticationException authException = authExceptionRef.get();

          assertEquals("Username not found", authException.getMessage());

    }

        @Disabled(value = "Test under construction")
        @Test
        void brokenExampleTest() {

                final AppUser actualUser =  this.userDetailsService.loadByUsernameOrEmail(this.usernameOrEmail);
                assertNotNull(actualUser);
        }

}