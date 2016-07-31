feature 'Admin logout' do
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

    within('div.header-top') do
      click_on 'Sair'
    end

    expect(page).to_not have_content("Olá, #{admin.email}")
    expect(page).to have_content('Saiu com sucesso')

    within('nav') do
      expect(page).to have_content('Cadastrar Receita')
    end
  end
end
