require 'rails_helper'

RSpec.describe Console, type: :model do
  it 'is valid with a name, release date, and manufacturer' do
    ps4 = Console.create(name: "PS4", release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), manufacturer: "Sony")
    expect(ps4).to be_valid
  end
end
