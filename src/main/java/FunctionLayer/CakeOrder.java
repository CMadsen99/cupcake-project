package FunctionLayer;

public class CakeOrder {
    private String toppingName;
    private String bottomName;
    private int quantity;
    private int price;

    public CakeOrder(String toppingName, String bottomName, int quantity, int price) {
        this.toppingName = toppingName;
        this.bottomName = bottomName;
        this.quantity = quantity;
        this.price = price;
    }

    public String getToppingName() {
        return toppingName;
    }

    public void setToppingName(String toppingName) {
        this.toppingName = toppingName;
    }

    public String getBottomName() {
        return bottomName;
    }

    public void setBottomName(String bottomName) {
        this.bottomName = bottomName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
