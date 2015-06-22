Pry.config.auto_indent = false
Pry.prompt = [
  proc { |target_self, nest_level, pry|
    prompt = ""
    prompt += "\001\e[38;5;160;48;5;234m\002 π \001\e[0m"
    prompt += "\001\e[38;5;236;48;5;233m\002 #{pry.input_array.size} "
    prompt += "\001\e[38;5;67;48;5;232m #{Pry.view_clip(target_self)} \001\e[0m\002"
    prompt += "#{":#{nest_level}" unless nest_level.zero?}"
    prompt += "\001\e[38;5;245;48;5;0m\002 "
  },
  proc { |target_self, nest_level, pry|
    "[#{pry.input_array.size}]\001\e[1;32m\002#{Pry.config.prompt_name}\001\e[0m\002(\001\e[1;33m\002#{Pry.view_clip(target_self)}\001\e[0m\002)#{":#{nest_level}" unless nest_level.zero?}* "
  }
]
=begin
Pry.prompt = [
    proc {
        |obj, nest_level, _|
            prompt = ""
            prompt += "\001\e[01;38;5;202m\002"
            prompt += "#{RUBY_VERSION} "
            prompt += "\001\e[0m\002"
    },
    proc {
        |obj, nest_level, _|
            prompt = "#{RUBY_VERSION} (#{obj}):#{nest_level} *"
    }
]
=end
