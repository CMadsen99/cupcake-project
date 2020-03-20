package PresentationLayer;

import DBAccess.UserMapper;
import FunctionLayer.LoginSampleException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Edit extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        int user_id = Integer.parseInt(request.getParameter("IDUser2"));
        int amount = Integer.parseInt(request.getParameter("amount"));

        if (amount > 0) {
            UserMapper.updateBalance(amount, user_id);
            return "adminpage";
        } else {
            request.setAttribute("msg", "Beløbet blev ikke tilføjet");
            return "editUserPage";
        }

    }
}
