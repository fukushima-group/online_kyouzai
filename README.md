# README
# online-kyouzai DB設計

## teachersテーブル
|Column            |Type    |Options      |
|------------------|--------|-------------|
|family_name       | string | null: false |
|first_name        | string | null: false |
|family_name_kana  | string | null: false |
|first_name_kana   | string | null: false |
|email             | string | null: false |
|password          | string | null: false |
### Association
- has_many :students
- has_many :exams


## studentsテーブル
|Column            |Type     |Options                         |
|------------------|---------|--------------------------------|
|family_name       | string  | null: false                    |
|first_name        | string  | null: false                    |
|family_name_kana  | string  | null: false                    |
|first_name_kana   | string  | null: false                    |
|email             | string  | null: false                    |
|school_year_id    | integer | null: false  (active_hash)     |
|club_id           | integer | null: false  (active_hash)     |
|purpose           | text    | null: false                    |
|teacher_id        | integer | null: false, foreign_key: true |
### Association
- belongs_to :teacher
- has_many :records
- has_one :interviews


## interviewsテーブル
|Column            |Type     |Options                         |
|------------------|---------|--------------------------------|
|content           | text    | null: false                    |
|student_id        | integer | null: false, foreign_key: true |
### Association
- belongs_to :student


## recordsテーブル
|Column            |Type     |Options                         |
|------------------|---------|--------------------------------|
|score             | integer | null: false                    |
|exam_id           | integer | null: false, foreign_key: true |
|student_id        | integer | null: false, foreign_key: true |
### Association
- belongs_to :student
- belongs_to :exam


## examsテーブル
|Column            |Type     |Options                         |
|------------------|---------|--------------------------------|
|name              | string  | null: false                    |
|unit_id           | integer | null: false  (ancestry)        |
|teacher_id        | integer | null: false, foreign_key: true |
### Association
- belongs_to :teacher
- has_many :tests
- has_one :record


## testsテーブル
|Column            |Type     |Options                         |
|------------------|---------|--------------------------------|
|question          | text    | null: false                    |
|answer            | text    | null: false                    |
|exam_id           | integer | null: false, foreign_key: true |
### Association
- belongs_to :exam