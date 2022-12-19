title @a title "START"
playsound minecraft:block.note_block.bit player @a ~ ~ ~ 1 2
fill 3 150 3 -3 150 -3 minecraft:air
worldborder set 2000 
effect give @a minecraft:resistance 20 255 true
effect give @a minecraft:invisibility 150 1 true
team modify kill friendlyFire true
scoreboard players set #1 alive 1
schedule function hogepack:6 450s append
give @a minecraft:cooked_beef 16
give @a minecraft:compass 1
schedule function hogepack:timer 150s append
schedule function hogepack:timer2 150s append
scoreboard players set op SHC 2
#countdownが常時実行されないように
scoreboard players set #countdown SHC -1

#テストで始まった瞬間分散するように
spreadplayers ~ ~ 50 1000 false @a