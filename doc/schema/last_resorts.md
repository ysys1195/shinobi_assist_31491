# last_resorts

## Description

<details>
<summary><strong>Table Definition</strong></summary>

```sql
CREATE TABLE `last_resorts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_resort_n` int(11) NOT NULL,
  `last_resort` text NOT NULL,
  `character_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_last_resorts_on_character_id` (`character_id`),
  CONSTRAINT `fk_rails_7f060c252b` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=[Redacted by tbls] DEFAULT CHARSET=utf8
```

</details>

## Columns

| Name | Type | Default | Nullable | Extra Definition | Children | Parents | Comment |
| ---- | ---- | ------- | -------- | --------------- | -------- | ------- | ------- |
| id | bigint(20) |  | false | auto_increment | [open_last_resorts](open_last_resorts.md) |  |  |
| last_resort_n | int(11) |  | false |  |  |  |  |
| last_resort | text |  | false |  |  |  |  |
| character_id | bigint(20) |  | false |  |  | [characters](characters.md) |  |
| created_at | datetime(6) |  | false |  |  |  |  |
| updated_at | datetime(6) |  | false |  |  |  |  |

## Constraints

| Name | Type | Definition |
| ---- | ---- | ---------- |
| fk_rails_7f060c252b | FOREIGN KEY | FOREIGN KEY (character_id) REFERENCES characters (id) |
| PRIMARY | PRIMARY KEY | PRIMARY KEY (id) |

## Indexes

| Name | Definition |
| ---- | ---------- |
| index_last_resorts_on_character_id | KEY index_last_resorts_on_character_id (character_id) USING BTREE |
| PRIMARY | PRIMARY KEY (id) USING BTREE |

## Relations

![er](last_resorts.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)