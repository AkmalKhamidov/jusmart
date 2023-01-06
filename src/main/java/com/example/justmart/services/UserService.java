package com.example.justmart.services;

import com.example.justmart.model.User;
import com.example.justmart.model.enums.Role;
import com.example.justmart.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

     private final PasswordEncoder passwordEncoder;
     private final UserRepository userRepository;
     public boolean createUser(User user){
         String userEmail = user.getEmail();
         if (userRepository.findByEmail(userEmail) != null) return false;
         user.setActive(true);
         user.getRoles().add(Role.ROLE_USER);
         user.setPassword(passwordEncoder.encode(user.getPassword()));
         log.info("Saving new User with email: {}", userEmail);
         userRepository.save(user);
         return true;
     }

     public List<User> list(){
         return userRepository.findAll();
     }


    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    public void banUser(Long id) {
         User user = userRepository.findById(id).orElse(null);
         if(user != null){
             if(user.isActive()){
                 user.setActive(false);
                 log.info("Ban user with ID = {}; email = {}", user.getId(), user.getEmail());
             } else {
                 user.setActive(true);
                 log.info("Unban user with ID = {}; email = {}", user.getId(), user.getEmail());
             }
         }
         userRepository.save(user);
    }

    public void changeUserEmail(User user, String email){
         user.setEmail(email);
         userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for(String key: form.keySet()){
            if(roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}
