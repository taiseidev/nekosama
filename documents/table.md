# nekosama's table definition document

## table list

| table name | description          |
| :--------- | :------------------- |
| user       | ユーザー情報を保存   |
| cat        | 猫ちゃんの情報を保存 |
| post       | 投稿内容を保存       |
| thread     | スレッドを保存       |
| talk       | トーク内容を保存     |

## user

- ユーザー情報を保存

| 項目名    | 論理名       | 型     | 補足                    |
| :-------- | :----------- | :----- | :---------------------- |
| uid       | ユーザー ID  | string | データベース上の一意 ID |
| name      | 名前         | string |                         |
| phone     | 電話番号     | int    |                         |
| imageUrl  | アイコン画像 | string |                         |
| comment   | コメント     | string |                         |
| createdAt | 登録日       | date   |                         |
| updatedAt | 更新日       | date   |                         |
| available | 有効         | bool   |                         |

## cat

- 猫ちゃんの情報を保存

| 項目名       | 論理名           | 型     | 補足                    |
| :----------- | :--------------- | :----- | :---------------------- |
| uid          | 猫ちゃん ID      | string | データベース上の一意 ID |
| targetUserId | ユーザー ID      | string |                         |
| name         | 名前             | string |                         |
| age          | 年齢             | int    |                         |
| iconUrl      | プロフィール画像 | string |                         |
| gender       | 性別             | int    |                         |
| breed        | 種類             | string |                         |
| personality  | 性格             | string |                         |
| like         | 好きなこと       | string |                         |
| dislike      | 嫌いなこと       | string |                         |
| createdAt    | 登録日           | date   |                         |
| updatedAt    | 更新日           | date   |                         |
| available    | 有効             | bool   |                         |

## post

- 投稿内容を保存

| 項目名       | 論理名        | 型     | 補足                    |
| :----------- | :------------ | :----- | :---------------------- |
| uid          | 投稿 ID       | string | データベース上の一意 ID |
| targetUserId | ユーザー ID   | string |                         |
| catId        | 猫ちゃんの ID | string |                         |
| imageUrl     | 画像 Url      | string |                         |
| comment      | コメント      | string |                         |
| isDisplay    | 表示・非表示  | bool   |                         |
| createdAt    | 登録日        | date   |                         |
| updatedAt    | 更新日        | date   |                         |
| available    | 有効          | bool   |                         |

## thread

- スレッドを保存

| 項目名       | 論理名       | 型     | 補足                      |
| :----------- | :----------- | :----- | :------------------------ |
| uid          | 投稿 ID      | string | データベース上の一意 ID   |
| createUserId | ユーザー ID  | string | スレッド作成者            |
| title        | タイトル     | string | 「怒り 😤」などのタイトル |
| comment      | コメント     | string |                           |
| isDisplay    | 表示・非表示 | bool   |                           |
| createdAt    | 登録日       | date   |                           |
| updatedAt    | 更新日       | date   |                           |
| available    | 有効         | bool   |                           |

## talk

- 投稿内容を保存

| 項目名       | 論理名        | 型     | 補足                    |
| :----------- | :------------ | :----- | :---------------------- |
| uid          | トーク ID     | string | データベース上の一意 ID |
| targetUserId | ユーザー ID   | string |                         |
| catId        | 猫ちゃんの ID | string | 猫詳細画面遷移用        |
| imageUrl     | 画像 Url      | string |                         |
| comment      | コメント      | string |                         |
| isDisplay    | 表示・非表示  | bool   |                         |
| createdAt    | 登録日        | date   |                         |
| updatedAt    | 更新日        | date   |                         |
| available    | 有効          | bool   |                         |
