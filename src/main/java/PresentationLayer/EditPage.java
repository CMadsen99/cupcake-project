package PresentationLayer;

import FunctionLayer.LoginSampleException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditPage extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {
        HttpSession session = request.getSession();
        int user_id = Integer.parseInt(request.getParameter("idEdit"));

        //request.setAttribute("userID", user_id);
        session.setAttribute("userID", user_id);
        return "editUserPage";
    }
}
