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