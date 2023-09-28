package com.example.model;

public class Staff extends Member {
    private String name;
    private String password;

    public Staff(String username, String password) {
        super(username, password, "staff");
        this.name = username;
        this.password = password;
    }
    public String getUsername() {
        return name;

    }

    public String getPassword() {
        return password;
    }


}