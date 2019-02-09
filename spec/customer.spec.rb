require 'rspec'
require_relative '../customer'

RSpec.describe Customer do 
  let(:alan) { described_class.new }
  let(:ben) { described_class.new  }
  let(:clarke) { described_class.new  }

  describe "#recommends" do 
    context "when invitee has not been recommended" do
      it "assigns the invitee to the inviter" do
        alan.recommends ben  
        expect(ben.inviter).to be(alan)
      end
    end

    context "when invitee has already been recommended" do
      it "does not assign the invitee to the inviter" do
        alan.recommends ben  
        clarke.recommends ben
        expect(ben.inviter).not_to be(clarke)
      end
    end
  end  

  describe "#accepts" do
    context "when inviter does not have an inviter" do
      before(:each) do
        alan.recommends ben  
        ben.accepts
      end

      it "increases the point of the inviter" do 
        expect(alan.point).to be > 0
      end

      it "increases the level of the inviter" do
        expect(alan.level).to be 1
      end
    end

    context "when inviter has an inviter" do
      before(:each) do
        alan.recommends ben  
        ben.accepts
        ben.recommends clarke 
        clarke.accepts
      end
    
      it "increases the point of the inviter and the ancestors" do
        expect(ben.point).to be > 0
        expect(alan.point).to be > 1
      end

      it "increases the level of the inviter and the ancestors" do 
        expect(ben.level).to be 1
        expect(alan.level).to be 2
      end
    end
  end
end