require File.expand_path(File.join(File.dirname(__FILE__), '../../../test_functional_helper'))
require 'streamlined/helpers/link_helper'

describe "Streamlined::Helpers::TableHelperFunctional" do
  fixtures :people
  def setup
    stock_controller_and_view
  end

  it "no buttons" do
    @view.send(:model_ui).table_row_buttons false
    assert_equal "", @view.streamlined_table_row_button_header
    assert_equal "", @view.streamlined_table_row_buttons(people(:justin))
  end
  
  it "buttons" do
    @view.send(:model_ui).table_row_buttons true
    assert_equal "<th>&nbsp;</th>", @view.streamlined_table_row_button_header
    item = people(:justin)
    assert_equal "<td>#{@view.link_to_show_model(item)} #{@view.link_to_edit_model(item)}#{@view.quick_delete_button(item)}</td>", @view.streamlined_table_row_buttons(item)
  end
  
  it "no quick delete button" do
    @view.send(:model_ui).table_row_buttons true    
    @view.send(:model_ui).quick_delete_button false
    assert_equal "<th>&nbsp;</th>", @view.streamlined_table_row_button_header
    item = people(:justin)
    assert_equal "<td>#{@view.link_to_show_model(item)} #{@view.link_to_edit_model(item)}</td>", @view.streamlined_table_row_buttons(item)
  end
  
  it "no quick edit button" do
    @view.send(:model_ui).table_row_buttons true    
    @view.send(:model_ui).quick_edit_button false
    assert_equal "<th>&nbsp;</th>", @view.streamlined_table_row_button_header
    item = people(:justin)
    assert_equal "<td>#{@view.link_to_show_model(item)}</td>", @view.streamlined_table_row_buttons(item)
  end
  
end