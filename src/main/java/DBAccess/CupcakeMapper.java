package DBAccess;

import FunctionLayer.Bottom;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Topping;
import FunctionLayer.User;

import java.sql.*;
import java.util.ArrayList;

public class CupcakeMapper {

    public static ArrayList<Topping> getToppings() throws LoginSampleException {
        ArrayList<Topping> toppings = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT * FROM cupcake.products WHERE type = \"Topping\"";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                String name = rs.getString("product_name");
                int price = rs.getInt("price");
                Topping topping = new Topping(name, price);
                toppings.add(topping);
            }
            return toppings;
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static ArrayList<Bottom> getBottoms() throws LoginSampleException {
        ArrayList<Bottom> bottoms = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT * FROM cupcake.products WHERE type = \"Bottom\"";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                String name = rs.getString("product_name");
                int price = rs.getInt("price");
                Bottom bottom = new Bottom(name, price);
                bottoms.add(bottom);
            }
            return bottoms;
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
    }
}
