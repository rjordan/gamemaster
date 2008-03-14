module CampaignAdditions
  def user_name
    user.email
  end
end
Campaign.class_eval {include CampaignAdditions}

Streamlined.ui_for(Campaign) do
  quick_delete_button false
  quick_edit_button false
    
  list_columns :name, {:link_to=>{:action=>:show}} ,
                           :system, {:edit_in_list=>false},
                           :user_name, {:read_only=>true, :human_name=>"Game Master"}
  
  edit_columns :name, 
                            :system, 
                           :stories, { :quick_add=>true, :popup=>true }
  
  show_columns :name, 
                               :system,
                               :created_at,
                               :stories, { :quick_add=>true, :popup=>true }
  
  end