## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :rooms
- has_many :session_logs
- has_many :roles

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
- has_many :roles
- has_one :session_log

## rolesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| role   | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_room :room

## charactersテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| character_name | string     | null: false                    |
| pc_number      | integer    | null: false                    |
| room           | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- has_many :secrets
- has_many :last_resorts
- has_many :conditions
- has_many :feelings

## secretテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| secret_n  | integer    | null: false                    |
| secret    | text       | null: false                    |
| character | references | null: false, foreign_key: true |

### Association
- belongs_to :character
- has_many :open_secrets

## open_secretテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| secret_unveil_to | string     | null: false                    |
| unveiled_id      | integer    | null: false                    |
| secret           | references | null: false, foreign_key: true |

### Association
- belongs_to :secret

## last_resortテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| last_resort_n | integer    | null: false                    |
| last_resort   | text       | null: false                    |
| character     | references | null: false, foreign_key: true |

### Association
- belongs_to :character
- has_many :open_last_resorts

## open_last_resortテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| lr_unveil_to | string     | null: false                    |
| unveiled_id  | integer    | null: false                    |
| last_resort  | references | null: false, foreign_key: true |

### Association
- belongs_to :secret

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