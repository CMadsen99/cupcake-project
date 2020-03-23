package PresentationLayer;

import DBAccess.OrderMapper;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class OrderViewCustomer extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        HttpSession session = request.getSession();

        String destination = request.getParameter("destination");

        int usersID = 0;
        if (session.getAttribute("usersID") != null) {
            usersID = (int) session.getAttribute("usersID");

            List<Order> orderListCustomer = OrderMapper.getOrders(usersID);

            session.setAttribute("orderListCustomer", orderListCustomer);
        }

        return destination;
    }
}
