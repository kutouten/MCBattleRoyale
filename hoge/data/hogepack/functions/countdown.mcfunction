execute if score #countdown SHC matches 100 run title @a subtitle 5
execute if score #countdown SHC matches 100 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 100 run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 1 1
execute if score #countdown SHC matches 80 run title @a subtitle 4
execute if score #countdown SHC matches 80 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 80 run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 1 1
execute if score #countdown SHC matches 60 run title @a subtitle 3
execute if score #countdown SHC matches 60 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 60 run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 1 1
execute if score #countdown SHC matches 40 run title @a subtitle 2
execute if score #countdown SHC matches 40 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 40 run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 1 1
execute if score #countdown SHC matches 20 run title @a subtitle 1
execute if score #countdown SHC matches 20 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 20 run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 1 1
execute if score #countdown SHC matches 0 run function hogepack:start
execute if score #countdown SHC matches 0 run playsound minecraft:block.note_block.bit player @a ~ ~ ~ 2 2 1