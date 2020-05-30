def type_print(text = "")
  text.chars.each do |ch|
    print ch
    sleep(rand(0.02..0.1))
  end
end

def type_puts(text = "")
  text.chars.each do |ch|
    print ch
    sleep(rand(0.02..0.1))
  end
  puts
end
