require 'rails_helper'

RSpec.describe Age, type: :model do
  it 'has one user' do
    model = Age.reflect_on_association(:user)
    expect(model.macro).to eq(:has_one)
  end
end
