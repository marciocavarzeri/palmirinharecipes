require 'rails_helper'

feature 'User create a new recipe' do
  scenario 'successfully' do
    visit root_path

    cuisine = create(:cuisine, name: 'Portuguesa')
    food_type = create(:food_type, name: 'Entrada')

    click_on 'Cadastrar Receita'

    expect(page).to have_css('h1', text: 'Cadastrar uma receita')

    recipe = build(:recipe,
                   name: 'Bolinho de bacalhau',
                   cuisine: cuisine,
                   food_type: food_type,
                   serves: 6,
                   cooking_time: 45,
                   difficulty: 'Médio',
                   ingredients: '500 gramas de bacalhau; 500 gramas de batata;
                                1 ovo; Salsa e cebolinha;
                                2 colheres de sopa de farinha;
                                5 colheres de azeite; Sal',
                   directions: 'Dessalgar o bacalhau, cozinhá-lo e desfiar,
                               reserve. Cozinhe as batatas e amasse-as,
                               faça um purê, espere esfriar.
                               Em seguida misture o purê com o bacalhau
                               desfiado, acrescente os outros ingredientes.
                               Faça bolinhas e frite-as em óleo bem quente.')

    fill_in 'Nome da receita', with: recipe.name
    select cuisine.name, from: 'Cozinha (cozinhas)'
    select food_type.name, from: 'Tipo de comida'
    fill_in 'Quantas pessoas serve', with: recipe.serves
    fill_in 'Tempo de preparo', with: "#{recipe.cooking_time} minutos"
    select recipe.difficulty, from: 'Nível de dificuldade'
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Passo a passo', with: recipe.directions
    attach_file('Selecione uma foto', "#{Rails.root}/spec/fixtures/bolinho.png")

    click_on 'Criar Receita'

    within('section') do
      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.cuisine.name)
      expect(page).to have_content(recipe.food_type.name)
      expect(page).to have_content(recipe.serves)
      expect(page).to have_content(recipe.cooking_time)
      expect(page).to have_content(recipe.difficulty)
      expect(page).to have_content(recipe.ingredients)
      expect(page).to have_content(recipe.directions)
      expect(page).to have_xpath("//img[contains(@src,'bolinho.png')]")
    end
  end

  scenario 'without required fields' do
    visit root_path

    click_on 'Cadastrar Receita'

    click_on 'Criar Receita'

    expect(page).to have_content('Não foi possível criar uma receita')
  end
end
