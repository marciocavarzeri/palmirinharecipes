require 'rails_helper'

feature 'User edit recipes' do
  scenario 'successfully' do
    user = login_as_user
    recipe = create(:recipe, name: 'Bolo de guaraná', user: user)

    visit edit_recipe_path(recipe)

    recipe_edit = build(:recipe,
                        name: 'Bolinho de dolly',
                        serves: 16,
                        cooking_time: 12,
                        difficulty: 'Difícil')

    fill_in 'Nome da receita', with: recipe_edit.name
    fill_in 'Quantas pessoas serve', with: recipe_edit.serves
    fill_in 'Tempo de preparo', with: "#{recipe_edit.cooking_time} minutos"
    select recipe_edit.difficulty, from: 'Nível de dificuldade'

    click_on 'Atualizar'

    expect(page).to have_content(recipe_edit.name)
    expect(page).to have_content(recipe.cuisine.name)
    expect(page).to have_content(recipe.food_type.name)
    expect(page).to have_content(recipe_edit.serves)
    expect(page).to have_content(recipe_edit.cooking_time)
    expect(page).to have_content(recipe_edit.difficulty)
    expect(page).to have_content(recipe.ingredients)
    expect(page).to have_content(recipe.directions)
    expect(page).to have_xpath("//img[contains(@src,'bolinho.png')]")
  end

  scenario 'with invalid data' do
    user = login_as_user
    recipe = create(:recipe, name: 'Bolo de guaraná', user: user)

    visit edit_recipe_path(recipe)

    fill_in 'Nome da receita',        with: ''
    select '',                        from: 'Cozinha (cozinhas)'
    select '',                        from: 'Tipo de comida'
    fill_in 'Quantas pessoas serve',  with: ''
    fill_in 'Tempo de preparo',       with: ''
    select '',                        from: 'Nível de dificuldade'
    fill_in 'Ingredientes',           with: ''
    fill_in 'Passo a passo',          with: ''

    click_on 'Atualizar'
    expect(page).to have_content('Não foi possível atualizar essa receita')
  end
end
