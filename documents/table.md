# nekosama's table definition document

## table list

| table name | description        |
| :--------- | :----------------- |
| users      | ユーザー情報を保存 |

## users

- ユーザー情報を保存

| 項目名    | 論理名      | 型     | 補足                    |
| :-------- | :---------- | :----- | :---------------------- |
| uid       | ユーザー ID | string | データベース上の一意 ID |
| createdAt | 登録日      | date   |                         |
| updatedAt | 更新日      | date   |                         |
| available | 有効        | bool   |                         |
