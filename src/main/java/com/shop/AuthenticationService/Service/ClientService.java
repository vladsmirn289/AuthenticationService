package com.shop.AuthenticationService.Service;

import com.shop.AuthenticationService.Model.Client;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface ClientService extends UserDetailsService {
    Client findByLogin(String login);
}
