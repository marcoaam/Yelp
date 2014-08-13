require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsHelper, :type => :helper do

	it 'returns N/A if there is no rating' do
		expect(helper.star_rating('N/A')).to eq 'N/A'
	end

  it 'returns five full stars if the rating is 5 or 5.0' do
  	expect(helper.star_rating(5.0)).to eq '★★★★★'
  end

  it 'returns four full stars and one empty if the rating is 4 or 4.0' do
  	expect(helper.star_rating(4.0)).to eq '★★★★☆'
  end
end
