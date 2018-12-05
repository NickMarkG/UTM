class Tape
	def initialize(file_object)
		@file = file_object
		@tape = [nextsymbol]
		@head_position = 0
	end

	# Moves tape head right
	def right
		if (@tape[@head_position+1] == nil)
			@tape.append(nextsymbol)
		end

			@head_position += 1
	end

	# Moves tape head left
	def left
		@head_position -= 1
		if (@head_position < 0)
			print("We have a problem")
			@head_position = 0
		end
	end

	def read
		@tape[@head_position]
	end

	# Write to tape using tape_head as index
	def write(symbol)
		@tape[@head_position] = symbol
	end

	def eot?
		@tape[@head_position] == nil
	end

	private
		# Gets the next symbol from @file using "1" as delimiter
		private def nextsymbol
			return "000" if @file.eof?
			#char = @file.readchar
			symbol = ""

			while (!@file.eof?)
				char = @file.readchar
				if (char == "1")
					break
				else
					symbol.insert(-1, char)
				end
			end
			print "Warning: Empty char!!!" if symbol.empty?
			return symbol
		end
end