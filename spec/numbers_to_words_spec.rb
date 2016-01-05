require('rspec')
require('numbers_to_words')

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
end
