# Landfill

Garbage Collection measurement tool.   You have some code, now measure how much garbage it generates, whether it causes GC to run, etc.

## Description

GC is **the** major issue when it comes to ruby performance troubles.  Landfill can help hunt down the big offenders. (REE 1.8.7+)

## Using

Similar usage pattern as Benchmark.ms.   

	gc_info = Landfill.measure do
		# your code here
	end
	puts gc_info

## Sample output:

	                       delta         pre        post  
	num_allocations:        1921     1313434     1315355
	allocated_size:       102102    82312684    82414786
	collections:               0           6           6
	time (ms):                 0      696008      696008
	growth:               137870     4756344     4894214
	live_objects:           3404      866249      869653



[https://github.com/dissemble/Landfill](https://github.com/dissemble/Landfill)