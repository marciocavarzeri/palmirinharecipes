require 'rails_helper'

feature 'Admin login' do
  scenario 'successfully' do
    admin = create(:admin, email: 'admin@cavarzeri.com.br',
                           password: '123456')
    visit root_path

    within('div.header-top') do
      click_on 'Área administrativa'
    end

    within('section') do
      fill_in 'Email',  with: admin.email
      fill_in 'Senha',  with: admin.password

      click_on 'Entrar'
    end

    expect(page).to have_content("Olá, #{admin.email}")

    within('nav') do
      expect(page).to have_content('Receitas')
      expect(page).to have_content('Cadastrar Cozinha')
      expect(page).to have_content('Cadastrar Tipo')
      expect(page).not_to have_content('Cadastrar Receita')
    end
  end

  scenario 'but admin does not exist' do
    visit root_path

    within('div.header-top') do
      click_on 'Área administrativa'
    end

    within('section') do
      fill_in 'Email',  with: 'Stevie Wonder'
      fill_in 'Senha',  with: '123456'

      click_on 'Entrar'
    end

    expect(page).to have_content('E-mail ou senha inválidos')
  end
end
