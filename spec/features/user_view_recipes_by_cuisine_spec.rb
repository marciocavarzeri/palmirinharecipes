require 'rails_helper'

feature 'Visitor view recipes by cuisine' do
  scenario 'successfully' do
    user = create(:user)
    cuisine = create(:cuisine)
    food_type = create(:food_type, name: 'Sobremesa')
    another_cuisine = create(:cuisine, name: 'Italiana')
    recipe = create(:recipe, cuisine: cuisine, user: user)

    another_recipe = create(:recipe, name: 'Bolo de fubá',
                                     cuisine: another_cuisine,
                                     difficulty: 'Difícil',
                                     food_type: food_type,
                                     user: user)

    visit root_path

    within('aside') do
      expect(page).to have_link(cuisine.name)
      expect(page).to have_link(another_cuisine.name)

      click_on cuisine.name
    end

    within('section') do
      expect(page).to have_css('h3', text: 'Receita filtrada por cozinha')
      expect(page).to have_link(recipe.name)
      expect(page).to have_content(recipe.difficulty)
      expect(page).to have_content(recipe.food_type.name)
      expect(page).not_to have_link(another_recipe.name)
      expect(page).not_to have_content(another_recipe.difficulty)
      expect(page).not_to have_content(another_recipe.food_type.name)
    end
  end

  scenario 'view a friendly empty message' do
    cuisine = create(:cuisine)

    visit root_path

    within('aside') do
      click_on cuisine.name
    end

    expect(page).to have_content 'Nenhuma receita disponível'
  end
end
