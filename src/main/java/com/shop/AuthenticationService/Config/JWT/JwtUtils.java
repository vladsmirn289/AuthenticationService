package com.shop.AuthenticationService.Config.JWT;

import com.shop.AuthenticationService.Model.Role;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Component
public class JwtUtils {
    private final static Logger logger = LoggerFactory.getLogger(JwtUtils.class);

    @Value("${jwt.secret}")
    private String secret;

    @Value("${jwt.sessionTime}")
    private long sessionTimeInSeconds;

    public String createToken(String username, Set<Role> roles) {
        logger.info("Creating token");

        Claims claims = Jwts.claims().setSubject(username);
        claims.put("roles", getRoleNames(roles));

        Date now = Date
                .from(LocalDateTime
                        .now()
                        .atZone(ZoneId
                                .systemDefault())
                        .toInstant());
        Date validTime = Date
                .from(LocalDateTime
                        .now()
                        .plusSeconds(sessionTimeInSeconds)
                        .atZone(ZoneId.systemDefault())
                        .toInstant());

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(now)
                .setExpiration(validTime)
                .signWith(SignatureAlgorithm.HS256, secret)
                .compact();
    }

    private List<String> getRoleNames(Set<Role> roles) {
        logger.info("GetRoleNames method called");

        return roles.stream()
                .map(Role::name)
                .collect(Collectors.toList());
    }
}
