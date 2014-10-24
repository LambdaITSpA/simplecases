class CauseState < ActiveRecord::Base
	has_many :journal_entries
end
