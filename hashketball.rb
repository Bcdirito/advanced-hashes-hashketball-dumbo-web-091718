# Write your code here!
def game_hash
  game_hash = {
  :home => {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    :players => {
      "Alan Anderson" => {
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
    },
    "Reggie Evans" => {
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
    },
    "Brook Lopez" => {
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
    },
    "Mason Plumlee" => {
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
    },
    "Jason Terry" => {
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
    }
  }
},
  :away => {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
    },
    "Bismak Biyombo" => {
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
    },
    "DeSagna Diop" => {
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
    },
    "Ben Gordon" => {
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
    },
    "Brendan Haywood" => {
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
    }
  }
}
}
end

def num_points_scored(player)
    if game_hash[:home][:players].include?("#{player}")
      return game_hash[:home][:players]["#{player}"][:points]
    elsif game_hash[:away][:players].include?("#{player}")
      return game_hash[:away][:players]["#{player}"][:points]
    end
end

def shoe_size(player)
  if game_hash[:home][:players].include?("#{player}")
    return game_hash[:home][:players]["#{player}"][:shoe]
  elsif game_hash[:away][:players].include?("#{player}")
    return game_hash[:away][:players]["#{player}"][:shoe]
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away][:colors]
  end
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
  return teams
end

def player_numbers(team_name)
  team_numbers = []

  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |player, number|
      team_numbers << game_hash[:home][:players]["#{player}"][:number]
    end
    elsif game_hash[:away][:team_name] == team_name
      game_hash[:away][:players].each do |player, number|
        team_numbers << game_hash[:away][:players]["#{player}"][:number]
      end
    end
  sorted_team_numbers = team_numbers.sort
  return sorted_team_numbers
end

def player_stats(player)
  if game_hash[:home][:players].include?("#{player}")
    return game_hash[:home][:players]["#{player}"]
  elsif game_hash[:away][:players].include?("#{player}")
    return game_hash[:away][:players]["#{player}"]
  end
end

def big_shoe_rebounds
  nets_shoe_sizes = []
  hornets_shoe_sizes = []
  biggest_shoe = []

  game_hash[:home][:players].each do |player, shoe|
    nets_shoe_sizes << game_hash[:home][:players]["#{player}"][:shoe]
  end

  game_hash[:away][:players].each do |player, shoe|
    hornets_shoe_sizes << game_hash[:away][:players]["#{player}"][:shoe]
  end
  sorted_nets_shoes = nets_shoe_sizes.sort
  sorted_hornets_sizes = hornets_shoe_sizes.sort

  biggest_nets_shoe = sorted_nets_shoes.last
  biggest_hornets_shoe = sorted_hornets_sizes.last

  if biggest_nets_shoe > biggest_hornets_shoe
    biggest_shoe = biggest_nets_shoe
  elsif biggest_nets_shoe < biggest_hornets_shoe
    biggest_shoe = biggest_hornets_shoe
  end

  game_hash[:home][:players].each do |player, shoe|
    if game_hash[:home][:players]["#{player}"][:shoe] == biggest_shoe
      return game_hash[:home][:players]["#{player}"][:rebounds]
    end
  end

  game_hash[:away][:players].each do |player, shoe|
    if game_hash[:away][:players]["#{player}"][:shoe] == biggest_shoe
      return game_hash[:away][:players]["#{player}"][:rebounds]
    end
  end
end
