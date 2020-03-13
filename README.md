# FreeMarket_sample_68_e   DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, add_index|
|email|string|null: false, unique: true, add_index|
|password|string|null: false|
|family_name|string|null: false|
|last_name|string|null: false|
|j_family_name|string|null: false|
|j_last_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
### Association
- has_one :address
- has_many :cards
- has_many: exibitions

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|
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
|category_id|string|null: false, foreign_key: true|
|shipping_charges|string|null: false|
|prefecture_id|integer|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|item_name|string|null: false|
|item_status|string|null: false|
|item_description|text|null: false|
|deal|integer|default: 0, null: false, limit: 1|
|bland|string||
### Association
- belongs_to :user
- belongs_to :category
- has_many :images

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|item|string|null: false, add_index|
|ancestry|string||
### Association
- has_many :exhibitions

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|exhibitions_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :exhibition