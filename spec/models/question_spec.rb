require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title: "New Question", body: "New Question Body", resolved: false)}

  describe "attributes" do
    it "should respond to body" do
      expect(question).to respond_to(:body)
    end
  end
end
