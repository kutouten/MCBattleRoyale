gamemode survival @a
tp @a 0 153 0
fill 3 150 3 -3 150 -3 minecraft:bedrock
worldborder center 0.5 0.5
worldborder set 7
worldborder damage buffer 0
team add kill
team modify kill nametagVisibility never
team modify kill friendlyFire false
scoreboard objectives add death deathCount
scoreboard objectives add alive dummy
scoreboard objectives add SHC dummy
setworldspawn 0 153 0
team add ling
summon minecraft:armor_stand 0 256 0 {NoAI:1b,NoGravity:1b,Marker:1b,Invisible:1b,Tags:[ling]}
team join ling @e[type=minecraft:armor_stand,tag=ling]
scoreboard players set op SHC 1
scoreboard players set timer SHC 570
#countdownが常時実行されないように
scoreboard players set #countdown SHC -1

#途中参加用にゲームモードのデフォをスペクテイターに
defaultgamemode spectator

#天候、時間固定(晴れ)
gamerule doWeatherCycle false
weather clear
time set 6000
gamerule doDaylightCycle false

#bossbar
bossbar add 1 "現在待機中"
bossbar add 3 "安全エリア収縮まで残り"
bossbar add 4 "エリア収縮中"
bossbar set minecraft:3 max 11100
bossbar set minecraft:4 max 18000
bossbar set minecraft:3 value 11400
bossbar set minecraft:4 value 18000
bossbar set minecraft:1 players @a
bossbar set minecraft:3 players @a
bossbar set minecraft:4 players @a
bossbar set minecraft:1 color blue
bossbar set minecraft:3 color green
bossbar set minecraft:4 color red
scoreboard players set 3 SHC 11700
scoreboard players set 4 SHC 18000
