require "spec_helper"

describe Invitations do
  describe "invite" do
    let(:mail) { Invitations.invite('me', 'my@em.ail', 'token', 'mai@il.too') }

    it "renders the headers" do
      mail.subject.should eq("my@em.ail invited you to his FamilyFeed")
      mail.to.should eq(["mai@il.too"])
      mail.from.should eq(["familyfeed@cloudients.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("nvited you into his family.")
    end
  end

end
