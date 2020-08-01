package com.shop.AuthenticationService.Repository;

import com.shop.AuthenticationService.Model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepo extends JpaRepository<Client, Long> {
    Client findByLogin(String login);
}
