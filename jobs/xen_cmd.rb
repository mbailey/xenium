#!/usr/bin/env ruby
#
# xen_commands.rb
#
# Command line access to ruby-xen's Xen::Command
#
require 'rubygems'
require 'ruby-xen'

# show usage info if wrong args
# - list commands 
command = ARGV.shift 
Xen::Command.send(command, *ARGV)