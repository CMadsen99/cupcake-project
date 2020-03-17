package FunctionLayer;

import DBAccess.CupcakeMapper;

import java.util.ArrayList;
import java.util.List;

public class Bottoms {

    private static List<Bottom> bottoms;

    public static void initToppings() {
        if (bottoms == null) {
            bottoms = new ArrayList<>();
            try {
                bottoms = CupcakeMapper.getBottoms();
            } catch (LoginSampleException e) {
                e.getMessage();
            }
        }
    }

    public static List<Bottom> getBottoms() {
        return bottoms;
    }
}
