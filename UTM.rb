class UTM
	def initialize(description, function, tape)

		@function_map = Hash.new
		for i in 0..function.size-1 do
			@function_map.store([function[i][0], function[i][1]],
			 [function[i][2], function[i][3], function[i][4]])
		end

		@tape = tape
	end

	

end