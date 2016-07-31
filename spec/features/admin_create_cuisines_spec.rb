require 'rails_helper'

feature 'Admin create a cuisine' do
  scenario 'sucessfully' do
    login_as_admin
    visit root_path

    click_on 'Cadastrar Cozinha'

    expect(page).to have_css('h1', text: 'Cadastrar uma cozinha')

    cuisine = build(:cuisine, name: 'Japonesa')

    fill_in 'Nome da cozinha', with: cuisine.name

    click_on 'Criar Cozinha'

    expect(page).to have_content(cuisine.name)
  end

  scenario 'without required fields' do
    login_as_admin
    visit root_path

    click_on 'Cadastrar Cozinha'

    click_on 'Criar Cozinha'

    expect(page).to have_content('Não foi possível criar uma cozinha')
  end
end
