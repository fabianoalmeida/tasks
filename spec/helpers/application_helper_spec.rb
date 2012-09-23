require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the FavoriteListHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  it "should render navigation links" do
    output = helper.navigation_links
    output.should == "<ul class=\"nav\"><li><a href=\"/lists\">My Lists</a></li>\n<li><a href=\"/public_lists\">Public Lists</a></li>\n<li><a href=\"/favorite_lists\">Favorite Lists</a></li></ul>"
  end
end