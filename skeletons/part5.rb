class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{ def #{attr_name}=( attr_name )
                     @#{attr_name} = attr_name
                     if @#{attr_name}_history.nil?
                       @#{attr_name}_history = [ nil, attr_name ]
                     else
                       @#{attr_name}_history << attr_name
                     end
                   end
      
                   }
    
  end
end

class Foo
 attr_accessor_with_history :bar
end
f = Foo.new
f.bar = 1
f.bar = 2
puts f.bar_history # => if your code works, should be [nil,1,2]
f = Foo.new
f.bar = 4
puts f.bar_history # => should just return [nil,4], rather than [nil,1,2,4]

class SomeOtherClass
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

s = SomeOtherClass.new
s.foo = 3
s.foo = 4
s.bar = 30
s.bar = 40
puts "s.foo_history should be [ nil, 3, 4 ]"
puts s.foo_history
puts "s.bar_history should be [ nil, 30, 40 ]"
puts s.bar_history
