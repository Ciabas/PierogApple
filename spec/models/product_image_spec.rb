require "rails_helper"
require "paperclip/matchers"


RSpec.describe ProductImage, :type => :model do
  it { should belong_to(:product) }
  it { should have_attached_file(:photo) }
  it { should validate_attachment_presence(:photo) }
  it { should validate_attachment_size(:photo).less_than(5.megabytes) }
  it { should validate_attachment_content_type(:photo)
                              .allowing('image/jpeg', 'image/jpg')
                              .rejecting('image/png', 'image/gif', 'text/plain', 'text/xml') }

end