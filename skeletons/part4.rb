class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def healthy?
    return @calories > 200
  end
  
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super( name, calories )
    @flavor = flavor
  end
  
  def delicious?
    if @flavor == "black licorice"
      return false
    else
      return true
    end
  end
end
