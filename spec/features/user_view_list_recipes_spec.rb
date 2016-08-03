require 'rails_helper'

feature 'User view a list of all recipes' do
  scenario 'Successffuly' do
    user = create(:user)
    cuisine = create(:cuisine)
    cuisine2 = create(:cuisine, name: 'Árabe')
    food_type = create(:food_type)
    recipe = create(:recipe, cuisine: cuisine, food_type: food_type, user: user)
    recipe2 = create(:recipe, name: 'Picadinho de Carne',
                              difficulty: 'Difícil',
                              cuisine: cuisine2,
                              food_type: food_type,
                              user: user)
    visit recipes_path
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe2.name
  end

  scenario 'and visit a recipe info and go back to list' do
    recipe = create(:recipe)
    visit recipes_path

    within('section') do
      click_on recipe.name
    end

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.cuisine.name)
    expect(page).to have_content(recipe.food_type.name)
    expect(page).to have_content(recipe.serves)
    expect(page).to have_content(recipe.cooking_time)
    expect(page).to have_content(recipe.difficulty)
    expect(page).to have_content(recipe.ingredients)
    expect(page).to have_content(recipe.directions)

    click_on 'Voltar'

    expect(page).to have_content recipe.name
  end
end
