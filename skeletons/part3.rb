def combine_anagrams(words)
  # YOUR CODE HERE
  anagrams = []
  sortedWords = {}
  words.each do | word |
    canonicalWord = word.downcase.scan(/\w/).sort
    if sortedWords.has_key?( canonicalWord )
      sortedWords[ canonicalWord ] << word
    else
      sortedWords[ canonicalWord ] = [ word ]
    end
  end
  sortedWords.values.each do | group |
      anagrams << group
  end
  return anagrams
end

