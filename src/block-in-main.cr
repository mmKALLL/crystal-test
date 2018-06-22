require "./crystal-test/*"

# This works
def twice(&block)
	yield 1
	yield 2
end

twice do |number|
	puts "hello #{number + 5}"
end

# As does this
module Test
	def self.thrice(&block)
		yield
		yield
		yield
	end

	Test.thrice do
		puts "hi"
	end
end


# But this does not (without specifying `self.thrice` or `extends self`)
# module Test2
# 	def thrice(&block)
# 		yield
# 		yield
# 		yield
# 	end
# 
# 	thrice do
# 		puts "hi"
# 	end
#		
# Test.thrice, self.thrice don't work either.
# end
