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
bossbar set minecraft:1 players @a
bossbar set minecraft:1 color blue

#lootsheep
execute as @e[limit=20] run summon minecraft:sheep ~ ~ ~ {CustomName:'{"text":"jeb_"}',DeathLootTable:"hogepack:shc",Glowing:true,Health:100.0f,Attributes:[{Name:"generic.max_health",Base:100.0d},{Name:"generic.movement_speed",Base:0.00d}]}
spreadplayers ~ ~ 50 1000 false @e[name=jeb_]