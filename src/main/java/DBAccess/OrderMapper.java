package DBAccess;

import FunctionLayer.LoginSampleException;
import FunctionLayer.Order;
import FunctionLayer.User;

import java.sql.*;
import java.util.ArrayList;

public class OrderMapper {

    public static ArrayList<Order> getOrders(int id) throws LoginSampleException {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT * FROM cupcake.orders WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
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
        } catch (ClassNotFoundException | SQLException ex) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static void insertOrder(Order order) throws LoginSampleException {
        boolean paid = false;
        try {
            Connection con = Connector.connection();
            String SQL = "INSERT INTO orders(user_id, cost, paid) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, order.getUser_id());
            ps.setInt(2, order.getCost());
            if (order.getPaid().equals("Betalt")) {
                paid = true;
            }
            ps.setBoolean(3, paid);
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static void insertOrderDetails(int orderID, int toppingID, int bottomID, int quantity) throws LoginSampleException {
        try {
            Connection con = Connector.connection();
            String SQL = "INSERT INTO order_details(order_id, topping_id, bottom_id, quantity) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, orderID);
            ps.setInt(2, toppingID);
            ps.setInt(3, bottomID);
            ps.setInt(4, quantity);
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static int getMaxOrderID() throws LoginSampleException {
        int orderID = 0;
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT MAX(order_id) as id FROM cupcake.orders";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(SQL);
            if (rs.next()) {
                orderID = rs.getInt("id");
            }
            return orderID;
        } catch (ClassNotFoundException | SQLException ex) {
            throw new LoginSampleException(ex.getMessage());
        }
    }
}
