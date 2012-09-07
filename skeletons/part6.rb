class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0, :yen => 0.013, :yens => 0.013, :euro => 1.292, :euros => 1.292, :rupee => 0.019, :rupees => 0.019, :dollar => 1.0, :dollars => 1.0 }
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in( currency )
    if @@currencies.has_key?( currency )
      return self / @@currencies[ currency ]
    end
      
  end
end

class String
  # YOUR CODE HERE
  def palindrome?
    wordsOnly = self.downcase.gsub( /\W/, "" )
    firstHalf = wordsOnly[ 0, ( wordsOnly.size / 2 )  ]
    not wordsOnly.reverse[ 0, ( wordsOnly.size / 2 )  ].match( firstHalf ).nil?
  end
end

module Enumerable
  def palindrome?
    rArr = []
    self.reverse_each do | element |
      rArr << element
    end
    arr = []
    self.each do | element |
      arr << element
    end
    return rArr == arr
  end
end

