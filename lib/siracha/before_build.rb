# Check if nodejs had installed
%w[yarn node].each do |app|
  if `which #{app}`.blank?
    say("requires to install #{app}", :red)
    exit!
  end
end

node_version = `node -v`.scan(/[\d\.]+/).first
if node_version.to_f < 6.4
  say("requires Node.js >= v6.4 and you are using #{node_version}.", :red)
  exit!
end


@install_devise = yes?("Do you want to install devise?")

@devise_modal_name = ask("What is devise modal name[user]?")

@install_rubocop = yes?("Do you want to add rubocop?")