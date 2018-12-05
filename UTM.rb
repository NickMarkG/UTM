class UTM
	def initialize()
		@states = []
		@input_symbols = []
		@output_symbols = []
		@left_marker = nil
		@blank_symbol = nil
		@start_state = nil
		@accept_state = nil
		@reject_state = nil
		@function_map = Hash.new
		@tape = nil
		@head_movements = 0
		@end_state = nil

	end

	# Takes input for a given TM to simulate
	def simulate_tm(description, function, tape)
		@states = description[0].length
		@input_symbols = description[1].length
		@output_symbols = description[2].length
		@left_marker = description[3]
		@blank_symbol = description[4]
		@start_state = description[5]
		@accept_state = description[6]
		@reject_state = description[7]
		@tape = tape

		# Maps the delta function in a hash table
		for i in 0..function.size-1 do
			@function_map.store([function[i][0], function[i][1]],
			 [function[i][2], function[i][3], function[i][4]])
		end

		print_results(simulate)
	end

	# Begins the simulation of the turing machine
	def simulate()
		transition_input = [@start_state, @tape.read]
		transition_output = []
		@head_movements = 0

		while(transition_input[0] != @reject_state && transition_input[0] != @accept_state)
			transition_output = @function_map.fetch(transition_input)
			@tape.write(transition_output[1])

			if (transition_output[2].length == 1)
				@tape.left
			else
				@tape.right
			end

			@head_movements += 1
			transition_input = [transition_output[0], @tape.read]
		end

		@end_state = transition_output[0]
		@file.close
		return transition_input[0] == @accept_state
	end

	def print_results(result)
		puts("Test case result: #{result}")
		puts("End state: #{@end_state}")
		puts("Total head movements: #{@head_movements}\n")
		puts(self)
	end

	# FIXME: Shouldn't be printing in the to_s method
	def to_s
		puts("States:  #{@states}")
		puts("Input Symbols: #{@input_symbols}")
		puts("Output_symbols: #{@output_symbols}")
		puts("Left Marker: #{@left_marker}")
		puts("Blank Symbol: #{@blank_symbol}")
		puts("Start State: #{@start_state}")
		puts("Accept State: #{@accept_state}")
		puts("Reject State: #{@reject_state}")
		puts("Function Map: #{@function_map}")
		return ""
	end
end