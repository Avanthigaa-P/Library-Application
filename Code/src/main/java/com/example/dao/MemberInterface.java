package com.example.dao;

import com.example.model.Member;

public interface MemberInterface {
    Member getUser(String username, String password, String role);
}
