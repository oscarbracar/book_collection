require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:all) do
    Book.destroy_all
    Rails.application.load_seed
  end

  it "has 5 seeded books" do
    expect(Book.count).to eq(5)
  end

  it "has Harry Potter book in development/test seeds" do
    expect(Book.find_by(title: "Harry Potter and the Sorcerer's Stone")).to be_present
  end

  it "has The Hunger Games book in development/test seeds" do
    expect(Book.find_by(title: "The Hunger Games")).to be_present
  end
end
