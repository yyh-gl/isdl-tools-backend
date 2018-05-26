# README

## エンドポイント
#### ユーザ一覧取得

`GET /api/users`

##### レスポンス
```
[
    {
        "id": 1,
        "name": "本田くん",
        "age": 23,
        "message": "Hello!",
        "created_at": "2018-05-26T01:03:21.550+09:00",
        "updated_at": "2018-05-26T01:03:21.550+09:00"
    },
    {
        "id": 2,
        "name": "山本くん",
        "age": 17,
        "message": "がんばるぞい!",
        "created_at": "2018-05-26T01:03:21.553+09:00",
        "updated_at": "2018-05-26T01:03:21.553+09:00"
    }
]
```

#### ユーザ1人の情報取得

`/api/users/:id`

##### レスポンス  
```
{
    "id": 1,
    "name": "本田くん",
    "age": 23,
    "message": "Hello!",
    "created_at": "2018-05-26T01:03:21.550+09:00",
    "updated_at": "2018-05-26T01:03:21.550+09:00"
}
```

#### テキストから感情分析

`/api/google/languages`

> 下記のようなJSONをリクエストに含めること
>
> `text` が感情分析した文章
>
> ただし、文章全体の感情を分析することに注意
```json:sample.json
{
     "text": "私はとても悲しい。でも、友達が励ましてくれたおかげで、今はとても元気です。"
 }
 ```
 
##### レスポンス
> `score` が文章全体の感情
> 正の感情であればプラスの値（最大値1）
> 負の感情であればマイナスの値（最小値-1）
>
> `magnitude` に関しては聞いてください

```
{
    "result": {
        "score": 0.30000001192092896,
        "magnitude": 1.2999999523162842
    }
}
```
 
#### テキストから感情分析
 
`/api/google/calendars`

##### レスポンス
> ↓50件（変更可能）取得できるが省略
```
[
    {
        "created": "2018-03-21T07:31:25.000+00:00",
        "creator": {
            "email": "mmiki@mikilab.doshisha.ac.jp",
            "self": true
        },
        "end": {
            "date_time": "2018-05-26T16:30:00.000+09:00"
        },
        "etag": "\"3043234983264000\"",
        "html_link": "https://www.google.com/calendar/event?eid=MjVramFnbmJuOTkzcTVzYWNzNjE5OHNrc2kgbW1pa2lAbWlraWxhYi5kb3NoaXNoYS5hYy5qcA",
        "i_cal_uid": "25kjagnbn993q5sacs6198sksi@google.com",
        "id": "25kjagnbn993q5sacs6198sksi",
        "kind": "calendar#event",
        "organizer": {
            "email": "mmiki@mikilab.doshisha.ac.jp",
            "self": true
        },
        "reminders": {
            "use_default": true
        },
        "sequence": 0,
        "start": {
            "date_time": "2018-05-26T14:00:00.000+09:00"
        },
        "status": "confirmed",
        "summary": "父母懇談会",
        "updated": "2018-03-21T07:31:31.632+00:00"
    },
    {
        "created": "2018-05-23T11:18:41.000+00:00",
        "creator": {
            "email": "mmiki@mikilab.doshisha.ac.jp",
            "self": true
        },
        "end": {
            "date_time": "2018-05-26T17:30:00.000+09:00"
        },
        "etag": "\"3054148643712000\"",
        "html_link": "https://www.google.com/calendar/event?eid=N200azdyZ3E4dWJyM2Viamo0bWlncTdvZmQgbW1pa2lAbWlraWxhYi5kb3NoaXNoYS5hYy5qcA",
        "i_cal_uid": "7m4k7rgq8ubr3ebjj4migq7ofd@google.com",
        "id": "7m4k7rgq8ubr3ebjj4migq7ofd",
        "kind": "calendar#event",
        "organizer": {
            "email": "mmiki@mikilab.doshisha.ac.jp",
            "self": true
        },
        "reminders": {
            "use_default": true
        },
        "sequence": 0,
        "start": {
            "date_time": "2018-05-26T16:30:00.000+09:00"
        },
        "status": "confirmed",
        "summary": "SOEPA講演者へリマインダー",
        "updated": "2018-05-23T11:18:41.856+00:00",
        "extended_properties": {
            "private": {
                "everyoneDeclinedDismissed": "-1"
            }
        }
    },
``` 