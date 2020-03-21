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
                int id = rs.getInt("product_id");
                String name = rs.getString("product_name");
                int price = rs.getInt("price");
                Topping topping = new Topping(id, name, price);
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
                int id = rs.getInt("product_id");
                String name = rs.getString("product_name");
                int price = rs.getInt("price");
                Bottom bottom = new Bottom(id, name, price);
                bottoms.add(bottom);
            }
            return bottoms;
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static String getProductName(int productID) throws LoginSampleException {
        String name = "";
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT product_name FROM cupcake.products WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement( SQL );
            ps.setInt( 1, productID );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                name = rs.getString("product_name");
                return name;
            } else {
                return name;
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static int getProductPrice(int productID) throws LoginSampleException {
        int price = 0;
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT price FROM cupcake.products WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement( SQL );
            ps.setInt( 1, productID );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                price = rs.getInt("price");
                return price;
            } else {
                return price;
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static int getBottomID(String productName) throws LoginSampleException {
        int bottomID = 0;
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT product_id FROM cupcake.products WHERE product_name = ? AND type = \"Bottom\"";
            PreparedStatement ps = con.prepareStatement( SQL );
            ps.setString(1, productName);
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                bottomID = rs.getInt("product_id");
                return bottomID;
            } else {
                return bottomID;
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static int getToppingID(String productName) throws LoginSampleException {
        int toppingID = 0;
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT product_id FROM cupcake.products WHERE product_name = ? AND type = \"Topping\"";
            PreparedStatement ps = con.prepareStatement( SQL );
            ps.setString(1, productName);
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                toppingID = rs.getInt("product_id");
                return toppingID;
            } else {
                return toppingID;
            }

        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
    }
}
