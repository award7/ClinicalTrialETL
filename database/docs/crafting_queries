# Creating Safe Queries from Python

* Use `(?)` to placehold for parameters
* Pass arguments to the `execute` method via `(variable,)`
    
    E.g.
    `con.execute("insert into person(firstname) values (?)", ("Joe",))`
    `con.execute("insert into person(firstname) values (?)", (firstname,))`

* Do not use other methods of string interpolation (e.g. f-strings, `.format()`, etc.) 

