require 'thor'
require 'thor/group'

class RemoveComments < Thor::Group
  include Thor::Actions
  argument :file_name, type: :string, :desc => "File name"
  desc 'remove comments'

  def remove_comments
    gsub_file(file_name, /^\s*#.*(\s*)$\n/, '')
  end

end