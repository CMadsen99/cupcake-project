package PresentationLayer;

import DBAccess.OrderMapper;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class Orderview extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {
        HttpSession session = request.getSession();
        int user_id = Integer.parseInt(request.getParameter("idOrder"));

        List<Order> orderList = new ArrayList<>();
        orderList = OrderMapper.getOrders(user_id);

        session.setAttribute("orderList", orderList);

        return "orderHistory";
    }
}
