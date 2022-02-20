package model;

public class View {
	private int orderdetailsid;
	private int productid;
	private int orderid;
	private String productname;
	private String productsize;
	private double productprice;
	private String productdesc;
	private String image;
	private String orderdate;
	private double ordertotalprice;
	private int custid;
	
	public int getOrderdetailsid() {
		return orderdetailsid;
	}
	public void setOrderdetailsid(int orderdetailsid) {
		this.orderdetailsid = orderdetailsid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProductsize() {
		return productsize;
	}
	public void setProductsize(String productsize) {
		this.productsize = productsize;
	}
	public double getProductprice() {
		return productprice;
	}
	public void setProductprice(double productprice) {
		this.productprice = productprice;
	}
	public String getProductdesc() {
		return productdesc;
	}
	public void setProductdesc(String productdesc) {
		this.productdesc = productdesc;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public double getOrdertotalprice() {
		return ordertotalprice;
	}
	public void setOrdertotalprice(double ordertotalprice) {
		this.ordertotalprice = ordertotalprice;
	}
	public int getCustid() {
		return custid;
	}
	public void setCustid(int custid) {
		this.custid = custid;
	}
	

}
