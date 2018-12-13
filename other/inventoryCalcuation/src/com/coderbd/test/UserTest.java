package com.coderbd.test;

import com.coderbd.domain.User;
import com.coderbd.service.UserService;
import java.util.Date;

/**
 *
 * @author User
 */
public class UserTest {

    public static void main(String[] args) {
        //UserService.createTable();
           User user = new User("mostafiz", "123", "user", "Mr.", "Mostafiz", "mostafiz@gmail.com", "01633321732", new Date(), true);
        UserService.insert(user);
         
       // User u = UserService.getUserbyUserName("admin", "123", true);
       // System.out.println(u);
    }
}
