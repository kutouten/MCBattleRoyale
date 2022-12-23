gamemode spectator @a[scores={death=1}]
execute store result score #GLOBAL alive if entity @a[gamemode=survival]
execute if score #1 alive matches 1 if score #GLOBAL alive matches 1 run function hogepack:end
execute at @a run fill ~-3 0 ~-3 ~3 0 ~3 minecraft:bedrock 

#op SHC ボスバーに表示するものたち
execute if score op SHC matches 1 run bossbar set minecraft:1 visible true
execute if score op SHC matches 1 run bossbar set minecraft:3 visible false
execute if score op SHC matches 1 run bossbar set minecraft:4 visible false
execute if score op SHC matches 3 run bossbar set minecraft:1 visible false
execute if score op SHC matches 3 run bossbar set minecraft:3 visible true
execute if score op SHC matches 4 run bossbar set minecraft:3 visible false
execute if score op SHC matches 4 run bossbar set minecraft:4 visible true
execute if score op SHC matches 4 run scoreboard players remove 4 SHC 1
execute if score op SHC matches 3 run scoreboard players remove 3 SHC 1
execute store result bossbar minecraft:3 value run scoreboard players get 3 SHC
execute store result bossbar minecraft:4 value run scoreboard players get 4 SHC

execute if score op SHC matches 1 run effect give @a minecraft:instant_health 20
execute if score op SHC matches 1 run effect give @a minecraft:saturation 20

#bossbarに秒数を表記
bossbar set 3 name [{"text":"安全エリア収縮開始まで 残り"},{"score":{"name":"timer","objective":"SHC"},"color":"green"},{"text":"秒"}]

#最終安置移動用
execute at @e[tag=ling] run worldborder center ~ ~
execute as @e[tag=ling] at @s facing entity @e[tag=ling2] feet if entity @a[distance=..33,gamemode=survival] run teleport @s ^ ^ ^0.1 ~ ~
execute at @e[tag=ling] if entity @e[tag=ling2,distance=..2] run spreadplayers ~ ~ 1 50 true @e[tag=ling2]

#待機時
execute if score op SHC matches 1 run effect give @a minecraft:instant_health 1
execute if score op SHC matches 1 run effect give @a minecraft:saturation 1

#カウントダウン用のタイマー(1以上なら1減らす)
execute if score #countdown SHC matches 1.. run scoreboard players remove #countdown SHC 1

#exit_rope
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"脱出用ロープ","italic":false}'},CustomModelData:1}}}] at @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'{"text":"脱出用ロープ","italic":false}'},CustomModelData:1}}}] if score @s ninzin matches 1 run tag @s add exit_rope_user
execute as @a[tag=exit_rope_user] at @s run spreadplayers ~ ~ 0 1 false @s
execute as @a[tag=exit_rope_user] run clear @s minecraft:carrot_on_a_stick{display:{Name:'{"text":"脱出用ロープ","italic":false}'},CustomModelData:1} 1
execute as @a[tag=exit_rope_user] run playsound minecraft:block.beacon.activate player @s ~ ~ ~ 1 1
execute as @a[tag=exit_rope_user] run effect give @s minecraft:weakness 3 3
execute as @a[tag=exit_rope_user] run effect give @s minecraft:blindness 3
execute as @a[tag=exit_rope_user] run effect give @s minecraft:slowness 3 127
execute as @a[tag=exit_rope_user] run effect give @s minecraft:jump_boost 3 250
execute as @a[tag=exit_rope_user] run tag @s remove exit_rope_user

