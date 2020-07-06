require "./action"

module PAN
  # Parser class
  class Parser < Action
    def self.call(serialized_move : String)
      serialized_move.split(separator)
                     .map { |serialized_action| new(serialized_action).call }
    end

    @src_square : Int32 | Nil
    @dst_square : Int32
    @piece_name : String
    @piece_hand : String | Nil

    def initialize(serialized_action : String)
      action_args = serialized_action.split(separator)
      src_square  = action_args[0]
      @src_square = (src_square == drop_char ? nil : src_square.to_i)
      @dst_square = action_args[1].to_i
      @piece_name = action_args[2]
      @piece_hand = action_args.fetch(3, nil)
    end

    def call
      {src_square, dst_square, piece_name, piece_hand}
    end
  end
end
