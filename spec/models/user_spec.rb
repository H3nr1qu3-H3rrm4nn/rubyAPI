require 'rails_helper'

RSpec.describe User, type: :model do
  # PRIMEIRA PARTE
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  # SEGUNDA PARTE
  # describe 'associations' do
  #   it { should have_many(:categories) }
  #   it { should have_many(:transactions) }
  # end
end