#hunting_eye
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'[{"text":"Hunting eye","italic":false}]',Lore:['{"text":"半径20mの自分以外のプレイヤーに発光の効果を10秒付与する。"}','{"text":"発光は全員に表示される。"}']},CustomModelData:2}}}] at @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:'[{"text":"Hunting eye","italic":false}]',Lore:['{"text":"半径20mの自分以外のプレイヤーに発光の効果を10秒付与する。"}','{"text":"発光は全員に表示される。"}']},CustomModelData:2}}}] if score @s ninzin matches 1 run tag @s add hunting_eye_user
execute as @a[tag=hunting_eye_user] run clear @s minecraft:carrot_on_a_stick{display:{Name:'[{"text":"Hunting eye","italic":false}]',Lore:['{"text":"半径20mの自分以外のプレイヤーに発光の効果を10秒付与する。"}','{"text":"発光は全員に表示される。"}']},CustomModelData:2} 1
execute at @a[tag=hunting_eye_user] run effect give @e[distance=..20,tag=!hunting_eye_user] minecraft:glowing 10 1 true
execute as @a[tag=hunting_eye_user] run tag @s remove hunting_eye_user

#これより下にninzinを使った検知を書かないこと
execute as @a run scoreboard players set @a[scores={ninzin=1}] ninzin 0

#クラフト関連
#リンゴジュース
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:apple",Count:2b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add apple_bottle
execute at @e[tag=apple_bottle] run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"リンゴジュース","italic":false}]',Lore:['{"text":"のんだら元気いっぱい！"}']},CustomPotionEffects:[{Id:6,Amplifier:4b,Duration:0,Ambient:false,ShowParticles:true}],CustomPotionColor:16733695,Tags:[Crafted]}}}
execute at @e[tag=apple_bottle] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=apple_bottle] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=apple_bottle] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}]
execute as @e[tag=apple_bottle] run kill

#シールドバッテリークラフト
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:lapis_block",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add shield_battery
execute at @e[tag=shield_battery] run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"シールドバッテリー","italic":false}]',Lore:['{"text":"シールドをリチャージ中..."}']},CustomPotionEffects:[{Id:22,Amplifier:2b,Duration:36000,Ambient:false,ShowParticles:false}],CustomPotionColor:170,Tags:[crafted]}}}
execute at @e[tag=shield_battery] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=shield_battery] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=shield_battery] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}]
execute as @e[tag=shield_battery] run kill

#プロテインクラフト
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:chicken",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:beef",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:porkchop",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:mutton",Count:1b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass_bottle",Count:1b}}] run tag @s add purotein
execute at @e[tag=purotein] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:potion",Count:1b,tag:{display:{Name:'[{"text":"プロテイン","italic":false}]',Lore:['{"text":"うおおおおお！"}','{"text":"筋肉の力で強くなれるぞ！"}']},CustomPotionEffects:[{Id:1,Amplifier:0b,Duration:400,Ambient:false,ShowParticles:false},{Id:11,Amplifier:0b,Duration:400,Ambient:false,ShowParticles:false}],CustomPotionColor:4194304}}}
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

#脱出用ロープ
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:string",Count:2b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:feather",Count:1b}}] run tag @s add exit_rope
execute at @e[tag=exit_rope] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"脱出用ロープ","italic":false}'},CustomModelData:1}}}
execute at @e[tag=exit_rope] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=exit_rope] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=exit_rope] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:feather",Count:1b}}]
execute as @e[tag=exit_rope] run kill @s

#hunting_eye
execute as @e[type=item,nbt=!{Item:{tag:{Crafted:1b}}},nbt={Item:{id:"minecraft:spider_eye",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:glass",Count:1b}}] run tag @s add hunting_eye
execute at @e[tag=hunting_eye] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'[{"text":"Hunting eye","italic":false}]',Lore:['{"text":"半径20mの自分以外のプレイヤーに発光の効果を10秒付与する。"}','{"text":"発光は全員に表示される。"}']},CustomModelData:2}}}
execute at @e[tag=hunting_eye] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 1 64 force
execute at @e[tag=hunting_eye] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 1.6
execute at @e[tag=hunting_eye] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:glass",Count:1b}}]
execute as @e[tag=hunting_eye] run kill @s
