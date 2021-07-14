gem 'activerecord', '=4.2.10'

require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'todos.sqlite3')

class Todos < ActiveRecord::Base

    field :name, as: :string
    field :place, as: :string
    field :priority, as: :boolean
    field :note, as: :text
end

Todos.auto_upgrade!

at_exit do
    ActiveRecord::Base.connection.close
end