require 'rails_helper'

feature 'User see last twenty recipes' do
  scenario 'successfully' do
    cuisine = create(:cuisine, name: 'Italiana')
    food_type = create(:food_type, name: 'Acompanhamento')
    cuisine2 = create(:cuisine)
    food_type2 = create(:food_type)
    recipe = create(:recipe, name: 'Receita da vovó',
                             cuisine: cuisine,
                             food_type: food_type)

    recipe_list = create_list(:recipe, 20, cuisine: cuisine2,
                                           food_type: food_type2)

    visit root_path

    within('section') do
      expect(page).to have_css('h1', text: 'Lista das últimas receitas')
      expect(page).not_to have_content(recipe.name)
      expect(page).not_to have_content(recipe.cuisine.name)
      expect(page).not_to have_content(recipe.food_type.name)

      recipe_list.each do |lrecipe|
        expect(page).to have_content(lrecipe.name)
        expect(page).to have_content(lrecipe.cuisine.name)
        expect(page).to have_content(lrecipe.food_type.name)
      end
    end
  end
end
