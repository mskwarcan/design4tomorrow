class InquiryType < ActiveRecord::Migration
  def self.up
    add_column :inquiries, :inquiry_type, :string
  end

  def self.down
    remove_column :inquiries, :inquiry_type
  end
end
