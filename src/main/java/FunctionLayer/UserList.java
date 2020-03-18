package FunctionLayer;

import DBAccess.CupcakeMapper;
import DBAccess.UserMapper;

import java.util.ArrayList;
import java.util.List;

public class UserList {

    private static List<User> userList;

    public static void initUserList() {
        if (userList == null) {
            userList = new ArrayList<>();
            try {
                userList = UserMapper.getUsers();
            } catch (LoginSampleException e) {
                e.getMessage();
            }
        }
    }

    public static List<User> getUserList() {
        return userList;
    }
}
