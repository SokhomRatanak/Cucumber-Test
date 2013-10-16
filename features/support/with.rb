#module WithinHelpers
 # def with_scope(locator)
 #   locator ? within(*selector_for(locator)) { yield } : yield
 # end
#end

#World(WithinHelpers)
module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)
