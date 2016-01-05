require('rspec')
require('numbers_to_words')

describe("String#by_tens") do
  it ('converts a numerical value between 20 and 99') do
    expect(96.numbers_to_words).to(eq('ninety six'))
  end
end

describe("String#by_hundreds") do
  it('converts a numerical value between 100 and 999') do
    expect(534.numbers_to_words).to(eq("five hundred and thirty four"))
  end
end

describe("String#numbers_to_words") do
  it ('converts a numerical value into text read as the value') do
    expect(1.numbers_to_words).to(eq('one'))
  end
  it ('converts a numerical value above twenty into text as the value') do
    expect(20.numbers_to_words).to(eq('twenty'))
  end
  it ('converts a numerical value above twenty into text as the value') do
    expect(99.numbers_to_words).to(eq('ninety nine'))
  end
  it ('converts a numerical value above twenty into text as the value') do
    expect(739.numbers_to_words).to(eq('seven hundred and thirty nine'))
  end
end
