class Patient < ActiveRecord::Base
  # to just change the status and not delete the record
  # from the database
  #
  def self.find_available(id)
    find_by!(id: id, available: true)
  end

  def archive
    self.available = false
    self.save
  end
end
