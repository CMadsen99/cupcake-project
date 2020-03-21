package PresentationLayer;

import DBAccess.CupcakeMapper;
import FunctionLayer.CakeOrder;
import FunctionLayer.LoginSampleException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class CupcakeBasket extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        HttpSession session = request.getSession();

        if (request.getParameter("topping") != null && request.getParameter("bottom") != null && request.getParameter("quantity") != null) {
            int toppingID = Integer.parseInt(request.getParameter("topping"));
            int bottomID = Integer.parseInt(request.getParameter("bottom"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            String toppingName = CupcakeMapper.getProductName(toppingID);
            int toppingPrice = CupcakeMapper.getProductPrice(toppingID);
            String bottomName = CupcakeMapper.getProductName(bottomID);
            int bottomPrice = CupcakeMapper.getProductPrice(bottomID);

            int orderPrice = (toppingPrice + bottomPrice) * quantity;

            CakeOrder cakeOrder = new CakeOrder(toppingName, bottomName, quantity, orderPrice);

            if ((ArrayList<CakeOrder>) session.getAttribute("basket") == null) {
                ArrayList<CakeOrder> basket = new ArrayList<>();

                session.setAttribute("basket", basket);
            }

            ((ArrayList<CakeOrder>) session.getAttribute("basket")).add(cakeOrder);

            request.setAttribute("selection", "Du har valgt: " + toppingName + " " + bottomName + " Antal: " + quantity);

            int totalPrice = 0;
            for (CakeOrder c : (ArrayList<CakeOrder>) session.getAttribute("basket")) {
                totalPrice += c.getPrice();
            }

            session.setAttribute("totalPrice", totalPrice);
        } else {
            throw new LoginSampleException("Du har ikke valgt nogle cupcakes");
        }

        return "index";
    }
}
