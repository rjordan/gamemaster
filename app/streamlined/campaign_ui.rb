Streamlined.ui_for(Campaign) do
  quick_delete_button false
    
  user_columns :name,
                              :system, {:edit_in_list => false},
                              :user, { :create_only=>true, :quick_add=>false }
                              
  list_columns :name, :system, :user
    
  end