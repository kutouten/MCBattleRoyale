title @a title "START"
playsound minecraft:block.note_block.bit player @a ~ ~ ~ 1 2
fill 3 150 3 -3 150 -3 minecraft:air
worldborder set 2000 

#開始時エフェクト付与
effect give @a minecraft:resistance 20 255 true
effect give @a minecraft:invisibility 150 1 true

#各種スコアボード処理
scoreboard players set #1 alive 1
scoreboard players set op SHC 3
scoreboard objectives add killcount playerKillCount
scoreboard objectives setdisplay list killcount

#スケジュール
schedule function hogepack:8 570s append
schedule function hogepack:timer 1s append

#支給品
give @a minecraft:cooked_beef 16
give @a minecraft:compass 1
give @a minecraft:oak_wood 8
give @a minecraft:bow 1
give @a minecraft:arrow 8
give @a written_book{pages:['["",{"text":"\\u3053\\u306e\\u672c\\u306b\\u66f8\\u3044\\u3066\\u3042\\u308b\\u30ec\\u30b7\\u30d4\\u306f\\u901a\\u5e38\\u306e\\u30af\\u30e9\\u30d5\\u30c8\\u3067\\u306f\\u4f5c\\u308b\\u3053\\u3068\\u304c\\u3067\\u304d\\u307e\\u305b\\u3093\\u3002\\n\\n\\u30af\\u30e9\\u30d5\\u30c8\\u3059\\u308b\\u969b\\u306f"},{"text":"\\u4f5c\\u696d\\u53f0\\u306e\\u4e0a\\u306b\\u30a2\\u30a4\\u30c6\\u30e0\\u3092\\u6295\\u3052\\u3066","bold":true},{"text":"\\u30af\\u30e9\\u30d5\\u30c8\\u3057\\u307e\\u3057\\u3087\\u3046\\u3002\\n\\n ","color":"reset"}]','{"text":"[\\u76ee\\u6b21]\\n\\np2 \\u9285\\u88c5\\u5099\\np3,4 \\u30dd\\u30fc\\u30b7\\u30e7\\u30f3\\u7cfb\\np4 \\u305d\\u306e\\u4ed6"}','{"text":"[\\u9285\\u306e\\u30d6\\u30fc\\u30c4]\\n\\u9285\\u30a4\\u30f3\\u30b4\\u30c3\\u30c8x4\\n\\n[\\u9285\\u306e\\u30d8\\u30eb\\u30e1\\u30c3\\u30c8]\\n\\u9285\\u30a4\\u30f3\\u30b4\\u30c3\\u30c8x1 \\u9285\\u306e\\u30d6\\u30fc\\u30c4x1\\n\\n[\\u9285\\u306e\\u30ec\\u30ae\\u30f3\\u30b9]\\n\\u9285\\u30a4\\u30f3\\u30b4\\u30c3\\u30c8x2 \\u9285\\u306e\\u30d8\\u30eb\\u30e1\\u30c3\\u30c8x1\\n\\n[\\u9285\\u306e\\u30c1\\u30a7\\u30b9\\u30c8\\u30d7\\u30ec\\u30fc\\u30c8]\\n\\u9285\\u30a4\\u30f3\\u30b4\\u30c3\\u30c8x1 \\u9285\\u306e\\u30ec\\u30ae\\u30f3\\u30b9x1"}','{"text":"[\\u30ea\\u30f3\\u30b4\\u30b8\\u30e5\\u30fc\\u30b9]\\n\\u30ea\\u30f3\\u30b4x2 \\u30ac\\u30e9\\u30b9\\u74f6x1\\n\\n[\\u30b7\\u30fc\\u30eb\\u30c9\\u30d0\\u30c3\\u30c6\\u30ea\\u30fc]\\n\\u30e9\\u30d4\\u30b9\\u30e9\\u30ba\\u30ea\\u30d6\\u30ed\\u30c3\\u30afx1 \\u30ac\\u30e9\\u30b9\\u74f6x1\\n\\n[\\u8208\\u596e\\u5264]\\n\\u7802\\u7cd6x3 \\u7a2ex1 \\u706b\\u85acx1 \\u30ac\\u30e9\\u30b9\\u74f6x1"}','{"text":"[\\u30d7\\u30ed\\u30c6\\u30a4\\u30f3]\\n\\u751f\\u306e\\u8c5a\\u8089x1 \\u751f\\u306e\\u725b\\u8089x1 \\u751f\\u306e\\u9d8f\\u8089x1 \\u751f\\u306e\\u7f8a\\u8089x1 \\u30ac\\u30e9\\u30b9\\u74f6x1\\n\\n[\\u30a8\\u30f3\\u30c0\\u30fc\\u30d1\\u30fc\\u30eb]\\n\\u8150\\u3063\\u305f\\u8089x1 \\u706b\\u85acx1 \\u9aa8x1 \\u8718\\u86db\\u306e\\u7cf8x1 \\u30ac\\u30e9\\u30b9x1\\n "}'],title:"Custom Craft",author:"Game Master"}

#countdownが常時実行されないように
scoreboard players set #countdown SHC -1

#テストで始まった瞬間分散するように
spreadplayers ~ ~ 50 1000 false @a

#途中参加用にゲームモードのデフォをスペクテイターに
defaultgamemode spectator

