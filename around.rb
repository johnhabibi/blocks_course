def tag(name)
  print "<#{name}>"
  print yield
  print "</#{name}>"
end

tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end

def with_debugging
  puts "Got Here!"
  result = yield
  puts = "Result was #{result}"
end

def with_expectation(expected_value)
  puts "Running test..."
  result = yield
  if result == expected_value
    puts "Passed."
  else
    puts "Failed!"
    puts "Expected #{expected_value}, but got #{result}"
  end
end
