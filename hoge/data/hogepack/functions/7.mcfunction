gamemode spectator @a[scores={death=1}]
execute store result score #GLOBAL alive if entity @a[gamemode=survival]
execute if score #1 alive matches 1 if score #GLOBAL alive matches 1 run function hogepack:end
execute at @a run fill ~-3 0 ~-3 ~3 0 ~3 minecraft:bedrock 
execute if score op SHC matches 1 run title @a actionbar {"color":"#6a5acd","text":"現在待機中..."}
execute if score op SHC matches 2 run title @a actionbar {"color":"#3cb371","text":"エリア拡大中..."}
execute if score op SHC matches 3 run title @a actionbar [{"text":"安全エリア収縮まで "},{"color":"#B11C4F","score":{"name":"timer","objective":"SHC"}},{"text":"秒","color":"#B11C4F"}]
execute if score op SHC matches 4 run title @a actionbar {"color":"#a52a2a","text":"エリア収縮中!"}
execute if score op SHC matches 1 run effect give @a minecraft:instant_health 1
execute if score op SHC matches 1 run effect give @a minecraft:saturation 1
time set 6000
#カウントダウン用のタイマー(1以上なら1減らす)
execute if score #countdown SHC matches 1.. run scoreboard players remove #countdown SHC 1

#リンゴとガラス瓶が作業台の上にあるとき、リンゴにタグ（apple_bottle）を付けます
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:apple",Count:2b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add apple_bottle
#タグ（apple_bottle）を持つエンティティから~ ~1 ~の位置にポーションを召喚します
execute at @e[tag=apple_bottle] run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"リンゴジュース","italic":false}]',Lore:['{"text":"のんだら元気いっぱい！"}']},CustomPotionEffects:[{Id:6,Amplifier:4b,Duration:0,Ambient:false,ShowParticles:true}],CustomPotionColor:16733695,Tags:[Crafted]}}}
#タグ（apple_bottle）を持つエンティティから~ ~1 ~の位置にパーティクルを出します
execute at @e[tag=apple_bottle] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
#タグ（apple_bottle）を持つエンティティの位置から金床の音を出します
execute at @e[tag=apple_bottle] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
#タグ（apple_bottle）を持つエンティティから一番近いガラス瓶をkillします
execute at @e[tag=apple_bottle] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}]
#タグ（apple_bottle）を持つエンティティをkillします
execute as @e[tag=apple_bottle] run kill


#シールドバッテリークラフト
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:lapis_block",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add shield_battery
execute at @e[tag=shield_battery] run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"シールドバッテリー","italic":false}]',Lore:['{"text":"シールドをリチャージ中..."}']},CustomPotionEffects:[{Id:22,Amplifier:4b,Duration:36000,Ambient:false,ShowParticles:false}],CustomPotionColor:170,Tags:[Crafted]}}}
execute at @e[tag=shield_battery] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=shield_battery] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=shield_battery] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}]
execute as @e[tag=shield_battery] run kill

#プロテインクラフト
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:chicken",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:beef",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:porkchop",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:mutton",Count:1b}}] run tag @s add purotein
execute at @e[tag=purotein] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"プロテイン","italic":false}]',Lore:['{"text":"うおおおおお！"}','{"text":"筋肉の力で強くなれるぞ！"}']},CustomPotionEffects:[{Id:1b,Amplifier:0b,Duration:1200,Ambient:false,ShowParticles:false},{Id:11b,Amplifier:0b,Duration:1200,Ambient:false,ShowParticles:false}],CustomPotionColor:4194304}}}
execute at @e[tag=purotein] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=purotein] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=purotein] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:beef",Count:1b}}]
execute at @e[tag=purotein] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:porkchop",Count:1b}}]
execute at @e[tag=purotein] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:mutton",Count:1b}}]
execute as @e[tag=purotein] run kill @s

#プロテインクラフト
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:chicken",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:beef",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:porkchop",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:mutton",Count:1b}}] run tag @s purotein