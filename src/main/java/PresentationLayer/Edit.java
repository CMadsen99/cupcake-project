package PresentationLayer;

import DBAccess.UserMapper;
import FunctionLayer.LoginSampleException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Edit extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        HttpSession session = request.getSession();

        int user_id = (int) request.getAttribute("userID");
        int amount = Integer.parseInt(request.getParameter("amount"));

        int balance = UserMapper.getBalance(user_id);
        session.setAttribute("balance", balance);

        if (amount > 0) {
            UserMapper.updateBalance(amount, user_id);
            session.setAttribute("msg", "Beløbet er blevet tilføjet");
        } else {
            session.setAttribute("msg", "Beløbet blev ikke tilføjet");
        }

        return "editUserPage";
    }
}
