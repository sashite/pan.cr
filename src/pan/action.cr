module PAN
  # Action class
  abstract class Action
    getter :src_square, :dst_square, :piece_name, :piece_hand

    abstract def call

    private def self.separator
      ';'
    end

    private def separator
      ','
    end

    private def drop_char
      "*"
    end
  end
end
