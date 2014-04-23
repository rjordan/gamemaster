attributes :id, :name, :max_players, :description, :public
child :user => 'owner' do
  attributes :id, :nickname
end
child :system do
  attributes :id, :name
end
