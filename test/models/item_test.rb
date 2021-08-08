require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test 'will not save without name' do
    item = Item.new
    assert_not item.save
  end

  test 'will save with name' do
    item = Item.new(name: 'Lot 1')
    assert item.save
  end

  test 'will not save if duplicate name' do
    lot_a = items(:lot_a)
    item = Item.new(name: lot_a.name)
    assert_not item.save
  end
end
