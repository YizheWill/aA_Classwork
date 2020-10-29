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

create_folders
