package com.spring.studentmanagement.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
//@NoArgsConstructor
@RequiredArgsConstructor
@Builder
@Table(name = "app_user", schema = "public")
@Entity(name = "AppUser")
public class AppUser {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_app_user")
    @SequenceGenerator(name = "seq_app_user", allocationSize = 1 )
    private long userId;

    @ManyToOne(targetEntity = Role.class, cascade = {CascadeType.PERSIST, CascadeType.MERGE}, fetch = FetchType.EAGER)
    @JoinColumn(name = "fk_role", nullable = false)
    private Role role;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "fk_address", nullable = true, unique = true)
    private Address address;

    @Column(name = "firstname", length = 65, nullable = false)
    private String firstName;

    @Column(name = "lastname", length = 65, nullable = false)
    private String lastName;

    @Column(name = "username", length = 45,  nullable = false, unique = true)
    private String username;

    @Column(name = "password", length = 100, nullable = false)
    private String password;

    @Column(name = "email", length = 65, nullable = false, unique = true)
    private String email;

    @Column(name = "is_enabled", nullable = false, columnDefinition = "boolean DEFAULT true")
    private Boolean isEnabled;

    private LocalDateTime dateAdded;

}
