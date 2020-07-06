# The PAN (Portable Action Notation) module
module PAN
  VERSION = "0.2.0"

  def self.dump(*actions)
    Dumper.call(*actions)
  end

  def self.parse(string : String)
    Parser.call(string)
  end
end

require "./pan/dumper"
require "./pan/parser"
