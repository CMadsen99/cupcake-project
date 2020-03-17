package FunctionLayer;

public class Bottom {

    private int bottom_id;
    private String name;
    private int price;

    public Bottom(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public int getBottom_id() {
        return bottom_id;
    }

    public void setBottom_id(int bottom_id) {
        this.bottom_id = bottom_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
