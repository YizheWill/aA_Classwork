


def create_folders
  commands = []
  (1..11).each do |i|
    (1..5).each do |j|
      commands << "mkdir W#{i}D#{j}"
    end
  end
  commands.each do |command|
    `#{command}`
  end
end

def zip(zipped_name, file_name)
  `zip -er #{zipped_name} #{file_name}`
end

def find_and_delete(filename)
  `find . - name #{filename} - delete`
end
