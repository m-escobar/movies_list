require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has many ratings' do
    model = Movie.reflect_on_association(:rating)
    expect(model.macro).to eq(:has_many)
  end
end
