# README


## usersテーブル

|Columns      |Type     |Options                 |
|-------------|---------|------------------------|
|nickname     |string   |null: false             |
|email        |string   |null: false             |
|password     |string   |null: false             |
|image        |string   |                        |

### Association
- belongs_to :residence, class_name: "Region", optional: true, primary_key: "residence_id"
- belongs_to :birthplace, class_name: "Region", optional: true, primary_key: "birthplace_id"       <!---わからん。多分こう-->

- has_many :passive_relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
- has_many :followedes, through: :passive_relationships
- has_many :active_relationships,class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
- has_many :followings, through: :active_relationships

- has_many :group_users
- has_many :groups, through: :group_users
- has_many :masseges

## relationshipsテーブル

|Column      |Type      |Options     |
|------------|----------|------------|
|followed_id |integer   |null: false |
|following_id|integer   |null: false |

### Association
- belongs_to :following, class_name: "User", foreign_key: "following_id"
- belongs_to :followed, class_name: "User", foreign_key: "followed_id"

## groupsテーブル

|Column  |Type       |Options                       |
|--------|-----------|------------------------------|
|group_id|integer    |null: false                   |

### Association
- has_many :users, through: :group_users
- has_many :group_users
- accepts_nested_attributes_for :group_users, allow_destroy: true     <!-- group側からuser側を配列として触れるようにするメソッド -->
- has_many :messages

## group_usersテーブル

|Column  |Type      |Options                         |
|--------|----------|--------------------------------|
|user_id |references|index: true, foreign_key: true  |
|group_id|references|index: true, fore 5ign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## messagesテーブル

|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|text    |string    |                              |
|image   |string    |                              |
|user_id |references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## user_communitiesテーブル

|Column        |Type       |Options                       |
|--------------|-----------|------------------------------|
|community_id|references |null: false, foreign_key: true|
|user_id       |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :community



## regionsテーブル
<!-- 静的マスター -->

|Column   |Type    |Option      |
|---------|--------|------------|
|name     |string  |null: false |
|overseas |integer |            |

### Association
has_many: users
