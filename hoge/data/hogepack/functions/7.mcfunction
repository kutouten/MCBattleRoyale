gamemode spectator @a[scores={death=1}]
execute store result score #GLOBAL alive if entity @a[gamemode=survival]
execute if score #1 alive matches 1 if score #GLOBAL alive matches 1 run function hogepack:end
execute at @a run fill ~-3 0 ~-3 ~3 0 ~3 minecraft:bedrock 

#op SHC アクションバーに表示するものたち
execute if score op SHC matches 1 run title @a actionbar {"color":"#6a5acd","text":"現在待機中..."}
execute if score op SHC matches 3 run title @a actionbar [{"text":"安全エリア収縮まで "},{"color":"#B11C4F","score":{"name":"timer","objective":"SHC"}},{"text":"秒","color":"#B11C4F"}]
execute if score op SHC matches 4 run title @a actionbar {"color":"#a52a2a","text":"エリア収縮中!"}
execute if score op SHC matches 1 run effect give @a minecraft:instant_health 20
execute if score op SHC matches 1 run effect give @a minecraft:saturation 20

#最終安置移動用
execute at @e[tag=ling] run worldborder center ~ ~
execute as @e[tag=ling] at @s facing entity @e[tag=ling2] feet if entity @p[distance=1..] run teleport @s ^ ^ ^0.1 ~ ~
execute at @e[tag=ling] if entity @e[tag=ling2,distance=0..2] run spreadplayers ~ ~ 1 50 true @e[tag=ling2]

#待機時
execute if score op SHC matches 1 run effect give @a minecraft:instant_health 1
execute if score op SHC matches 1 run effect give @a minecraft:saturation 1

#カウントダウン用のタイマー(1以上なら1減らす)
execute if score #countdown SHC matches 1.. run scoreboard players remove #countdown SHC 1

#リンゴとガラス瓶が作業台の上にあるとき、リンゴにタグ（apple_bottle）を付けます
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:apple",Count:2b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add apple_bottle
#タグ（apple_bottle）を持つエンティティから~ ~1 ~の位置にポーションを召喚します
execute at @e[tag=apple_bottle] run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"リンゴジュース","italic":false}]',Lore:['{"text":"のんだら元気いっぱい！"}']},CustomPotionEffects:[{Id:6b,Amplifier:4b,Duration:0,Ambient:false,ShowParticles:true}],CustomPotionColor:16733695,Tags:[Crafted]}}}
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
execute at @e[tag=shield_battery] run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"シールドバッテリー","italic":false}]',Lore:['{"text":"シールドをリチャージ中..."}']},CustomPotionEffects:[{Id:22b,Amplifier:4b,Duration:36000,Ambient:false,ShowParticles:false}],CustomPotionColor:170,Tags:[crafted]}}}
execute at @e[tag=shield_battery] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=shield_battery] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=shield_battery] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}]
execute as @e[tag=shield_battery] run kill

#プロテインクラフト
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:chicken",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:beef",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:porkchop",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:mutton",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add purotein
execute at @e[tag=purotein] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"プロテイン","italic":false}]',Lore:['{"text":"うおおおおお！"}','{"text":"筋肉の力で強くなれるぞ！"}']},CustomPotionEffects:[{Id:1b,Amplifier:0b,Duration:1200,Ambient:false,ShowParticles:false},{Id:11b,Amplifier:0b,Duration:1200,Ambient:false,ShowParticles:false}],CustomPotionColor:4194304}}}
execute at @e[tag=purotein] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=purotein] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=purotein] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:beef",Count:1b}}]
execute at @e[tag=purotein] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:porkchop",Count:1b}}]
execute at @e[tag=purotein] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:mutton",Count:1b}}]
execute at @e[tag=purotein] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}]
execute as @e[tag=purotein] run kill @s

#エンパクラフト
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:rotten_flesh",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:string",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:bone",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:gunpowder",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass",Count:1b}}] run tag @s add enpa
execute at @e[tag=enpa] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:ender_pearl",Count:1b}}
execute at @e[tag=enpa] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=enpa] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=enpa] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:gunpowder",Count:1b}}]
execute at @e[tag=enpa] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:string",Count:1b}}]
execute at @e[tag=enpa] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:bone",Count:1b}}]
execute at @e[tag=enpa] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass",Count:1b}}]
execute as @e[tag=enpa] run kill @s

#銅ブーツ
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:copper_ingot",Count:4b}}] at @s if block ~ ~-1 ~ crafting_table run tag @s add doubu-tu
execute at @e[tag=doubu-tu] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:leather_boots",Count:1b,tag:{display:{Name:'{"text":"銅のブーツ","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}}}
execute at @e[tag=doubu-tu] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=doubu-tu] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute as @e[tag=doubu-tu] run kill @s

#銅ヘルメット
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:copper_ingot",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:leather_boots",Count:1b,tag:{display:{Name:'{"text":"銅のブーツ","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}}}] run tag @s add douherumetto
execute at @e[tag=douherumetto] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:leather_helmet",Count:1b,tag:{display:{Name:'{"text":"銅のヘルメット","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}}}
execute at @e[tag=douherumetto] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=douherumetto] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=douherumetto] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:leather_boots",Count:1b,tag:{display:{Name:'{"text":"銅のブーツ","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]} }}]
execute as @e[tag=douherumetto] run kill @s

#銅レギンス
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:copper_ingot",Count:2b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:leather_helmet",Count:1b,tag:{display:{Name:'{"text":"銅のヘルメット","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}}}] run tag @s add doureginsu
execute at @e[tag=doureginsu] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:leather_leggings",Count:1b,tag:{display:{Name:'{"text":"銅のレギンス","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}}}
execute at @e[tag=doureginsu] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=doureginsu] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=doureginsu] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:leather_helmet",Count:1b,tag:{display:{Name:'{"text":"銅のヘルメット","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]} }}]
execute as @e[tag=doureginsu] run kill @s

#銅チェストプレート
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:2b}}},nbt={Item:{id:"minecraft:copper_ingot",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:leather_leggings",Count:1b,tag:{display:{Name:'{"text":"銅のレギンス","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}}}] run tag @s add doutyesuto
execute at @e[tag=doutyesuto] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{Name:'{"text":"チェストプレート","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}}}
execute at @e[tag=doutyesuto] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=doutyesuto] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=doutyesuto] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:leather_leggings",Count:1b,tag:{display:{Name:'{"text":"銅のレギンス","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]} }}]
execute as @e[tag=doutyesuto] run kill @s

#興奮剤
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:sugar",Count:3b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:gunpowder",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:wheat_seeds",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add okutan
execute at @e[tag=okutan] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:splash_potion",Count:3b,tag:{display:{Name:'[{"text":"興奮剤","italic":false}]',Lore:['{"text":"「これじゃ足りねぇ。まだまだアゲるぞ！」"}','{"text":"副作用としてダメージを食らうのでそれで死なないようにネ"}']},CustomPotionEffects:[{Id:1b,Amplifier:2b,Duration:140,Ambient:false,ShowParticles:true},{Id:8b,Amplifier:2b,Duration:140,Ambient:false,ShowParticles:true},{Id:7b,Amplifier:0b,Duration:1,Ambient:false,ShowParticles:true}],CustomPotionColor:65280}}}
execute at @e[tag=okutan] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=okutan] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=okutan] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:gunpowder",Count:1b}}]
execute at @e[tag=okutan] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}]
execute at @e[tag=okutan] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:wheat_seeds",Count:1b}}]
execute as @e[tag=okutan] run kill @s