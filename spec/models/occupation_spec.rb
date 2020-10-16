require 'rails_helper'

RSpec.describe Occupation, type: :model do
  it 'has one user' do
    model = Occupation.reflect_on_association(:user)
    expect(model.macro).to eq(:has_one)
  end
end
