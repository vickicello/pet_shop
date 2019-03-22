class Scene
  def enter()
  end
end


class Engine
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter()
  end
end

class Welcome < Scene
  def enter()
    puts 'Welcome to the Pet Shop!  We have a few different kinds of pets up for adoption.'
    puts 'Enter 1 if you\'d like to see Cats or 2 if you\'d like to see Dogs.'
    input = $stdin.gets.chomp.to_i

    if input == 1
      return 'cat'
    elsif input == 2
      return 'dog'
    else
      puts 'I don\'t understand.  Please enter 1 for Cats or 2 for Dogs.' 
      return 'welcome'
    end
  end
end

class Cat < Scene
  def enter()
    puts 'We have 2 types of cats for you to view.  Please select 1 for Maine Coon, or 2 for Tuxedo Cat.  
    If you wish to return to the main room of the pet store, type return, and to exit the game, type exit.'
    print "> "
    action = $stdin.gets.chomp

    if action == 1 || "1"
      return 'maine_coon'
    elsif action == 2 || "2"
      return 'tuxedo_cat'
    elsif action == "return"
      return 'welcome'
    elsif action == 'finished'
      return 'finished'
    else
      puts 'I don\'t understand.  Please enter 1 for Maine Coon or 2 for Tuxedo Cat.'
      puts 'You can also type return to return to the main Pet Shop or exit to exit.' 
      return 'cat'
    end
  end
end

class Dog < Scene
  def enter()
    puts 'We have 2 types of dogs for you to view.  Please select 1 for German Shepherd, or 2 for a Mutt.  
    If you wish to return to the main room of the pet store, type return, and to exit the game, type exit.'
    print "> "
    action = $stdin.gets.chomp

    if action == 1 || "1"
      return 'german_shepherd'
    elsif action == 2 || "2"
      return 'mutt'
    elsif action == "return"
      return 'welcome'
    elsif action == 'exit'
      return 'finished'
    else
      puts 'I don\'t understand.  Please enter 1 for German Shepherd or 2 for Mutt.'
      puts 'You can also type return to return to the main Pet Shop or exit to exit.' 
      return 'dog'
    end
  end
end

class MaineCoon < Scene
  def enter()
    puts 'Check out this beautiful Maine Coon, weighing in at 13 lbs!'
    puts 'Would you like to adopt her? y/n'
    print '> '
    action = $stdin.gets.chomp
    
    if action == 'y' || 'Y'
      return 'congrats'
    elsif action == 'n' || 'N'
      puts 'That\'s too bad.  Want to check out the other cats? y/n'
      next_action = $stdin.gets.chomp
      if next_action == 'y' || 'Y'
        return 'cats'
      elsif next_action == 'n' || 'N'
        return 'finished'
      end
    else
      'I don\'t understand!'
      return 'welcome'
    end
  end
end

class TuxedoCat < Scene
  def enter()
    puts 'Check out this beautiful Tuxedo Cat, weighing in at 10 lbs!'
    puts 'Would you like to adopt him? y/n'
    print '> '
    action = $stdin.gets.chomp
    
    if action == 'y' || 'Y'
      return 'congrats'
    elsif action == 'n' || 'N'
      puts 'That\'s too bad.  Want to check out the other cats? y/n'
      next_action = $stdin.gets.chomp
      if next_action == 'y' || 'Y'
        return 'cats'
      elsif next_action == 'n' || 'N'
        return 'finished'
      end
    else
      'I don\'t understand!'
      return 'welcome'
    end
  end
end

class GermanShepherd < Scene
  def enter()
    puts 'Check out this beautiful German Shepherd, weighing in at 65 lbs!'
    puts 'Would you like to adopt him? y/n'
    print '> '
    action = $stdin.gets.chomp
    
    if action == 'y' || 'Y'
      return 'congrats'
    elsif action == 'n' || 'N'
      puts 'That\'s too bad.  Want to check out the other dogs? y/n'
      next_action = $stdin.gets.chomp
      if next_action == 'y' || 'Y'
        return 'dogs'
      elsif next_action == 'n' || 'N'
        return 'finished'
      end
    else
      'I don\'t understand!'
      return 'welcome'
    end
  end
end

class Mutt < Scene
  def enter()
    puts 'Check out this beautiful Mutt, weighing in at 42 lbs!'
    puts 'Would you like to adopt her? y/n'
    print '> '
    action = $stdin.gets.chomp
    
    if action == 'y' || 'Y'
      return 'congrats'
    elsif action == 'n' || 'N'
      puts 'That\'s too bad.  Want to check out the other dogs? y/n'
      next_action = $stdin.gets.chomp
      if next_action == 'y' || 'Y'
        return 'dogs'
      elsif next_action == 'n' || 'N'
        return 'finished'
      end
    else
      'I don\'t understand!'
      return 'welcome'
    end
  end
end

class Congratulations < Scene
  def enter()
    puts 'Congrats, you\'ve adopted a lovely pet!'
    return 'finished'
  end
end

class Finished < Scene
  def enter()
    puts 'Have a nice day!'
    exit(1)
  end
end

class Map
  @@scenes = {
    'welcome' => Welcome.new(),
    'cat' => Cat.new(),
    'dog' => Dog.new(),
    'maine_coon' => MaineCoon.new(),
    'tuxedo_cat' => TuxedoCat.new(),
    'german_shepherd' => GermanShepherd.new(),
    'mutt' => Mutt.new(),
    'congrats' => Congratulations.new(),
    'finished' => Finished.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    value = @@scenes[scene_name]
    return value
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('welcome')
a_game = Engine.new(a_map)
a_game.play()
