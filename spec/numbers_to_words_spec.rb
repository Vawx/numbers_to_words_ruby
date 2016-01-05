require('rspec')
require('numbers_to_words')

describe("String#get_by_tens") do
  it ('converts a numerical value between 20 and 99 to text') do
    expect(96.numbers_to_words).to(eq('ninety six'))
  end
end

describe("String#get_by_hundreds") do
  it('converts a numerical value between 100 and 999 to text') do
    expect(534.numbers_to_words).to(eq("five hundred and thirty four"))
  end
end

describe("String#get_by_thousands") do
  it('converts a numerical value between 1000 and 999999 to text') do
    expect(234589.numbers_to_words).to(eq("two hundred and thirty four thousand five hundred and eighty nine"))
  end
end

describe("String#get_by_millions") do
  it('converts a numerical value between 1000000 and 999999999 to text') do
    expect(234543698.numbers_to_words).to(eq("two hundred and thirty four million five hundred and fourty three thousand six hundred and ninety eight"))
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
  it ('converts a numerical value above one hundred into text as the value') do
    expect(739.numbers_to_words).to(eq('seven hundred and thirty nine'))
  end
  it ('converts a numerical value above 1000 into text as the value') do
    expect(45322.numbers_to_words).to(eq('fourty five thousand three hundred and twenty two'))
  end
end
