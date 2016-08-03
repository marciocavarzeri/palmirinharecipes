module LoginMacro
  # config.include Warden::Test::Helpers
  # config.before :suite do
  #   Warden.test_mode!
  # end

  def login_as_admin
    admin = create(:admin, email: 'admin@cavarzeri.com.br',
                           password: '12345678')
    visit new_admin_session_path

    within('section') do
      fill_in 'Email',  with: admin.email
      fill_in 'Senha',  with: admin.password
      click_on 'Entrar'
    end
  end

  def login_as_user
    user = create(:user, email: 'user@cavarzeri.com.br',
                         password: '12345678')
    visit new_user_session_path

    within('section') do
      fill_in 'Email',  with: user.email
      fill_in 'Senha',  with: user.password
      click_on 'Entrar'
    end

    user
  end
end
