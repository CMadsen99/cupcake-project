package models;

public class cakes {
    private String topping;
    private String bottom;
    private String productname;
    private int price;

    public cakes(String topping, String bottom, String productname, int price) {
        this.topping = topping;
        this.bottom = bottom;
        this.productname = productname;
        this.price = price;
    }

    public cakes(String productname, String topping, int price) {
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

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
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
                ", productname='" + productname + '\'' +
                ", price=" + price +
                '}';
    }
}
