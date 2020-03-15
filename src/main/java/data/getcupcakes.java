package data;

import DBAccess.Connector;
import models.cakes;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class getcupcakes {
    public ArrayList<cakes> getTopping() throws ClassNotFoundException, SQLException {
        ArrayList<cakes> returnList = new ArrayList<>();

        Connection myConnector = null;
        Statement statement = null;
        ResultSet resultSet = null;

        myConnector = Connector.connection();
        String query = "SELECT * FROM cupcake.products where type=\"Topping\";";
        statement = myConnector.createStatement();
        resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            String productname = resultSet.getString("product_name");
            String topping = resultSet.getString("type");
            int price = resultSet.getInt("price");
            cakes tempMember = new cakes(productname, topping, price);

            returnList.add(tempMember);
        }

        resultSet.close();
        statement.close();
        myConnector.close();

        return returnList;
    }

}
