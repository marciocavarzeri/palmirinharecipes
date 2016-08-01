require 'rails_helper'

feature 'Admin create a food type' do
  scenario 'sucessfully' do
    login_as_admin
    visit root_path

    click_on 'Cadastrar Tipo'

    expect(page).to have_css('h1', text: 'Cadastrar um tipo de comida')

    food_type = build(:food_type, name: 'Prato principal')

    fill_in 'Tipo de comida', with: food_type.name

    click_on 'Criar Tipo'

    expect(page).to have_content(food_type.name)
  end

  scenario 'without required fields' do
    login_as_admin
    visit root_path

    click_on 'Cadastrar Tipo'

    click_on 'Criar Tipo'

    expect(page).to have_content('Não foi possível criar um tipo de comida')
  end
end
