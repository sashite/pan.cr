module PAN
  # Dumper class
  class Dumper
    def self.call(*actions)
      actions.map { |action_items| new(*action_items).call }.join(';')
    end

    @src_square : Int32 | String
    @dst_square : Int32
    @piece_name : String
    @piece_hand : String | Nil

    getter :src_square, :dst_square, :piece_name, :piece_hand

    def initialize(src_square, dst_square, piece_name, piece_hand = nil)
      @src_square = (src_square.nil? ? "*" : src_square)
      @dst_square = dst_square
      @piece_name = piece_name
      @piece_hand = piece_hand
    end

    def call
      action_items.join(',')
    end

    private def action_items
      return {src_square, dst_square, piece_name} if piece_hand.nil?

      {src_square, dst_square, piece_name, piece_hand}
    end
  end
end
