class Parser
	attr_reader :description, :delta
	attr_accessor :file

	def initialize(file)
		@file = File.open(file, "r")
		@description = parse_section(true)
		@delta = parse_section
	end

	# Reads unary TM description (where '1' is delimiter) from file
	# and parses the 5-tuple into @description
	def parse_section(bool=false)
		parsed = []
		parsed_segment = []
		segment = ""

		while (segment != "111")
			char = @file.readchar

			# Sperates inner tuples
			if (segment == "11" && char != "1")
				parsed.append(parsed_segment)
				parsed_segment = []
				segment = char

			# Seperates segments
			elsif (segment == "1" && char != "1")
				segment = char
			elsif (char == "1" && segment[-1] != "1")
				parsed_segment.append(segment)
				segment = "1"
			else
				segment.insert(-1, char)
			end
		end

		if (parsed.empty? && bool)
			parsed = parsed_segment
		else
			parsed.append(parsed_segment)
		end

		return parsed
	end
end