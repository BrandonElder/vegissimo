require 'get_recipe'

describe RecipeErrors do
  before(:each) do
    RecipeErrors.store_api_result(401)
  end

  describe 'return_api_result' do
    it 'returns the api_result' do
      expect(RecipeErrors.return_recipe_error).to eq(401)
    end
  end

  describe 'self.api_limit' do
    it 'returns true for a 401 error' do
      expect(RecipeErrors.api_limit?).to eq(true)
    end
  end
end
