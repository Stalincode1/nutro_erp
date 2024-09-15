package com.nutro.nutro_delivery.dto.response;

public class TokenModel {
    private String accessToken;
    private String tokenType = "Bearer";
    private long expiresIn;
    private String scope = "user";
    private String jti;

    // Constructors, getters, and setters

    public TokenModel(String accessToken, long expiresIn, String jti) {
        this.accessToken = accessToken;
        this.expiresIn = expiresIn;
        this.jti = jti;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getTokenType() {
        return tokenType;
    }

    public void setTokenType(String tokenType) {
        this.tokenType = tokenType;
    }

    public long getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(long expiresIn) {
        this.expiresIn = expiresIn;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getJti() {
        return jti;
    }

    public void setJti(String jti) {
        this.jti = jti;
    }

}
