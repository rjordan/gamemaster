class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :max_players, :description, :public
  has_one :system
  has_one :user, key: 'owner', attributes: [:nickname]
end
