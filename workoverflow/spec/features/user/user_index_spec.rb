require 'spec_helper'

describe "User browsing" do
  context "on homepage" do
    it "sees a list of all the projects" do
      pending
    end

    it "has a login link" do
      pending
    end

    it "has a register link" do
      pending
    end

    it "has a sort feature" do
      pending
    end

    it "has a sweet header" do
      visit root_path
      expect(page).to have_content("Register")
    end

  end
end
