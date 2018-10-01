#!/usr/bin/env ruby

load File.expand_path("~/.rubyrc")
include RubyRC

Pry.config.prompt = [
  proc { PROMPT.call(">>") },
  proc { PROMPT.call(" *") }
]

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end