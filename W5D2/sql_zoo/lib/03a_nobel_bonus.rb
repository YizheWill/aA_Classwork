# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative "./sqlzoo.rb"

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  select p.yr from nobels c where subject = 'Physics' left join (select yr from nobels where subject = 'Chemistry') as c where c.yr is null
  SQL
end
