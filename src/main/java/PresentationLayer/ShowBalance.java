package PresentationLayer;

import DBAccess.UserMapper;
import FunctionLayer.LoginSampleException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowBalance extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        int user_id = Integer.parseInt(request.getParameter("IDUser1"));

        int balance = UserMapper.getBalance(user_id);

        request.setAttribute("balance", balance);
        request.setAttribute("msgBalance", "Kundens balance er ");

        return "editUserPage";
    }
}
