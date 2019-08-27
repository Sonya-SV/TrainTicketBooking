package com.training.ticket.booking.service;


import com.training.ticket.booking.entity.Role;
import com.training.ticket.booking.entity.User;
import com.training.ticket.booking.repository.UserRepository;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(@NonNull String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public void updateUserByAdmin(User user, String username, Map<String,String > form) throws DataIntegrityViolationException {

        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values()).map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for(String key : form.keySet()){
            if(roles.contains(key))
                user.getRoles().add(Role.valueOf(key));
        }
        try {
            userRepository.save(user);
        } catch (Exception ex) {
            log.info("{User is already exists}");
        }
    }

    public List<User> findAllUsers() {
        return userRepository.findAll();
    }

//TODO rewrite Optional!!!
    public void updateProfile(User user, String firstName, String lastName, String password){
        if(firstName!= null && !firstName.equals(user.getFirstName()))
            user.setFirstName(firstName);
        if(lastName!= null && !lastName.equals(user.getLastName()));
            user.setLastName(lastName);

        user.setPassword(passwordEncoder.encode(user.getPassword())); /// was password <- user.getPassword
        userRepository.save(user);
    }

    public void saveNewUser(User user) {
        user.setRoles(Collections.singleton(Role.USER));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        try {
            userRepository.save(user);
        } catch (Exception ex) {
            log.info("{User is already exists}");
            log.info(user.toString());
        }
    }

    public void updateAccount(User user, BigDecimal replenishmentAmount) {
        user.setBalance(user.getBalance().add(replenishmentAmount));
//        try {
            userRepository.save(user);
//        }catch (Exception e){
//            log.info("{can`t replenish the balance");
//        }
    }

}
