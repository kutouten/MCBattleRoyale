gamemode survival @a
gamerule announceAdvancements false
tp @a 0 153 0
fill 3 150 3 -3 150 -3 minecraft:bedrock
worldborder center 0.5 0.5
worldborder set 7
worldborder damage buffer 0
team add player
team modify player nametagVisibility never
scoreboard objectives add death deathCount
scoreboard objectives add alive dummy
scoreboard objectives add SHC dummy
scoreboard objectives add ninzin minecraft.used:carrot_on_a_stick
setworldspawn 0 153 0
team add ling

scoreboard players set op SHC 1
scoreboard players set timer SHC 570
#countdownが常時実行されないように
scoreboard players set #countdown SHC -1

#天候、時間固定(晴れ)
gamerule doWeatherCycle false
weather clear
time set 6000
gamerule doDaylightCycle false

#bossbar
bossbar add 1 "現在待機中"
bossbar set minecraft:1 players @a
bossbar set minecraft:1 color blue

#guiスコアボード作成
scoreboard objectives add have_compass dummy
scoreboard objectives add GUI_reset dummy
scoreboard objectives add GUImain dummy
scoreboard objectives add GUIbuki dummy
scoreboard objectives add GUIbougu dummy
scoreboard objectives add GUIpotion dummy
scoreboard objectives add GUIother dummy

#クラフト用のスコアボード
scoreboard objectives add craft_copper_helmet dummy
scoreboard objectives add craft_copper_chestplate dummy
scoreboard objectives add craft_copper_leggings dummy
scoreboard objectives add craft_copper_boots dummy
scoreboard objectives add craft_apple_potion dummy
scoreboard objectives add craft_shield_potion dummy
scoreboard objectives add craft_protein dummy
scoreboard objectives add craft_octane_potion dummy
scoreboard objectives add craft_exitrope dummy
scoreboard objectives add craft_hunting_eye dummy

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
scoreboard objectives add have_spider_eye dummy
scoreboard objectives add have_glass dummy
scoreboard objectives add have_strings dummy
scoreboard objectives add have_feather dummy