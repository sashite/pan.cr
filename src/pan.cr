# The PAN (Portable Action Notation) module
module PAN
  VERSION = "0.1.0"

  def self.dump(*actions)
    Dumper.call(*actions)
  end

  def self.parse(pan_string)
    Parser.call(pan_string)
  end
end

require "./pan/dumper"
require "./pan/parser"
