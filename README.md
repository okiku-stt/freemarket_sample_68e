# FreeMarket_sample_68_e   DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, add_index｜
|email|string|null: false, unique: true, add_index|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
### Association
- has_one :address
- has_many :pays
- has_many: exibitions
- has_one: purchase

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false|
|year|integer|null: false|
|month|integer|null: false|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|ship_family_name|string|null: false|
|ship_last_name|string|null: false|
|ship_j_family_name|string|null: false|
|ship_j_last_name|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|house_number|string|null: false|
|building|string||
|phone_number|integer||
### Association
- belongs_to :user

## exhibitionsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|categorys_id|integer|null: false, foreign_key: true|
|bland_id|integer|null: false, foreign_key: true|
|shipping_charges|string|null: false|
|shipping_area|string|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
### Association
- belongs_to :user
- has_many :comments
- belongs_to :category
- belongs_to :image
- belongs_to :purchase

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|path|integer|null: false|
|item|string|null: false, add_index|
### Association
- has_many :exhibitions

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|exhibitions_id|integer|null: false,foreign_key: true|
### Association
- has_many :exhibitions

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|exhibitions_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :exhibition