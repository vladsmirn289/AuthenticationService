package com.shop.AuthenticationService.Service;

import com.shop.AuthenticationService.Model.Client;
import com.shop.AuthenticationService.Repository.ClientRepo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ClientServiceImpl implements ClientService {
    private final static Logger logger = LoggerFactory.getLogger(ClientServiceImpl.class);

    private ClientRepo clientRepo;

    @Autowired
    public void setClientRepo(ClientRepo clientRepo) {
        logger.debug("Setting clientRepo");
        this.clientRepo = clientRepo;
    }

    @Override
    @Transactional(readOnly = true)
    public Client findByLogin(String login) {
        logger.info("Find client by login - " + login);
        return clientRepo.findByLogin(login);
    }

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        logger.info("LoadingUserByUsername called");
        Client client = findByLogin(login);

        if (client == null) {
            throw new UsernameNotFoundException("User with login - " + login + " not found");
        }

        return client;
    }
}
