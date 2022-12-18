execute if score #countdown SHC matches 100 run title @a subtitle 5
execute if score #countdown SHC matches 100 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 80 run title @a subtitle 4
execute if score #countdown SHC matches 80 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 60 run title @a subtitle 3
execute if score #countdown SHC matches 60 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 40 run title @a subtitle 2
execute if score #countdown SHC matches 40 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 20 run title @a subtitle 1
execute if score #countdown SHC matches 20 run title @a title {"text":"開始まで..."}
execute if score #countdown SHC matches 0 run function hogepack:start