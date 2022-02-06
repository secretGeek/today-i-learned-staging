# Clone Entity Graph in EF6

By clone - i mean make a copy.

By clone an entity graph I mean don't just copy 1 entity, but copy something a bit more complex, a "thing" that is stored in multiple tables, it might have several child records, grandchild records, `1:1` records, etc.

Part of cloning an entity graph is deciding what is and is not going to be cloned.

For example - imagine you are cloning a "sale" in a sales system.

It might have a structure like this -- (which I've deliberately made a little bit weird, to highlight some of the issues! Because brownfields databases in the real world are always weird!)

	"Sales" table
	Id (primary key)
	Date of Sale
	Customer_ID (foreign key
	Total

	"SalesExtra" tables
	Id (primary key *and* foreign key to Sales table... a 1:1 mapping!)
	Store_Id (foreign key to the store table)
	Method_of_Payment_Id (foreign key to a 'lookup' table for credit card/ cash etc.)
	Total_Discounts

	"SalesLineItems" table
	Id (primary key)
	Sale_ID (Foreign key to sales table, the 'parent' of this row)
	Product_ID
	Quantity
	Unit Price
	Discounts
	Price

When you clone the sale you will also want to clone the SalesLineItems. But what about the Product in the product table? and the customer in the customer table? You probably do not want to clone them.

For this method I found I needed to disable "proxy creation"

	DbContext.Configuration.ProxyCreationEnabled = false;

Step 1 -

//TODO