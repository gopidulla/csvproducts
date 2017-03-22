


require 'csv'

class Bill < ApplicationRecord
  validates_presence_of :dvno
  
  def self.to_csv(options = {})
    desired_columns = ["id", "section", "year", "month", "dvno", "typebill", "compactor", "rock", "shelf"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |bill|
        csv << bill.attributes.values_at(*desired_columns)
      end
    end
  end
  
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      bill = find_by(id: row["id"]) || new
      bill.attributes = row.to_hash
      bill.save!
    end
  end  
end