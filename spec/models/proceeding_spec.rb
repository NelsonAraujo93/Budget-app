require 'rails_helper'

RSpec.describe Proceeding, type: :model do
  let(:user) { User.new(name: 'Nelson', email: 'nels@nels.com', password: 'shinra') }
  let(:category) do
    Category.new(author_id: user.id, icon: 'https://picsum.photos/200/300', name: 'Recipe 1')
  end
  subject { Proceeding.new(name:'Car stuff', author_id: user.id, amount: 15, categories: []) }
  before do
    user.save
    category.save
    subject.categories << category
    subject.save
  end

  it 'Amount should be present, expected false' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Amount should be greater than 0, expected false' do
    subject.amount = 0
    expect(subject).to_not be_valid
  end

  it 'Amount should be present, expected true' do
    expect(subject).to be_valid
  end
end
