require "spec_helper"

describe "JobInquiries front-end routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to index" do
    expect( :get => "/job_inquiries" ).to route_to(
      :controller => "refinery/job_inquiries/job_inquiries",
      :action => "index",
      :locale => :en
    )
  end

  it "can route to new" do
    expect( :get => "/job_inquiries/new" ).to route_to(
      :controller => "refinery/job_inquiries/job_inquiries",
      :action => "new",
      :locale => :en
    )
  end

  it "can route to create" do
    expect( :post => "/job_inquiries" ).to route_to(
      :controller => "refinery/job_inquiries/job_inquiries",
      :action => "create",
      :locale => :en
    )
  end

  it "routes to thank_you" do
    expect( :get => "/job_inquiries/thank_you" ).to route_to(
      :controller => "refinery/job_inquiries/job_inquiries",
      :action => "thank_you",
      :locale => :en
    )
  end

  it "does not route to show" do
    expect( :get => "/job_inquiries/1" ).not_to route_to(
      :controller => "refinery/job_inquiries/job_inquiries",
      :action => "show",
      :locale => :en
    )
  end

  it "does not route to edit" do
    expect( :get => "/job_inquiries/1/edit" ).not_to route_to(
      :controller => "refinery/job_inquiries/job_inquiries",
      :action => "edit",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/job_inquiries/1" ).not_to be_routable
  end

  it "does not route to delete" do
    expect( :delete => "/job_inquiries/1" ).not_to be_routable
  end

end
