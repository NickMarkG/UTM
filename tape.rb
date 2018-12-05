class Tape
	def initialize(file_object)
		@file = file_object
		@tape = [nextsymbol]
		@head_position = 0
	end

	# Moves tape head right
	def right
		if (@tape[head_position+1] == null)
			@tape.append(nextsymbol)
		end

			head_position += 1
	end

	# Moves tape head left
	def left
		head_position -= 1
		if (head_position < 0)
			print("We have a problem")
			head_position = 0
		end
	end

	# Write to tape using tape_head as index
	def write(symbol)
		@tape[head_position] = symbol
	end

	private
		# Gets the next symbol from @file using "1" as delimiter
		private def nextsymbol
			symbol = ""
			char = @file.readchar

			while (char != "1")
				symbol.insert(-1, char)
				char = @file.readchar
			end

			return symbol
		end
end