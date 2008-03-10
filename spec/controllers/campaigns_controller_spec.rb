require File.dirname(__FILE__) + '/../spec_helper'

describe CampaignsController do

  #Delete this example and add some real ones
  it "should use CampaignsController" do
    controller.should be_an_instance_of(CampaignsController)
  end

  it "should create a new, unsaved campaign on GET to create" do
    @campaign = Campaign.new
    Campaign.should_receive(:new).and_return(@campaign)
    get 'create'
  end
end
