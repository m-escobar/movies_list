require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'check relations' do
    it 'belongs to movie' do
      model = Rating.reflect_on_association(:movie)
      expect(model.macro).to eq(:belongs_to)
    end

    it 'belongs to user' do
      model = Rating.reflect_on_association(:user)
      expect(model.macro).to eq(:belongs_to)
    end
  end
end
