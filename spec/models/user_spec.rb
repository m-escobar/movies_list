require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'check relations' do
    it 'belongs to age' do
      model = User.reflect_on_association(:age)
      expect(model.macro).to eq(:belongs_to)
    end

    it 'belongs to occupation' do
      model = User.reflect_on_association(:occupation)
      expect(model.macro).to eq(:belongs_to)
    end

    it 'has many ratings' do
      model = User.reflect_on_association(:rating)
      expect(model.macro).to eq(:has_many)
    end
  end
end
