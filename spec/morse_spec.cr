require "./spec_helper"

describe Morse do
  it "encodes text to morse code" do
    Morse.encode("hello").should eq ".... . .-.. .-.. ---"
  end

  it "decodes morse code to text" do
    Morse.decode(".... . .-.. .-.. ---").should eq "hello"
  end

  it "plays morse code" do
    Morse.play ".... . .-.. .-.. ---"
  end
end
