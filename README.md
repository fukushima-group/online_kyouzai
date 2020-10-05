# README
# online-kyouzai DB設計
## teachersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :students
- has_many :exams
## studentsテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|school_year_id|integer|null: false|
|club_id|integer|null: false|
|purpose|text|null: false|
|email|string|null: false|
|password|string|null: false|
|teacher_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :teacher
- has_many :subjects
- has_one :interviews
## interviewsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|student_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :student
## examsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|teacher_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :teacher
- has_many :subjects
## subjectsテーブル
|Column|Type|Options|
|------|----|-------|
|math|integer|null: false|
|english|integer|null: false|
|society|integer|null: false|
|science|integer|null: false|
|student_id|integer|null: false, foreign_key: true|
|exam_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :exam
- belongs_to :student