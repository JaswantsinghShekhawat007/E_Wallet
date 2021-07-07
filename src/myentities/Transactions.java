package myentities;

public class Transactions 
{
	private int transno;
	private String transdt;
	private String srcwalletid;
	private String destwalletid;
	private String transactiontype;
	private double amount;
	private String name;
	
	public Transactions()
	{
		transno=0;
		transdt="";
		srcwalletid="";
		destwalletid="";
		transactiontype="";
		amount=0.0;
		name="";
	}

	public int getTransno() {
		return transno;
	}

	public void setTransno(int transno) {
		this.transno = transno;
	}

	public String getTransdt() {
		return transdt;
	}

	public void setTransdt(String transdt) {
		this.transdt = transdt;
	}

	public String getSrcwalletid() {
		return srcwalletid;
	}

	public void setSrcwalletid(String srcwalletid) {
		this.srcwalletid = srcwalletid;
	}

	public String getDestwalletid() {
		return destwalletid;
	}

	public void setDestwalletid(String destwalletid) {
		this.destwalletid = destwalletid;
	}

	public String getTransactiontype() {
		return transactiontype;
	}

	public void setTransactiontype(String transactiontype) {
		this.transactiontype = transactiontype;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	

}
