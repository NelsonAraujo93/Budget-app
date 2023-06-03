require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.new(name: 'Nelson', email: 'nels@nels.com', password: 'shinra') }
  subject do
    Category.new(author_id: user.id, icon: 'https://picsum.photos/200/300', name: 'Category 1')
  end

  before do
    user.save
    subject.save
  end

  it 'name should be present, expected false' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present, expected true' do
    expect(subject).to be_valid
  end

  it 'icon should be present, expected false' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present, expected true' do
    expect(subject).to be_valid
  end
end
