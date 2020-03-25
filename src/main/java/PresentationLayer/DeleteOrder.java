package PresentationLayer;

import DBAccess.OrderMapper;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Order;
import FunctionLayer.OrderList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class DeleteOrder extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        HttpSession session = request.getSession();

        int orderID = Integer.parseInt(request.getParameter("idOrder"));

        OrderMapper.deleteOrderDetails(orderID);
        OrderMapper.deleteOrder(orderID);

        List<Order> orderListAll = OrderMapper.getAllOrders();
        session.setAttribute("orderListAll", orderListAll);

        return "orderHistoryAllAdmin";
    }
}
