require 'test_helper'

class InventoryTest < ActiveSupport::TestCase
  test 'inventories exist' do
    p = inventories :player
    s = inventories :supplier
    assert p.class.to_s == 'Inventory'
    assert s.class.to_s == 'Inventory'
  end

  test 'inventory sizes are correct' do
    p = inventories :player
    s = inventories :supplier
    assert p.size == 24
    assert s.size == 96
  end

  test 'empty by default' do
    p = inventories :player
    s = inventories :supplier

    assert p.number_of_items == 0
    assert p.space == 24

    assert s.number_of_items == 0
    assert s.space == 96
  end

  # test 'add one item' do
  # end

  # test 'remove one item' do
  # end

  # test 'inventory full' do
  # end

  # test 'remove too many items' do
  # end
end
