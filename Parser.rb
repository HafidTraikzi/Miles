require "minitest/autorun"

class Parser < Minitest::Test

  def test_empty_return_nil
    assert_equal(nil, parse(""))
  end
  
  def test_word_return_0_17
    assert_equal(0.17, parse("a"))
  end
  
  def test_word_return_0_34
    assert_equal(0.34, parse("aa"))
  end
  
  def test_word_return_0_51
    assert_equal(0.51, parse("aab"))
  end
  
  def test_word_return_0_85
    assert_equal(0.85, parse("aab a"))
  end
  
  def test_word_return_1_02
    assert_equal(1.02, parse("aab a4"))
  end

end

def savefile(content)
  file = File.open("miles.txt", "w")
  file.write(content)
  file.close
end

def parse(line)
  return nil if line.empty?
  converter = (0.17 * line.length).round(2)
end

def parse_by_file(filename)
  file = File.open(filename, "r")
  result = parse(file.read)
  file.close
  result
end

savefile(parse_by_file(ARGV[0]))
