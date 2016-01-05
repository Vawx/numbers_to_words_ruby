class Fixnum
  to_nineteen = { 1 => "one",
                  2 => "two",
                  3 => "three",
                  4 => "four",
                  5 => "five",
                  6 => "six",
                  7 => "seven",
                  8 => "eight",
                  9 => "nine",
                  10 => "ten",
                  11 => "eleven",
                  12 => "twelve",
                  13 => "thirteen",
                  14 => "fourteen",
                  15 => "fifteen",
                  16 => "sixteen",
                  17 => "seventeen",
                  18 => "eighteen",
                  19 => "nineteen"}

  by_tens =     { 20 => "twenty",
                  30 => "thirty",
                  40 => "fourty",
                  50 => "fifty",
                  60 => "sixty",
                  70 => "seventy",
                  80 => "eighty",
                  90 => "ninety" }

  define_method(:numbers_to_words) do
    if ( self <= 19 && self >= 0 )
      return to_nineteen.fetch( self )
    elsif( self > 19 && self < 100 )
      return get_by_tens( self )
    elsif( self >= 100 && self < 1000 )
      return get_by_hundreds( self )
    elsif( self >= 1000 && self < 999999 )
      return get_by_thousands( self )
    elsif( self >= 1000000 && self < 999999999)
      return get_by_millions(self)
    elsif(self >= 1_000_000_000 && self < 999_999_999_999)
      return get_by_billions(self)
    end
  end

  define_method(:get_by_tens) do |tens|
    remaining = tens % 10
    if remaining == 0
      return by_tens.fetch(tens)
    else
      tens -= remaining
      return by_tens.fetch(tens) + " " + to_nineteen.fetch(remaining)
    end
  end

  define_method(:get_by_hundreds) do |hundreds|
    remaining = hundreds % 100
    hundreds -= remaining
    hundreds /= 100
    if remaining > 19
      return to_nineteen.fetch( hundreds ) + " hundred and " + get_by_tens( remaining )
    else
      return to_nineteen.fetch( hundreds ) + " hundred and " + to_nineteen.fetch( remaining )
    end
  end

  define_method(:get_by_thousands) do |thousands|
    remaining = thousands % 1000
    thousands -= remaining
    thousands /= 1000
    thousands_as_text = ""
    remaining_as_text = ""

    if thousands > 99
      thousands_as_text = get_by_hundreds( thousands ) + " thousand "
    elsif thousands > 19
      thousands_as_text = get_by_tens( thousands ) + " thousand "
    else
      thousands_as_text = to_nineteen.fetch( thousands ) + " thousand "
    end

    if remaining > 99
      remaining_as_text = get_by_hundreds( remaining )
    elsif remaining > 19
      remaining_as_text = get_by_tens( remaining )
    else
      remaining_as_text = to_nineteen.fetch( remaining )
    end
    return thousands_as_text + remaining_as_text
  end

  define_method(:get_by_millions) do |millions|
    remaining = millions % 1000000
    millions -= remaining
    millions /= 1000000
    millions_as_text = ""
    thousands_as_text = ""

    if millions > 99
      millions_as_text = get_by_hundreds( millions )
    elsif millions > 19
      millions_as_text = get_by_tens( millions )
    else
      millions_as_text = to_nineteen.fetch( million )
    end

    if remaining > 999
      thousands_as_text = get_by_thousands( remaining )
    elsif remaining > 99
      thousands_as_text = get_by_hundreds( remaining )
    elsif remaining > 19
      thousands_as_text = get_by_tens( remaining )
    else
      thousands_as_text = to_nineteen.fetch( remaining )
    end

    return millions_as_text + " million " + thousands_as_text
  end

  define_method(:get_by_billions) do |billions|
    remaining = billions % 1_000_000_000
    billions -= remaining
    billions /= 1_000_000_000
    billions_as_text = ""
    millions_as_text = ""

    if billions > 99
      billions_as_text = get_by_hundreds( billions )
    elsif billions > 19
      billions_as_text = get_by_tens( billions )
    else
      billions_as_text = to_nineteen.fetch( billions )
    end

    if remaining > 999999
      millions_as_text = get_by_millions (remaining)
    elsif remaining > 999
      thousands_as_text = get_by_thousands( remaining )
    elsif remaining > 99
      thousands_as_text = get_by_hundreds( remaining )
    elsif remaining > 19
      thousands_as_text = get_by_tens( remaining )
    else
      thousands_as_text = to_nineteen.fetch( remaining )
    end

    return billions_as_text + " billion " + millions_as_text
  end
end
