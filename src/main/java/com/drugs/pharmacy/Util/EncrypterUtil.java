    package com.drugs.pharmacy.Util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncrypterUtil {
    public static String getEncryptedPassword(String simplePass) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPass = passwordEncoder.encode(simplePass);
        return hashedPass;
    }

    public static boolean getMatch(String jpa_pass, String db_pass) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.matches(jpa_pass, db_pass);

    }

}
