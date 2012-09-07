def palindrome?(str)
  wordsOnly = str.downcase.gsub( /\W/, "" )
  firstHalf = wordsOnly[ 0, ( wordsOnly.size / 2 )  ]
  not wordsOnly.reverse[ 0, ( wordsOnly.size / 2 )  ].match( firstHalf ).nil?
end

def count_words(str)
  counts = {}
  str.downcase.scan( /\b(\w+)\b/ ) do | word |
    word = word[0]
    if counts[ word ]
      counts[ word ] += 1
    else
      counts[ word ] = 1
    end
  end
  return counts
end

