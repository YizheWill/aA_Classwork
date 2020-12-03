# Load the Rails application.
require_relative 'application'
# TODO jbuilder camelcase
# ```rb
Jbuilder.key_format camelize: :lower
# ```

# Initialize the Rails application.
Rails.application.initialize!
