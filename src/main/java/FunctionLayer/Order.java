package FunctionLayer;

public class Order {

    private int order_id;
    private int user_id;
    private int cost;
    private String paid;

    public Order(int order_id, int user_id, int cost, String paid) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.cost = cost;
        this.paid = paid;
    }

    public Order(int user_id, int cost, String paid) {
        this.user_id = user_id;
        this.cost = cost;
        this.paid = paid;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }
}
