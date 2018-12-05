class UTM
	def initialize(description, function, tape)
		@states = description[0].length
		@input_symbols = description[1].length
		@output_symbols = description[2].length
		@left_marker = description[3]
		@blank_symbol = description[4]
		@start_state = description[5]
		@accept_state = description[6]
		@reject_state = description[7]
		@function_map = Hash.new
		@tape = tape

		#p function

		for i in 0..function.size-1 do
			@function_map.store([function[i][0], function[i][1]],
			 [function[i][2], function[i][3], function[i][4]])
		end
	end

	def simulate
		transition_input = [@start_state, @tape.read]
		transition_output = []

		while(transition_input[0] != @reject_state && transition_input[0] != @accept_state)
			transition_output = @function_map.fetch(transition_input)
			@tape.write(transition_output[1])

			#print "transition input: #{transition_input}\n"
			#print "transition output: #{transition_output}\n\n"

			if (transition_output[2].length == 1)
				@tape.left
			else
				@tape.right
			end

			transition_input = [transition_output[0], @tape.read]
		end
		p transition_input
		return transition_input[0] == @accept_state
	end

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
	end
end