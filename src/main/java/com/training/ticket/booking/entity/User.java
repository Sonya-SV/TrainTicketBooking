package com.training.ticket.booking.entity;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString

@Entity
@Table(name = "users",
        uniqueConstraints = {@UniqueConstraint(columnNames = {"username"})})
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

//TODO add validation

    @Column(name = "username", nullable = false)
//    @NotBlank(message = "Username cannot be empty")
    private String username;

    @Column(name = "first_name", nullable = false)
//    @NotBlank(message = "First name cannot be empty")
    private String firstName;

    @Column(name = "last_name", nullable = false)
//    @NotBlank(message = "Last name cannot be empty")
    private String lastName;

    @Column(name = "password", nullable = false)
//    @NotBlank(message = "Password cannot be empty")
    private String password;

    @Transient
//    @NotBlank(message = "Password cannot be empty")
    private String password2;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    @Column(name = "balance", columnDefinition="Decimal(10,2) default '0.00'")
    private BigDecimal balance;

    @OneToMany( mappedBy = "passenger",  cascade = CascadeType.MERGE, fetch = FetchType.LAZY, orphanRemoval = true)
    private Set<Ticket> tickets;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
