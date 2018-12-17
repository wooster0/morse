require "spec"
require "../src/morse"

describe Morse do
  it "encodes text to morse code" do
    Morse.encode("hello").should eq(".... . .-.. .-.. ---")

    Morse.encode("ÄäÖöÜü").should eq(".-.- .-.- ---. ---. ..-- ..--")
  end

  it "encodes char to morse code" do
    Morse.encode('h').should eq("....")
  end

  it "decodes morse code to text" do
    Morse.decode(".... . .-.. .-.. ---").should eq("HELLO")

    Morse.decode(".-.- .-.- ---. ---. ..-- ..--").should eq("ÄÄÖÖÜÜ")
  end

  it "plays morse code" do
    Morse.play(".... . .-.. .-.. ---")
  end

  expect_raises(Morse::Error) do
    Morse.encode("🐓")
  end

  expect_raises(Morse::Error) do
    Morse.encode('🐓')
  end

  expect_raises(Morse::Error) do
    Morse.decode("🐓")
  end
end
