require "./crystal-test/*"

# This works fine.
def twice(&block)
	yield 1
	yield 2
end

twice do |number|
	puts "hello #{number + 5}"
end

# As does this.
module Test
	def self.once(&block)
		yield 3
	end

	once do |number|
		puts "hi #{number / 2}"
	end
end

# As does this.
module NewTest
	extend self
	def once(&block)
		yield 1.5
	end

	once do |number|
		puts "hi #{number / 2}"
	end
end

# However, this does not.
# module Test2
# 	def twice(&block)
# 		yield
# 		yield
# 	end
# 
# 	twice do
# 		puts "hi"
# 	end
#		
# 	# calling Test.twice, Test::twice, or self.twice don't work either
# end

# A member function in a module will need to be included:
module Test3
	def thrice(&block)
		yield
		yield
		yield
	end
end

include Test3
thrice do
	puts "wow"
end

# You can include them inside modules too.
module Test4
	include Test3
	thrice do
		puts "banzai"
	end
end

# Is calling the block equivalent to yield?
module Test4
	def call_twice(&block)
		yield 4
		block 5 # Compile error.
	end

	# The last parameter with preceding ampersand is a dummy, used only to indicate that the function yields. &block does not actually have any actual functionality (?).
end



call_twice do |number|
	puts number.as(Float64) / 2 + 5
end


# Lots of syntax options available... So much sugar!
Test4.call_twice do |number|
	puts number
end

# TODO: Add some shortened Procs

# You can even ignore the parameters, if you wish.
call_twice do
	puts "hello!"
end

# TODO: Blocks can contain complex logic too.
# call_twice do |number|
# 	do_things_with_number # TODO: make this into proc, then call it with number

# TODO: Have call_twice take optional parameters.
