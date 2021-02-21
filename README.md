## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :rooms
- has_many :session_logs

## roomsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| room_name       | string     | null: false                    |
| player_number   | string     | null: false                    |
| password_digest | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :characters
- has_one :session_log

## charactersテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| character_name | string     | null: false                    |
| pc_number      | integer    | null: false                    |
| secret         | text       |                                |
| last_resort    | text       |                                |
| room           | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- has_many :condition
- has_many :feeling

## session_logテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| log    | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user

## conditionテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| state_id  | integer    | null: false                    |
| character | references | null: false, foreign_key: true |

### Association
- belongs_to :character

## feelingテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| feel_id    | integer    | null: false                    |
| feeling_to | string     | null: false                    |
| character  | references | null: false, foreign_key: true |

### Association
- belongs_to :character