require 'rails_helper'

feature 'User view a list of all recipes' do
  scenario 'Successffuly' do
    recipe = create(:recipe)
    recipe2 = create(:recipe, name: 'Picadinho de Carne',
                              cuisine: 'Brasileira')
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
    expect(page).to have_content(recipe.cuisine)
    expect(page).to have_content(recipe.food_type)
    expect(page).to have_content(recipe.serves)
    expect(page).to have_content(recipe.cooking_time)
    expect(page).to have_content(recipe.difficulty)
    expect(page).to have_content(recipe.ingredients)
    expect(page).to have_content(recipe.directions)

    click_on 'Voltar'

    expect(page).to have_content recipe.name
  end
end
