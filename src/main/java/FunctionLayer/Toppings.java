package FunctionLayer;

import DBAccess.CupcakeMapper;

import java.util.ArrayList;
import java.util.List;

public class Toppings {

    private static List<Topping> toppings;

    public static void initToppings() {
        if (toppings == null) {
            toppings = new ArrayList<>();
            try {
                toppings = CupcakeMapper.getToppings();
            } catch (LoginSampleException e) {
                e.getMessage();
            }
        }
    }

    public static List<Topping> getToppings() {
        return toppings;
    }
}
