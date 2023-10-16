; ==========================================================
; シーン初期設定
; ==========================================================
*initialize
; 変数設定
[call target="*variable"]

; 背景読み込み
[bg storage="room_1.png" time="100"]

;BGMの再生 ※現在は開発のために音量0
[playbgm time="1000" storage="main.mp3" volume="0" loop=true]

; キャラクター定義&登場
[chara_new name="hiroine" storage="chara/hiroine/hiroine.png" jname="あかね"]
[chara_show name="hiroine" left="20" top="310" time="300"]

; メッセージウィンドウ(ふきだし)の設定
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]
[chara_config ptext="chara_name_area"]
[fuki_chara name="hiroine" border_size="1" border_color="white" color="FFFFFF" sippo="bottom" left=20 top="-50" sippo_left="110" sippo_top="30"]
[position layer="message0" left=550 top=500 width=0 height=0 page=fore visible=true]
[fuki_start]

; 本編開始(初回訪問時限定処理へのジャンプ)
[jump target="*first_visit"]


; ==========================================================
; 変数設定
; ==========================================================
*variable
;-----------------------------------
; 進行管理フラグ
;-----------------------------------
[eval exp="isRoom1FirstVisit=0"]
[eval exp="isDoorOpen=0"]
[eval exp="isTakeKey=0"]

;-----------------------------------
; アイテム管理フラグ
;-----------------------------------
[eval exp="itemKey=0"]

[return]


; ==========================================================
; インベントリ(所持アイテム)設定
; ==========================================================
*inventory
; 鍵
[if exp="itemKey==1"]
    [image name="key" layer="0" x="30" y="60" storage="item/key_1.png"]
[else]
    [free name="key" layer="0"]
[endif]

[return]


; ==========================================================
; クリッカブルマップ設定
; ==========================================================
*clickable
[clickable x="1050" y="500" width="100" height="100" target="*event_01" opacity="0" mouseopacity="50" color="0xffffff"]
[clickable x="1100" y="390" width="100" height="100" target="*event_02" opacity="0" mouseopacity="50" color="0xffffff"]
[clickable x="835" y="45" width="40" height="350" target="*event_03" opacity="0" mouseopacity="50" color="0xffffff"]
[clickable x="620" y="350" width="140" height="100" target="*event_04" opacity="0" mouseopacity="50" color="0xffffff"]
[clickable x="1100" y="310" width="100" height="100" target="*event_05" opacity="0" mouseopacity="50" color="0xffffff"]

[return]


; ==========================================================
; 初回訪問時限定処理
; ==========================================================
*first_visit
[if exp="isRoom1FirstVisit==0"]
#hiroine
んっ……[p]
ここは……？[p]
うっ……ダメだ。頭が痛い。何も思い出せない……[p]
でも、ここたぶんダンジョンの中だよね？[p]
仲間は…？まさかソロで潜ったわけじゃないよね？[p]
………………………[p]
とにかく、ここを出ないと[p]
[endif]

; 初回訪問フラグを立てる
[eval exp="isRoom1FirstVisit=1"]

; メインルーチンへジャンプ
[jump target="*main"]


; ==========================================================
; メインルーチン
; ==========================================================
*main
; クリッカブルマップ設定
[call target="*clickable"]

; インベントリ設定
[call target="*inventory" ]

; スタックをクリア
[clearstack]

; 停止(入力待機)
[s]


; ==========================================================
; イベント
; ==========================================================
;-----------------------------------
; 頭蓋骨
;-----------------------------------
*event_01
#hiroine
人骨だ…[p]
ダンジョンでは珍しいものじゃないけど……[p]
まあ、気分は良くないよね[p]
[jump target="*main"]

;-----------------------------------
; 金貨の山
;-----------------------------------
*event_02
#hiroine
金貨の山だ[p]
お宝だけど……今はそれどころじゃない[p]
[jump target="*main"]

;-----------------------------------
; 天井の鎖
;-----------------------------------
*event_03
#hiroine
錆びた鎖が伸びてる[p]
残念だけど、ここから出られるわけではなさそうだ[p]
[jump target="*main"]

;-----------------------------------
; 鍵の発見
;-----------------------------------
*event_04
[if exp="isTakeKey==0"]
    #hiroine
    金貨の山[p]
    ……これは、鍵？[p]
    [eval exp="itemKey=1"]
    [eval exp="isTakeKey=1"]
[else]
    #hiroine
    もう何もない[p]
[endif]

[jump target="*main"]

;-----------------------------------
; 鉄格子
;-----------------------------------
*event_05
; 鉄格子が開いている
[if exp="isDoorOpen==1"]
    #hiroine
    先に進もう[p]
    [jump storage="clear.ks"]
[endif]

; 鉄格子が開いている
[if exp="itemKey==0"]
    #hiroine
    鉄格子だ[p]
    よく見ると鍵穴がある[p]
[else]
    #hiroine
    鉄格子だ[p]
    手持ちの鍵が使えそうだ[p]
    開いた[p]
    [eval exp="itemKey=0"]
    [eval exp="isDoorOpen=1"]
[endif]

[jump target="*main"]