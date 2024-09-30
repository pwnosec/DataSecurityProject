require 'rspec'
require_relative '../src/authentication/auth_service'

RSpec.describe AuthService do
  let(:auth_service) { AuthService.new }

  it 'registers a user' do
    response = auth_service.register('user1', 'password123')
    expect(response).to eq('User user1 registered successfully.')
  end

  it 'logs in a user' do
    auth_service.register('user1', 'password123')
    response = auth_service.login('user1', 'password123')
    expect(response).to eq('Login successful.')
  end

  it 'fails login with invalid password' do
    auth_service.register('user1', 'password123')
    response = auth_service.login('user1', 'wrongpassword')
    expect(response).to eq('Invalid password.')
  end
end
