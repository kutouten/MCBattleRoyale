scoreboard players set #countdown SHC 120
#全員tp
tp @a 0 153 0
#全員サバイバルに。tagのadminを持ってると変わらない
gamemode survival @a[tag=!admin]
#サバイバルの人をteam「player」に追加。
team join player @a[gamemode=survival]
#ling
summon minecraft:armor_stand 0 80 0 {NoAI:1b,NoGravity:1b,Marker:1b,Invisible:1b,Tags:[ling]}

#bossbar
bossbar add 3 "安全エリア収縮まで残り"
bossbar add 4 "エリア収縮中"
bossbar set minecraft:3 max 11100
bossbar set minecraft:4 max 18000
bossbar set minecraft:3 value 11400
bossbar set minecraft:4 value 18000
bossbar set minecraft:3 players @a
bossbar set minecraft:4 players @a
bossbar set minecraft:3 color green
bossbar set minecraft:4 color red
scoreboard players set 3 SHC 11700
scoreboard players set 4 SHC 18000