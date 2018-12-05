require_relative 'Parser'
require_relative 'Tape'
require_relative 'UTM'

parser = Parser.new("sample_TM.txt")
utm = UTM.new()

# The open file from parser is passed to utm in order to retain the pointer in the file.
# Probably not the safest or cleanest approach. Noted.
puts utm.simulate_tm(parser.description, parser.delta, Tape.new(parser.file))
