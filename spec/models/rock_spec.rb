require 'rails_helper'

RSpec.describe Rock, type: :model do
  it 'should not be valid without a name' do
    rock = Rock.create(
      name:nil,
      age:'10,000', 
      enjoys: 'boxing and training sequences',
      image: 'placeholder',
    )
    expect(rock.errors[:name]).to_not be_empty
  end

  it 'should not be valid without an age' do
    rock = Rock.create(
      name: 'Rocky Balboa',
      age: nil,
      enjoys: 'boxing and training sequences',
      image: 'placeholder',
    )
    expect(rock.errors[:age]).to_not be_empty
  end

  it 'should not be valid without a enjoys' do
    rock = Rock.create(
      name: 'Rocky Balboa',
      age: '10,000',
      enjoys: nil,
      image: 'placeholder',
    )
    expect(rock.errors[:enjoys]).to_not be_empty
  end

  it 'should not be valid without an image' do
    rock = Rock.create(
      name: 'Rocky Balboa',
      age: '10,000',
      enjoys: 'boxing and training sequences',
      image: nil,
    )
    expect(rock.errors[:image]).to_not be_empty
  end

  it 'should not be valid with a enjoys that has at least 10 characters' do
    cat = Cat.create(
      name: 'Rocky Balboa',
      age: "10,000",
      enjoys: 'boxing ',
      image: 'placeholder',
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end


end
