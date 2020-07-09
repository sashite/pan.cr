require "./action"

module PAN
  # Dumper class
  class Dumper < Action
    def self.call(*actions)
      actions.map { |action_items| new(*action_items).call }
        .join(separator)
    end

    @src_square : String
    @dst_square : String
    @piece_name : String
    @piece_hand : String | Nil

    def initialize(src_square : Int32 | Nil, dst_square : Int32, piece_name : String, piece_hand : String | Nil = nil)
      @src_square = (src_square.nil? ? drop_char : src_square.to_s)
      @dst_square = dst_square.to_s
      @piece_name = piece_name
      @piece_hand = piece_hand
    end

    def call
      action_items.join(separator)
    end

    private def action_items
      return {src_square, dst_square, piece_name} if piece_hand.nil?

      {src_square, dst_square, piece_name, piece_hand}
    end
  end
end
