package PresentationLayer;

import FunctionLayer.CakeOrder;
import FunctionLayer.LoginSampleException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class RemoveBasketLine extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        HttpSession session = request.getSession();

        int counter = Integer.parseInt(request.getParameter("counter"));

        int price = ((ArrayList<CakeOrder>) session.getAttribute("basket")).get(counter).getPrice();

        ((ArrayList<CakeOrder>) session.getAttribute("basket")).remove(counter);

        int totalPrice = (int) session.getAttribute("totalPrice");
        totalPrice = totalPrice -price;
        session.setAttribute("totalPrice", totalPrice);

        return "basket";
    }
}
