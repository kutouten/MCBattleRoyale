#guiスコアボード作成
scoreboard objectives add have_compass dummy
scoreboard objectives add GUI_reset dummy
scoreboard objectives add GUImain dummy
scoreboard objectives add GUIbuki dummy
scoreboard objectives add GUIbougu dummy
scoreboard objectives add GUIpotion dummy

#クラフト用のスコアボード
scoreboard objectives add craft_copper_helmet dummy
scoreboard objectives add craft_copper_chestplate dummy
scoreboard objectives add craft_copper_leggings dummy
scoreboard objectives add craft_copper_boots dummy
scoreboard objectives add craft_apple_potion dummy
scoreboard objectives add craft_shield_potion dummy
scoreboard objectives add craft_protein dummy
scoreboard objectives add craft_octane_potion dummy


#所持アイテム数検知用のスコアボード作成
scoreboard objectives add have_coppaer_ingot dummy
scoreboard objectives add have_apple dummy
scoreboard objectives add have_glass_bottle dummy
scoreboard objectives add have_lapis_block dummy
scoreboard objectives add have_chicken dummy
scoreboard objectives add have_mutton dummy
scoreboard objectives add have_beef dummy
scoreboard objectives add have_porkchop dummy
scoreboard objectives add have_wheat_seeds dummy
scoreboard objectives add have_suger dummy
scoreboard objectives add have_gunpowder dummy

#スコアボードの値を一度0にセット（必ずやれ）
scoreboard players set @a have_compass 0
scoreboard players set @a GUI_reset 0
scoreboard players set @a GUImain 0
scoreboard players set @a GUIbuki 0
scoreboard players set @a GUIbougu 0
scoreboard players set @a GUIpotion 0
scoreboard players set @a craft_copper_helmet 0
scoreboard players set @a craft_copper_chestplate 0
scoreboard players set @a craft_copper_leggings 0
scoreboard players set @a craft_copper_boots 0
scoreboard players set @a craft_apple_potion 0
scoreboard players set @a craft_shield_potion 0
scoreboard players set @a craft_protein 0
scoreboard players set @a craft_octane_potion 0

#GUI表示用のトロッコを16個召喚
execute as @e[limit=16] run summon minecraft:chest_minecart 0 256 0 {Tags:[GUI],Invulnerable:true,Silent:true,NoGravity:true}