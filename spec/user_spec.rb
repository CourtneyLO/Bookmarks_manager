require './app/models/user.rb'

describe User do

  subject(:user) { described_class.new }

  let!(:user) do
    User.create(email: 'test@test.com', password: '1234',
                password_confirmation: '1234')
  end

  it 'authenicates when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'whatever')).to be_nil
  end
end
