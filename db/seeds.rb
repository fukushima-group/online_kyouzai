unit_parent_array = [
  {name: "中1理科"},
  {name: "中2理科"}
]


sci_1_child_array = [
  {name: "植物のくらしとなかま"},
  {name: "活きている地球"},
  {name: "身のまわりの物質"},
  {name: "光・音・力による現象"}
]

sci_1_grandchild_array = [
  [
    {name: "花のつくりとはたらき"},
    {name: "水や栄養分を運ぶしくみ"},
    {name: "栄養分をつくるしくみ"},
    {name: "植物のなかま分け"}
  ],[
    {name: "大地がゆれる"},
    {name: "大地が火をふく"},
    {name: "大地は語る"}
  ],[
    {name: "いろいろな物質とその性質"},
    {name: "いろいろな気体とその性質"},
    {name: "水溶液の性質"},
    {name: "物質の姿とその変化"}
  ],[
    {name: "光による現象"},
    {name: "音による現象"},
    {name: "力による現象"}
  ]
]

parent = Unit.create(unit_parent_array[0])
sci_1_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name])
  sci_1_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name])
  end
end


sci_2_child_array = [
  {name: "動物の生活と生物の進化"},
  {name: "地球の大気と天気の変化"},
  {name: "化学変化と原子・分子"},
  {name: "電流の性質とその利用"}
]

sci_2_grandchild_array = [
  [
    {name: "生物の体と細胞"},
    {name: "声明を維持するはたらき"},
    {name: "感覚と運動のしくみ"},
    {name: "動物のなかま"},
    {name: "生物の移り変わりと進化"}
  ],[
    {name: "空気中の水の変化"},
    {name: "天気の変化と大気の動き"},
    {name: "大気の動きと日本の四季"}
  ],[
    {name: "物質の成り立ち"},
    {name: "物質を表す記号"},
    {name: "様々な化学変化"},
    {name: "化学変化と物質の質量"}
  ],[
    {name: "電流の性質"},
    {name: "電流の正体"},
    {name: "電流と磁界"}
  ]
]

parent = Unit.create(unit_parent_array[1])
sci_2_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name])
  sci_2_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name])
  end
end