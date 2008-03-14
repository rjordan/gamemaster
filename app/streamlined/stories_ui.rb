Streamlined.ui_for(Story) do
  quick_delete_button false
    
  user_columns :name,
                              :campaign, {:edit_in_list => false}

  show_columns :name,
                               :campaign,
                               :public,
                               :public_description,
                               :private_description

  edit_columns :name,
                               :campaign,
                               :public, {:check_box=>true},
                               :public_description,
                               :private_description
end