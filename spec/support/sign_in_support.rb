module SignInSupport
  def sign_in(user)

    visit new_user_session_path
  
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    
    find('button[name="button"]').click
    
    expect(current_path).to eq(root_path)
  end
end
