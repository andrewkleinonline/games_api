require 'rails_helper'

RSpec.describe Console, type: :model do
  it 'is valid with a name, release date, and manufacturer' do
    ps4 = Console.create(name: "PS4", release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), manufacturer: "Sony")
    expect(ps4).to be_valid
  end

  #will want to refactor these tests to use a specific error rather than to_not be_valid
  it 'is not valid without a name' do
    unnamed_console = Console.create(release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), manufacturer: "Sony")
    expect(unnamed_console).to_not be_valid
  end

  it 'is not valid without a date' do
    ps4_outside_of_spacetime = Console.create(name: "PS4", manufacturer: "Sony")
    expect(ps4_outside_of_spacetime).to_not be_valid
  end

  it 'is not valid without a manufacturer' do
    ps4_not_made_by_anyone = Console.create(name: "PS4", release_date: Date.strptime('2013-11-15', '%Y-%m-%d'))
    expect(ps4_not_made_by_anyone).to_not be_valid
  end
end
