;ティラノスクリプト ふきだしサンプルゲーム
 
*start
 
[cm ]
[clearfix]
[start_keyconfig]
 
[bg storage="room.jpg" time="100"]
 
;メニューボタンの表示
@showmenubutton
 
;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]
 
;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]
 
;メッセージウィンドウの設定
 
[font color="black"]
[position layer="message0" left=160 top=500 width=1000 height=200 radius=15 page=fore visible=true color="white" opacity=255 border_size="3" border_color="black" ]
 
;文字が表示される領域を調整
[position layer=message0 page=fore margint="15" marginl="20" marginr="20" marginb="20"]
 
;メッセージウィンドウの表示
@layopt layer=message0 visible=true
 
;このゲームで登場するキャラクターを宣言
;akane
[chara_new name="akane" fuki_left=170 fuki_top=260 storage="chara/akane/normal.png" jname="あかね" ]
 
;キャラクターの表情登録
[chara_face name="akane" face="angry" storage="chara/akane/angry.png"]
[chara_face name="akane" face="doki" storage="chara/akane/doki.png"]
[chara_face name="akane" face="happy" storage="chara/akane/happy.png"]
[chara_face name="akane" face="sad" storage="chara/akane/sad.png"]
 
;yamato
[chara_new name="yamato" storage="chara/yamato/normal.png" jname="やまと" ]
 
[chara_show name="akane" left=620 top=200 ]
[chara_show name="yamato" left=120 top=100 ]
 
;[position vertical="true" layer=message0 page=fore ]
 
#
ふきだし機能のサンプルゲームです[p]
ふきだし表示を開始します[p]
 
;ふきだしの表示位置をキャラごとに設定する
[fuki_chara name="akane" left=200 top=270 sippo_left=30 sippo_top=30 sippo="top" max_width=300 radius=15]
[fuki_chara name="yamato" left=350 top=280 sippo_left=30 sippo_top=30 sippo="top"]
 
;キャラクターが画面上に存在しない場合に適応するふきだし設定 name=others
[fuki_chara name="others" left=250 top=500 max_width=700 fix_width=700 radius=0 ]
 
;ふきだし表示を開始する
[fuki_start ]
 
#あかね
こんにちは。[p]
私の名前はあかね。[p]
ふきだしの大きさは自動的に調整してくれるよ。[p]
 
 
#やまと
やぁ。[p]
これは便利だね！[p]
 
#あかね
例えば、立ち位置を変えると[p]
 
[chara_move name="akane" anim=true left=1000 ]
 
ふきだしが自動でついてくるよ。[p]
 
[chara_move name="akane" anim=true left=600 width=200 ]
 
おーい[p]
 
#やまと
おもしろいね！[p]
 
[chara_move name="akane" left=620 top=200 width=400 ]
 
#あかね
ふきだしのしっぽの位置もカスタマイズできます。[p]
 
[fuki_chara name="akane" sippo="bottom" left=200 top=10 sippo_left=30 sippo_top=30]
下固定（bottom）[p]
 
[fuki_chara name="akane" sippo="right" left = 110 top=100 ]
右固定（right）[p]
 
[fuki_chara name="akane" sippo="left" left =300 top=100 ]
左固定（left）[p]
 
[fuki_chara name="akane" sippo="top" left=200 top=270 sippo_left=30 sippo_top=30 ]
上固定（top）[p]
 
#あかね
次に縦書きのふきだしを試すよ。[p]
 
[position vertical="true" ]
[fuki_chara name="akane" sippo="left" left =300 top=100 max_width=300 ]
 
どうでしょう。[p]
縦書きで表示することもできます。[p]
[position vertical="false" ]
 
[fuki_chara name="akane" sippo="top" left=200 top=270 sippo_left=30 sippo_top=30 max_width=300 ]
 
#やまと
キャラクターが画面上にいない場合はどうなるの？[p]
 
#あかね
その場合は専用の名前（others）の設定が適応されるよ。[p]
 
じゃあ、ちょっと消えて。[p]
 
#やまと
はい...[p]
[chara_hide name="yamato"]
 
#やまと
いま、やまとが喋ってます。[p]
 
#あかね
こんな感じで画面下固定のメッセージとして表示されるわ。[p]
 
#あかね
ふきだしのデザインをかえることもできます。[p]
 
#あかね
[fuki_chara name="akane" color="black" opacity=200 border_size="1" border_color="white" ]
[font color="white"]
デザイン変更テスト[p]
 
[fuki_chara name="akane" color="0xFF3366" opacity=200 border_size="3" border_color="white"]
デザイン変更テスト[p]
 
#あかね
ふきだしのデザインをキャラクター毎に設定することもできるよ。[p]
 
;やまと用のふきだしデザイン
[fuki_chara name="yamato" left=350 top=280 sippo_left=30 sippo_top=30 sippo="top" color="white" opacity=200 border_size="3" border_color="black" radius=15]
 
;その他用のデザイン
[fuki_chara name="others" left=350 top=280 left=250 top=500 max_width=700 fix_width=700 radius=0 color="black" opacity=200 border_size="3" border_color="white"]
 
 
[chara_move name="akane" left=620 top=200 ]
[chara_show name="yamato" left=120 top=100 ]
 
#
これはナレーション[p]
 
#やまと
[font color="black"]
やまとがしゃべってます。[p]
 
#あかね
[font color="white"]
あかねがしゃべってます。[p]
 
#やまと
[font size=40 color="black"]
便利だ！[p]
 
[font size=28 color="black"]
 
ふきだし機能を無効化して、通常のメッセージに戻します。[p]
[fuki_stop]
 
[layopt layer=message0 visible=false]
[layopt layer=message1 visible=true]
 
;メッセージウィンドウの設定
[position layer="message1" width="1280" height="210" top="510" left="0" visible=true]
[position layer="message1" frame="frame.png" margint="50" marginl="100" marginr="100" opacity="230" page="fore"]
 
;名前枠の設定
[ptext name="chara_name_area" layer="message1" color="0xFAFAFA" size="28" bold="true" x="100" y="514"]
[chara_config ptext="chara_name_area"]
 
[current layer="message1"]
 
[font size=28 color="black"]
 
#あかね
通常のメッセージに切り替えました[p]
頻繁に切り替える場合はメッセージレイヤを分離して使い分けるとスムーズです。[p]
再度ふきだしに切り替えます[p]
 
[layopt layer=message0 visible=true]
[layopt layer=message1 visible=false]
[current layer="message0"]
 
;ふきだし機能スタート
[fuki_start]
 
[font color="white"]
 
#あかね
これはふきだしです。[p]
ふきだし機能のデモをおわります。[p]
 
[s]