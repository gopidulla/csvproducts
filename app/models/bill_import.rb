
class BillImport
  include ActiveModel::Model
  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |section, value| send("#{section}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_bills.map(&:valid?).all?
      imported_bills.each(&:save!)
      true
    else
      imported_bills.each_with_index do |bill, index|
        bill.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_bills
    @imported_bills ||= load_imported_bills
  end

  def load_imported_bills
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      bill = Bill.find_by(id: row["id"]) || Bill.new
      bill.attributes = row.to_hash
      bill
    end    
  end

end
