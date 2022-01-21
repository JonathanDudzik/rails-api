desc 'truncate a string based on a length'

task :truncate do
  # def truncate(text, truncate_at, options = {})
  text = "0123!56!89123!"
  truncate_at = 9
  options = {omission: "@", separator: "#"}

  # return a 'deep' duplication of the text unless the string's length is greater than the truncate_at number
  # could possible use a turnary here.
  return text unless text.length > truncate_at

  # Check if an ommission hash has been given, if not default the omission to "..."
  omission = options[:omission] || "..."

  # get the new truncate_at value accounting for the length of the ommision
  # if length_with_room_for_omission is less than 1, give an error
  length_with_room_for_omission = truncate_at - omission.length

  # asign stop depending on a conditional statement looking for a separator
  if options[:separator]
    # search for a substring within a string.
    # Finds FIRST instance of seperator and cuts it there (inclusive)
    # I BELIEVE the second value in rindex is the point at which to begin searching
    # Imagine the case where your seperator was at a location greater than your truncate length, you would get a string greater than you want
    stop = text.rindex(options[:separator], length_with_room_for_omission)
      if stop === nil
        puts "nil"
      elsif stop === length_with_room_for_omission
        puts "length_with_room_for_omission"
        print text.rindex(options[:separator], length_with_room_for_omission)
      else 
        puts stop
      end
  else
    stop = length_with_room_for_omission
  end

  # Return statment here and at line 12 "#{text[0, stop]}#{omission}"
end