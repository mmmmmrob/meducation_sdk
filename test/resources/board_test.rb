require_relative '../test_helper'
require_relative '../resource_test'

module MeducationSDK
  class BoardTest < ResourceTest
    test_resource(Board, '/boards')

    def test_owner_calls_sdk
      board = Board.new(owner_id: 2, owner_type: "Group")
      MeducationSDK::Group.expects(:find).with(2)
      board.owner
    end

    def test_created_by_calls_sdk
      board = Board.new(created_by_id: 2)
      MeducationSDK::User.expects(:find).with(2)
      board.created_by
    end

    def test_items_calls_sdk
      board = Board.new(id: 54)
      MeducationSDK::BoardItem.expects(:where).with(board_id: board.id)
      board.items
    end
  end
end
