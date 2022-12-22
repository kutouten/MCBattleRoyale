playsound minecraft:ui.toast.challenge_complete player @a
title @a title ["",{"text":"\\","bold":true},{"text":"\\","bold":true,"color":"dark_gray"},{"text":"\\","bold":true,"color":"black"},{"text":" CHAMPION","bold":true,"color":"red"},{"text":" \\","bold":true,"color":"black"},{"text":"\\","bold":true,"color":"dark_gray"},{"text":"\\","bold":true}]
title @a subtitle ["",{"text":"\\"},{"text":"\\","color":"dark_gray"},{"text":"\\","color":"black"},{"text":"YOU ARE THE","color":"red"},{"text":"\\","color":"black"},{"text":"\\","color":"dark_gray"},{"text":"\\"}]
scoreboard players set #1 alive 0
#エリア収縮の停止と解放
#アマスタを削除 終了時に消されたくない場合tagで分ける 消されたくないのが1つならtag=!○○、2つ以上ならlingとling2などを指定
kill @e[type=armor_stand]
#エリア(ワールドボーダー)をめっちゃ広げる
worldborder set 10000