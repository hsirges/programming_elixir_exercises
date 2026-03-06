map = %{ name: "Dave", likes: "Programming", where: "Dallas"}
IO.inspect(Map.keys(map))
map.name
map1 = Map.drop(map, [:where, :likes])
IO.inspect(map)
IO.inspect(map1)
map2 = Map.put map, :also_likes, "Perl"
IO.inspect(map2)
