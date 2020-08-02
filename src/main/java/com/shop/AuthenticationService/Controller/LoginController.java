package com.shop.AuthenticationService.Controller;

import com.shop.AuthenticationService.Config.JWT.JwtUtils;
import com.shop.AuthenticationService.DTO.AuthRequest;
import com.shop.AuthenticationService.DTO.AuthResponse;
import com.shop.AuthenticationService.Model.Client;
import com.shop.AuthenticationService.Service.ClientService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api/authentication")
public class LoginController {
    private final static Logger logger = LoggerFactory.getLogger(LoginController.class);

    private AuthenticationManager authManager;
    private JwtUtils jwtUtils;
    private ClientService clientService;

    @Autowired
    public LoginController(AuthenticationManager authManager, JwtUtils jwtUtils, ClientService clientService) {
        this.authManager = authManager;
        this.jwtUtils = jwtUtils;
        this.clientService = clientService;
    }

    @PostMapping
    public ResponseEntity<AuthResponse> login(@RequestBody AuthRequest authRequest) {
        logger.info("Login method called");

        String username = authRequest.getUsername();
        String password = authRequest.getPassword();

        try {
            authManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        } catch (BadCredentialsException ex) {
            logger.warn("Bad credentials");
            logger.error(ex.toString());
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Bad credentials", ex);
        }

        Client client = clientService.findByLogin(username);
        String token = jwtUtils.createToken(username, client.getRoles());
        AuthResponse authResponse = new AuthResponse(token);

        return new ResponseEntity<>(authResponse, HttpStatus.OK);
    }
}
