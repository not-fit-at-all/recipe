wday = {sunday:"A", monday:"B"}

wday.each do |key, value|
  p key
  p wday[key]
end

array = []
str = "blue 青 white 白\nred 赤"
array = str.split(/\s/)
p array
