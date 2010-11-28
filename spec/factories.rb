# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :player do |player|
  player.firstname                  "Fred"
  player.lastname                  "Flintstone"
  player.position                  "Midfielder"
  player.birth_date                  "09/22/1981"
  player.nationality                  "USA"
  player.previous_club                  "Some Other Club"
end

Factory.sequence :lastname do |n|
  "Van Playerson#{n}"
end

Factory.define :team do |team|
  team.name                  "Austin FC"
  team.address1                  "123 Main St."
  team.address2                  "Apt A"
  team.city                  "Austin"
  team.state                  "TX"
  team.zip                  "78704"
  team.phone                  "512-123-4567"
  team.website                  "http://foo.com"
  team.email                  "test@foo.com"
end

Factory.sequence :name do |n|
  "some Team FC-#{n}"
end

Factory.define :league do |league|
  league.year                 2002
  league.name                 "my soccer league"
end

Factory.define :teamstat do |teamstat|
#TODo can we turn off the stats for this since they are calculated on init now?
  teamstat.wins           0
  teamstat.losses         0
  teamstat.ties           0
  teamstat.goals_for      0
  teamstat.goals_against  0
  teamstat.games_played   0
  teamstat.team { |team|  team.association(:team, :name => Factory.next(:name)) }
  teamstat.league { |league|  league.association(:league) }
end

Factory.define :roster do |roster|
  roster.player { |player|  player.association(:player, :lastname => Factory.next(:lastname)) }
  #TODO should I do a Factory.next for teamstat factory objects?
  roster.teamstat { |teamstat|  teamstat.association(:teamstat) }
end

#Factory.define :match do |match|
#end
