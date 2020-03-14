package models;

public class cakes {
    private String topping;
    private String bottom;
    private String name;
    private int price;

    public cakes(String topping, String bottom, String name, int price) {
        this.topping = topping;
        this.bottom = bottom;
        this.name = name;
        this.price = price;
    }

 public String getTopping() { return topping;}

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public String getBottom() {
        return bottom;
    }

    public void setBottom(String bottom) {
        this.bottom = bottom;
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

    @Override
    public String toString() {
        return "cakes{" +
                "topping='" + topping + '\'' +
                ", bottom='" + bottom + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
