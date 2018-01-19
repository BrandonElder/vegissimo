class RecipeDto
  attr_accessor :calories, :e_id, :image, :ingredient_list, :label, :url, :yield

  def initialize(json_object)
    self.calories = get_default(json_object, 'calories')
    self.image = get_default(json_object, 'image')
    self.ingredient_list = get_default(json_object, 'ingredientLines')
    self.label = get_default(json_object, 'label')
    self.e_id = get_default(json_object, 'uri')
                .match(/_[[:alnum:]]*(\Z || \&)/).to_s[1..-1]
    self.url = get_default(json_object, 'url')
    self.yield = get_default(json_object, 'yield')
  end

  def get_default(obj, key, default = nil)
    obj.include?(key) ? obj[key] : default
  end
  
end