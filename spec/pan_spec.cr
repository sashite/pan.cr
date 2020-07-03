require "./spec_helper"

describe PAN do
  describe ".dump" do
    context "King's Pawn opening at chess" do
      it "works" do
        PAN.dump({52, 36, "♙", nil}).should eq("52,36,♙")
      end
    end

    context "Black castles on king-side" do
      it "works" do
        PAN.dump({60, 62, "♔", nil}, {63, 61, "♖", nil}).should eq("60,62,♔;63,61,♖")
      end
    end

    context "Promoting a chess pawn into a knight" do
      it "works" do
        PAN.dump({12, 4, "♘", nil}).should eq("12,4,♘")
      end
    end

    context "Capturing a rook and promoting a shogi pawn" do
      it "works" do
        PAN.dump({33, 24, "+P", "R"}).should eq("33,24,+P,R")
      end
    end

    context "Dropping a shogi pawn" do
      it "works" do
        PAN.dump({nil, 42, "P", nil}).should eq("*,42,P")
      end
    end

    context "Capturing a white chess pawn en passant" do
      it "works" do
        PAN.dump({33, 32, "♟", nil}, {32, 40, "♟", nil}).should eq("33,32,♟;32,40,♟")
      end
    end
  end

  describe ".parse" do
    context "King's Pawn opening at chess" do
      it "works" do
        PAN.parse("52,36,♙").should eq([{52, 36, "♙", nil}])
      end
    end

    context "Black castles on king-side" do
      it "works" do
        PAN.parse("60,62,♔;63,61,♖").should eq([{60, 62, "♔", nil}, {63, 61, "♖", nil}])
      end
    end

    context "Promoting a chess pawn into a knight" do
      it "works" do
        PAN.parse("12,4,♘").should eq([{12, 4, "♘", nil}])
      end
    end

    context "Capturing a rook and promoting a shogi pawn" do
      it "works" do
        PAN.parse("33,24,+P,R").should eq([{33, 24, "+P", "R"}])
      end
    end

    context "Dropping a shogi pawn" do
      it "works" do
        PAN.parse("*,42,P").should eq([{nil, 42, "P", nil}])
      end
    end

    context "Capturing a white chess pawn en passant" do
      it "works" do
        PAN.parse("33,32,♟;32,40,♟").should eq([{33, 32, "♟", nil}, {32, 40, "♟", nil}])
      end
    end
  end
end
