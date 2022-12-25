#guiスコアボード作成
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
scoreboard players set @a GUImain 0
scoreboard players set @a GUIbuki 0
scoreboard players set @a GUIbougu 0
scoreboard players set @a craft_copper_helmet 0