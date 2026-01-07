package com.spring.studentmanagement.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "role", schema = "public")
@Entity(name = "Role")
@Cacheable
@Builder
public class Role {

    @Id
    @Column(name = "role_id")
    private long roleId;

    @Column(name = "role_name", length = 45, unique = true ,nullable = false)
    private String roleName;

}
