# json examples


## prime example

	{}


## one attribute

	{"name": "Jan"}

## more attributes 

	{"name": "Jan", "age": 41}

## as variable

	var details = {"name": "Jan", "age": 41};
	details.name; 		// equals Jan
	details["name"];	// also equals Jan

## change property

	details.name = "Pam";
	
## an arry in json


```JSON
{
	"name" : "Pam",
	"skills" : [ "sword", "tnt", "kung fu" ]
}
```

## as a variable
Javascript:

	var details = {"name": "Jan", "age": 41};
	JSON.stringify(details);
	
returns:

```
{"name":"Jan","age":41}
```

## formatted (slightly)

Javascript:

	JSON.stringify(details, null, "\t");

returns:

```json
{
	"name": "Jan",
	"age": 41
}
```


Javascript: 

	JSON.stringify(details, null, "INDENT");

returns:

```json
{
	INDENT"name": "Jan",
	INDENT"age": 41
}
```


