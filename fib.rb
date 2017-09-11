def fib_normal(number)
	arr = []
	arr[0] = 1
	arr[1] = 1
	2.upto(number) do |x|
		arr[x] = arr[x-1] + arr[x-2]
	end
	arr
end
# arr = Array.new
def fib_recursive(number)
	(number == 1 || number == 2) ? 1 : (fib_recursive(number - 1) + fib_recursive(number - 2))
end
print fib_recursive(11)

