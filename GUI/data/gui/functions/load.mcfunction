#guiスコアボード作成
scoreboard objectives add have_compass dummy
scoreboard objectives add GUI_reset dummy
scoreboard objectives add GUImain dummy
scoreboard objectives add GUIbuki dummy
scoreboard objectives add GUIbougu dummy

#クラフト用のスコアボード
scoreboard objectives add craft_copper_helmet dummy
scoreboard objectives add craft_copper_chestplate dummy
scoreboard objectives add craft_copper_leggings dummy
scoreboard objectives add craft_copper_boots dummy

#所持アイテム数検知用のスコアボード作成
scoreboard objectives add have_coppaer_ingot dummy

#スコアボードの値を一度0にセット（必ずやれ）
scoreboard players set @a have_compass 0
scoreboard players set @a GUI_reset 0
scoreboard players set @a GUImain 0
scoreboard players set @a GUIbuki 0
scoreboard players set @a GUIbougu 0
scoreboard players set @a craft_copper_helmet 0

#GUI表示用のトロッコを16個召喚
execute as @e[limit=16] run summon minecraft:chest_minecart 0 256 0 {Tags:[GUI],Invulnerable:true,Silent:true,NoGravity:true}