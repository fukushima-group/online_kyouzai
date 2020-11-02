Teacher.create(:first_name => '田中先生', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'teacher@111', :password => 'teacher111')
Teacher.create(:first_name => '山田先生', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'teacher@222', :password => 'teacher222')
Teacher.create(:first_name => '佐藤先生', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'teacher@333', :password => 'teacher333')
Student.create(:first_name => '田中生徒', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'student@111', :password => 'student111', :school_year_id => 1, :club_id => 1, :purpose => 'テストで100点', :teacher_id => 1)
Student.create(:first_name => '山田生徒', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'student@222', :password => 'student222', :school_year_id => 2, :club_id => 2, :purpose => 'テストで90点', :teacher_id => 2)
Student.create(:first_name => '佐藤生徒', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'student@333', :password => 'student333', :school_year_id => 3, :club_id => 3, :purpose => 'テストで80点', :teacher_id => 3)
Student.create(:first_name => '鈴木生徒', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'student@444', :password => 'student444', :school_year_id => 1, :club_id => 1, :purpose => 'テストで100点', :teacher_id => 1)
Student.create(:first_name => '高橋生徒', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'student@555', :password => 'student555', :school_year_id => 2, :club_id => 2, :purpose => 'テストで90点', :teacher_id => 2)
Student.create(:first_name => '伊藤生徒', :last_name => '太郎', :first_name_kana => 'タナカ', :last_name_kana => 'タロウ', :email => 'student@666', :password => 'student666', :school_year_id => 3, :club_id => 3, :purpose => 'テストで80点', :teacher_id => 3)
Exam.create(:name => '試験その１', :unit_id => 4, :teacher_id => 1)
Exam.create(:name => '試験その２', :unit_id => 49, :teacher_id => 1)
Exam.create(:name => '試験その３', :unit_id => 3, :teacher_id => 1)
Exam.create(:name => '試験その４', :unit_id => 24, :teacher_id => 2)
Exam.create(:name => '試験その５', :unit_id => 10, :teacher_id => 3)
Test.create(:question => '問題その１', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その２', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その３', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その４', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その５', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その６', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その７', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その８', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その９', :answer => '回答その１', :exam_id => 1)
Test.create(:question => '問題その１０', :answer => '回答その１', :exam_id => 1)
Record.create(:score => 80, :exam_id => 1, :student_id => 1)
Record.create(:score => 75, :exam_id => 1, :student_id => 2)
Record.create(:score => 70, :exam_id => 1, :student_id => 3)
Record.create(:score => 60, :exam_id => 1, :student_id => 4)
Record.create(:score => 50, :exam_id => 2, :student_id => 1)
Record.create(:score => 40, :exam_id => 2, :student_id => 2)
Record.create(:score => 56, :exam_id => 3, :student_id => 3)
Record.create(:score => 35, :exam_id => 3, :student_id => 4)
Record.create(:score => 54, :exam_id => 4, :student_id => 5)



unit_parent_array = [
  {name: "中1理科"},
  {name: "中2理科"},
  {name: "中1英語"},
  {name: "中2英語"}
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

eng_1_child_array = [
  {name: "３人称単数"},
  {name: "現在進行形"},
  {name: "助動詞のcan"},
  {name: "一般動詞の過去形"},
  {name: "定期テスト対策模試"},
  {name: "直前模試"}
]

eng_1_grandchild_array = [
  [
    {name: "肯定文"},
    {name: "疑問文・否定文"},
    {name: "選択問題特訓"},
    {name: "英作文まとめ"},
    {name: "be動詞・一般動詞まとめ"}
  ],[
    {name: "肯定文"},
    {name: "疑問文・否定文"},
    {name: "英作文まとめ"},
    {name: "現在進行形まとめ"}
  ],[
    {name: "肯定文"},
    {name: "疑問文・否定文"},
    {name: "英作文まとめ"},
    {name: "canまとめ"}
  ],[
    {name: "肯定文"},
    {name: "疑問文・否定文"},
    {name: "選択問題特訓"},
    {name: "英作文まとめ"},
    {name: "時制のまとめ"}
  ],[
    {name: "第1回"},
    {name: "第2回"},
    {name: "第3回"}
  ],[
    {name: "第1回"},
    {name: "第2回"},
    {name: "第3回"}
  ]
]

parent = Unit.create(unit_parent_array[2])
eng_1_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name])
  eng_1_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name])
  end
end

eng_2_child_array = [
  {name: "比較"},
  {name: "受動態"},
  {name: "接続詞"}
]

eng_2_grandchild_array = [
  [
    {name: "比較級<er>"},
    {name: "最上級<est>"},
    {name: "原級<as~as>"},
    {name: "比較級<er>〜原級<as~as>のまとめ"},
    {name: "more・most"},
    {name: "比較総まとめ"},
    {name: "比較級英作文まとめ"},
  ],[
    {name: "肯定文"},
    {name: "疑問文・否定文"},
    {name: "受動態まとめ"},
    {name: "受動態英作文まとめ"}
  ],[
    {name: "従属接続詞"},
    {name: "等位接続詞"},
    {name: "接続詞まとめ"},
    {name: "接続詞英作文まとめ"},
    {name: "接続詞まとめ"}
  ]
]

parent = Unit.create(unit_parent_array[3])
eng_2_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child[:name])
  eng_2_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild[:name])
  end
end