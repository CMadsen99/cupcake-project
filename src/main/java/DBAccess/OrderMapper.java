package DBAccess;

import FunctionLayer.LoginSampleException;
import FunctionLayer.Order;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class OrderMapper {

    public static ArrayList<Order> getOrders() throws LoginSampleException {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT * FROM cupcake.orders";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                int user_id = rs.getInt("user_id");
                int cost = rs.getInt("cost");
                int sqlPaid = rs.getInt("paid");
                String paid = "Ikke betalt";
                if (sqlPaid > 0) {
                    paid = "Betalt";
                }
                Order order = new Order(order_id, user_id, cost, paid);
                orders.add(order);
            }
            return orders;
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
    }
}
