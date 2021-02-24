# Select top 10 in firebird

How do you select `top 10` in firebird db? Is it `limit`? it it `rownum`?

No it is `first`:

	Select FIRST(10) *
	from CUSTOMER
	order by ID desc

Ha!

## See also

- [Oracle TOP 10](../oracle/top_10.md) ...includes mysql tip!
- [SQLite Select Top 10](../sqlite/select_top_10.md)