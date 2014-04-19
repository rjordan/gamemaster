require 'spec_helper'

describe Campaign do
  #The value of these tests is questionable
  it { expect(subject).to have_db_column(:name).of_type(:string).with_options(null: false) }
  it { expect(subject).to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  it { expect(subject).to have_db_column(:system_id).of_type(:integer).with_options(null: false) }
  it { expect(subject).to have_db_column(:max_players).of_type(:integer).with_options(null: false) }
  it { expect(subject).to have_db_column(:public).of_type(:boolean) }
  it { expect(subject).to have_db_column(:created_at).of_type(:datetime) }
  it { expect(subject).to have_db_column(:updated_at).of_type(:datetime) }
  it { expect(subject).to have_db_column(:version).of_type(:integer) }

  #Associations
  it { expect(subject).to belong_to :user }
  it { expect(subject).to belong_to :system }
  it { expect(subject).to have_one(:private_forum).dependent(:destroy) }
  it { expect(subject).to have_one(:public_forum).dependent(:destroy) }
  it { expect(subject).to have_many :stories }
  it { expect(subject).to have_many :player_characters }
  it { expect(subject).to have_many :nonplayer_characters }
  it { expect(subject).to have_many :players }
  it { expect(subject).to have_many :invites }
  it { expect(subject).to have_many :resources }

  #Validations
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :user_id }
  it { expect(subject).to validate_presence_of :system_id }
  it { expect(subject).to validate_presence_of :max_players }
  it { expect(subject).to validate_numericality_of :max_players }

  context 'a new instance' do
    before do
      @campaign = Campaign.new
    end
    describe 'public forum' do
      it { expect(@campaign.public_forum).to be_instance_of(Forum) }
    end
    describe 'private forum' do
      it { expect(@campaign.private_forum).to be_instance_of(Forum) }
    end
  end

  #BDD

  context 'a user is running' do
    before do
      @user = create(:user)
      @campaign = create(:campaign, user: @user)
    end
    describe '#game_master?' do
      it { expect(@campaign.game_master?(@user)).to be_true }
    end
    describe '#player?' do
      it { expect(@campaign.player?(@user)).to be_false }
    end
  end

  context 'a user is playing' do
    before do
      @user = create(:user)
      @character = create(:character, user: @user)
      @campaign = create(:campaign, player_characters: [@character])
    end
    describe '#game_master?' do
      it { expect(@campaign.game_master?(@user)).to be_false }
    end
    describe '#player?' do
      it { expect(@campaign.player?(@user)).to be_true }
    end
  end


  #TDD

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
