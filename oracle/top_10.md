# Select top (10) in oracle

    SELECT * FROM (
        ... Your query here...   SELECT FROM WHERE
        )
    WHERE ROWNUM <= 10

And, although it's offtopic, let me add that in mysql you use LIMIT, e.g.

    SELECT *
    FROM Persons
    LIMIT 5;

## See also

- [Firebird TOP 10](../firebird/select_top_10.md)
- [SQLite Select Top 10](../sqlite/select_top_10.md)
