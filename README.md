# FreeMarket_sample_68_e   DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, add_index｜
|email|string|null: false, unique: true, add_index|
|password|string|null: false|
|family_name|string||
|last_name|string||
|j_family_name|string||
|j_last_name|string||
|birthday_year|integer||
|birthday_month|integer||
|birthday_day|integer||
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
|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|prefectures|string||
|municipalities|string||
|address|string||
|building|string||
|postal_code|integer||
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