require 'spec_helper'

describe Campaign do
  #The value of these tests is questionable
  it { expect(subject).to have_db_column(:name).of_type(:string).with_options(null: false) }
  it { should have_db_column :user_id }
  it { should have_db_column :system_id }
  it { should have_db_column :max_players }
  it { should have_db_column :public }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }
  it { should have_db_column :version }

  #Associations
  it { should belong_to :user }
  it { should belong_to :system }
  it { should have_one(:private_forum).dependent(:destroy) }
  it { should have_one(:public_forum).dependent(:destroy) }
  it { should have_many :stories }
  it { should have_many :players }
  it { should have_many :player_characters }
  it { should have_many :nonplayer_characters }
  it { should have_many :resources }

  #Validations
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :system_id }
  it { should validate_presence_of :max_players }
  it { should validate_numericality_of :max_players }

  describe 'a new instance' do
    before do
      @campaign = Campaign.new
    end
    it { expect(@campaign.public_forum).to be_instance_of(Forum) }
    it { expect(@campaign.private_forum).to be_instance_of(Forum) }
  end

  describe '#game_master?' do
    context 'when false' do
      before do
        @user = create(:user)
        @campaign = create(:campaign)
      end
      it { expect(@campaign.game_master?(@user)).to be_false }
    end
    context 'when true' do
      before do
        @user = create(:user)
        @campaign = create(:campaign, user: @user)
      end
      it { expect(@campaign.game_master?(@user)).to be_true }
    end
  end

  describe '#player?' do
    context 'when false' do
      before do
        @user = create(:user)
        @character = create(:character, user: @user)
        @campaign = create(:campaign, players: [])
      end
      it { expect(@campaign.player?(@user)).to be_false }
    end
    context 'when true' do
      before do
        @user = create(:user)
        @character = create(:character, user: @user)
        @campaign = create(:campaign, player_characters: [@character])
      end
      it { expect(@campaign.player?(@user)).to be_true }
    end
  end
end
