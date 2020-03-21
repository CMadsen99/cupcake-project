package PresentationLayer;

import DBAccess.CupcakeMapper;
import DBAccess.OrderMapper;
import DBAccess.UserMapper;
import FunctionLayer.CakeOrder;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class PayOrder extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        HttpSession session = request.getSession();

        int usersID = 0;
        if (!(request.getParameter("usersID") == "")) {
            usersID = Integer.parseInt(request.getParameter("usersID"));
        }

        if (usersID > 0) {
            int cost = (int) session.getAttribute("totalPrice");
            int balance = UserMapper.getBalance(usersID);
            String paid = "Ikke betalt";

            if (balance > cost) {
                paid = "Betalt";
                UserMapper.payOrder(cost, usersID);
            }

            Order order = new Order(usersID, cost, paid);
            OrderMapper.insertOrder(order);

            int maxOrderID = OrderMapper.getMaxOrderID();

            for (CakeOrder c: (ArrayList<CakeOrder>)session.getAttribute("basket")) {
                int toppingID = CupcakeMapper.getToppingID(c.getToppingName());
                int bottomID = CupcakeMapper.getBottomID(c.getBottomName());
                int quantity = c.getQuantity();

                OrderMapper.insertOrderDetails(maxOrderID, toppingID, bottomID, quantity);
            }

            session.removeAttribute("totalPrice");
            ((ArrayList<CakeOrder>)session.getAttribute("basket")).clear();

            return "index";
        } else {
            request.setAttribute("orderMsg", "Login krævet for at bestille");
            return "signin";
        }

    }
}
