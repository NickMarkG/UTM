require_relative 'Parser'
require_relative 'Tape'
require_relative 'UTM'

parser = Parser.new("sample_TM.txt")
#tape = Tape.new(parser.file)
utm = UTM.new(parser.description, parser.delta, Tape.new(parser.file))
puts utm.simulate

#tape = Tape.new(parser.file)
#100.times do (print (tape.nextchar)) end