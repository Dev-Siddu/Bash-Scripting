#!/bin/bash

# Q) declare a variable inside a function and try to access it outside of the function.

my_function(){

	# when local keyword is used the variable scope exists only inside that function outside doesn't exist. if local keyword is not use	d then it can be accessed.

	local inside_func="This is inside the function."
	echo "Variable inside function: ${inside_func}"	
}

my_function 

echo "Variable outside function: ${inside_func}"
