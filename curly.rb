#!/usr/local/bin/ruby
require 'json'

argString = ''

ARGV.each do |a|
	if a == '--json'
		argString += ' -H "Content-Type: application/json"'
	elsif a.match /^-/
		argString += " #{a}"
	else
		argString += " \"#{a}\""
	end
end

cmd = "curl -i #{argString}"

result = `#{cmd}`

result.split(/\n/).each do |line|
	if line.match /^[{\[].*[}\]]$/
		jj JSON.parse line
	else
		puts line
	end
end

