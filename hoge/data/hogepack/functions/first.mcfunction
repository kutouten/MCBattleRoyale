gamemode survival @a
tp @a 0 153 0
fill 3 150 3 -3 150 -3 minecraft:bedrock
worldborder center 0.5 0.5
worldborder set 7
team add kill
team modify kill nametagVisibility never
team modify kill friendlyFire false
scoreboard objectives add death deathCount
scoreboard objectives add alive dummy
scoreboard objectives add SHC dummy
setworldspawn 0 153 0
team add ling
summon minecraft:armor_stand 0 256 0 {NoAI:2b,NoGravity:2b}
team join ling @e[type=minecraft:armor_stand]
scoreboard players set op SHC 1
scoreboard players set timer SHC 420