feature 'User logout' do
  scenario 'successfully' do
    user = create(:user, email: 'user@cavarzeri.com.br',
                         password: '123456')
    visit root_path

    within('div.header-top') do
      click_on 'Entrar'
    end

    within('section') do
      fill_in 'Email',  with: user.email
      fill_in 'Senha',  with: user.password

      click_on 'Entrar'
    end

    within('div.header-top') do
      click_on 'Sair'
    end

    expect(page).to_not have_content("Olá, #{user.email}")
    expect(page).to have_content('Saiu com sucesso')

    within('nav') do
      expect(page).to have_content('Receitas')
      expect(page).not_to have_content('Cadastrar Receita')
      expect(page).not_to have_content('Cadastrar Cozinha')
      expect(page).not_to have_content('Cadastrar Tipo')
    end
  end
end
