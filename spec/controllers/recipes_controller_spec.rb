
require 'rails_helper'
require 'tasks/get_recipe'
require 'tasks/recipe_dto'
file = File.read('spec/spicy_eggplant.json')
data_hash = JSON.parse(file)[0]

RSpec.describe RecipesController, type: :controller do
  describe 'show' do
    subject(:eggplant) do
      Recipe.create(name: 'Spicy Eggplant', edamam_id:
      'http://www.edamam.com/ontologies/edamam.owl#recipe_a53ef6c8495adcb9f2859b1e5d99e9ba')
    end

    it 'returns a success status if the recipe is found' do
      allow(RecipesHelper).to receive(:saved_recipe_from_api)
        .with(eggplant).and_return(data_hash)
      get :show, params: { id: eggplant.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns a 404 error if the recipe is not found' do
      get :show, params: { id: 'Blue' }
      expect(response).to have_http_status(:not_found)
    end
  end
end