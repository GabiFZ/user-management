package com.spring.studentmanagement.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "address")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "address_seq")
    @SequenceGenerator(
            name = "address_seq",
            sequenceName = "seq_address",
            allocationSize = 1
    )
    private Long id;

    @Column(name = "country", length = 45, nullable = false)
    private String country;

    @Column(name = "city", length = 45, nullable = false)
    private String city;

    @Column(name = "door_number", length = 10, nullable = false)
    private String doorNumber;

    @Column(name = "additional_details", length = 65)
    private String additionalDetails;
}
