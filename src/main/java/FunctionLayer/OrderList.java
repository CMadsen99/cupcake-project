package FunctionLayer;

import DBAccess.OrderMapper;

import java.util.ArrayList;
import java.util.List;

public class OrderList {

    private static List<Order> orderList;

    public static void initOrderList() {

        if (orderList == null) {
            orderList = new ArrayList<>();
            try {
                orderList = OrderMapper.getAllOrders();
            } catch (LoginSampleException e) {
                e.getMessage();
            }
        }
    }

    public static List<Order> getOrderList() {
        return orderList;
    }
}

