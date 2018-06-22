require "./crystal-test/*"

module Crystal::Test
	def twice(&block)
		yield; yield
	end

	twice do
		puts "hello"
	end

end
