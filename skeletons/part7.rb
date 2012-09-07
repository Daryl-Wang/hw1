class CartesianProduct
  include Enumerable
  # YOUR CODE HERE
  def initialize( setA, setB )
    @setA = setA
    @setB = setB
  end

  def each
    @setA.each do | a |
      @setB.each do | b |
        yield [ a, b ]
      end
    end
  end
end


