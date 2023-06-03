require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Nelson', email: 'nels@nels.com', password: 'shinra') }

  before { subject.save }

  it 'name should be present, expected false' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be present, expected true' do
    expect(subject).to be_valid
  end

  it 'email should be present, expected false' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present, expected true' do
    expect(subject).to be_valid
  end
end