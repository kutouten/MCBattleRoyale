#アイテムのクリック検知（ほぼテンプレ）
execute as @a[scores={GUImain=0}] store success score @s GUImain run clear @s minecraft:barrier{display:{Name:'{"text":"メインに戻る","italic":false}'}} 1
execute as @a[scores={GUImain=0}] store success score @s GUImain run clear @s minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}} 1
execute as @a[scores={GUIbuki=0}] store success score @s GUIbuki run clear @s minecraft:iron_sword{display:{Name:'{"text":"武器","italic":false}'}} 1
execute as @a[scores={GUIbuki=0}] store success score @s GUIbuki run clear @s minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}} 1
execute as @a[scores={GUIbougu=0}] store success score @s GUIbougu run clear @s minecraft:diamond_chestplate{display:{Name:'{"text":"装備","italic":false}'}} 1
execute as @a[scores={GUIbougu=0}] store success score @s GUIbougu run clear @s minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}} 1
execute as @a[scores={GUIpotion=0}] store success score @s GUIpotion run clear @s minecraft:potion{display:{Name:'{"text":"ポーション","italic":false}'}} 1
execute as @a[scores={GUIpotion=0}] store success score @s GUIpotion run clear @s minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}} 1

execute as @a[scores={craft_copper_helmet=0}] store success score @s craft_copper_helmet run clear @s minecraft:leather_helmet{display:{Name:'[{"text":"銅のヘルメットを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"銅のインゴットx5","italic":false}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64} 1
execute as @a[scores={craft_copper_chestplate=0}] store success score @s craft_copper_chestplate run clear @s minecraft:leather_chestplate{display:{Name:'[{"text":"銅のチェストプレートを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"銅のインゴットx8","italic":false}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64} 1
execute as @a[scores={craft_copper_leggings=0}] store success score @s craft_copper_leggings run clear @s minecraft:leather_leggings{display:{Name:'[{"text":"銅のレギンスを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"銅のインゴットx7","italic":false}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64} 1
execute as @a[scores={craft_copper_boots=0}] store success score @s craft_copper_boots run clear @s minecraft:leather_boots{display:{Name:'[{"text":"銅のブーツを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"銅のインゴットx4","italic":false}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64} 1
execute as @a[scores={craft_apple_potion=0}] store success score @s craft_apple_potion run clear @s minecraft:potion{display:{Name:'[{"text":"リンゴジュース","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"リンゴx2","italic":false}','{"text":"ガラス瓶x1","italic":false}']},CustomPotionEffects:[{Id:6b,Amplifier:4b,Duration:0,Ambient:false,ShowParticles:true}],CustomPotionColor:16733695} 1
execute as @a[scores={craft_shield_potion=0}] store success score @s craft_shield_potion run clear @s minecraft:potion{display:{Name:'[{"text":"シールドバッテリーを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"ラピスラズリブロックx1","italic":false}','{"text":"ガラス瓶x1","italic":false}']},CustomPotionEffects:[{Id:22b,Amplifier:2b,Duration:36000,Ambient:false,ShowParticles:false}],CustomPotionColor:170} 1
execute as @a[scores={craft_protein=0}] store success score @s craft_protein run clear @s minecraft:potion{display:{Name:'[{"text":"プロテインを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"生の豚肉x1","italic":false}','{"text":"生の牛肉x1","italic":false}','{"text":"生の鶏肉x1","italic":false}','{"text":"生の羊肉x1","italic":false}','{"text":"ガラス瓶x1","italic":false}']},CustomPotionEffects:[{Id:1b,Amplifier:0b,Duration:400,Ambient:false,ShowParticles:false},{Id:11b,Amplifier:0b,Duration:400,Ambient:false,ShowParticles:false}],CustomPotionColor:4194304} 1
execute as @a[scores={craft_octane_potion=0}] store success score @s craft_octane_potion run clear @s minecraft:splash_potion{display:{Name:'[{"text":"興奮剤を作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"砂糖x3","italic":false}','{"text":"火薬x1","italic":false}','{"text":"種x1","italic":false}','{"text":"ガラス瓶x1","italic":false}']},CustomPotionEffects:[{Id:1b,Amplifier:2b,Duration:160,Ambient:false,ShowParticles:false},{Id:8b,Amplifier:2b,Duration:160,Ambient:false,ShowParticles:false}],CustomPotionColor:5635925} 1

#クラフト処理(アイテム数の検知→その結果に応じて反応→guibouguを再表示、クリックで増えたスコアボードを削除)
#銅のヘルメット
execute as @a[scores={craft_copper_helmet=1}] store result score @a have_coppaer_ingot run clear @s minecraft:copper_ingot 0
execute as @a[scores={craft_copper_helmet=1,have_coppaer_ingot=5..}] run clear @s minecraft:copper_ingot 5
execute as @a[scores={craft_copper_helmet=1,have_coppaer_ingot=5..}] run give @s minecraft:leather_helmet{display:{Name:'{"text":"銅のヘルメット","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64}
execute at @a[scores={craft_copper_helmet=1,have_coppaer_ingot=5..}] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute at @a[scores={craft_copper_helmet=1,have_coppaer_ingot=..4}] run playsound minecraft:entity.villager.no neutral @a ~ ~ ~ 1 1
execute as @a[scores={craft_copper_helmet=1,have_coppaer_ingot=..4}] run tellraw @s "素材が不足しています"
execute as @a[scores={craft_copper_helmet=1}] run scoreboard players set @s GUIbougu 1
execute as @a[scores={craft_copper_helmet=1}] run scoreboard players set @s craft_copper_helmet 0

#銅のチェストプレート
execute as @a[scores={craft_copper_chestplate=1}] store result score @a have_coppaer_ingot run clear @s minecraft:copper_ingot 0
execute as @a[scores={craft_copper_chestplate=1,have_coppaer_ingot=8..}] run clear @s minecraft:copper_ingot 8
execute as @a[scores={craft_copper_chestplate=1,have_coppaer_ingot=8..}] run give @s minecraft:leather_chestplate{display:{Name:'{"text":"銅のチェストプレート","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64} 1
execute at @a[scores={craft_copper_chestplate=1,have_coppaer_ingot=8..}] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute at @a[scores={craft_copper_chestplate=1,have_coppaer_ingot=..7}] run playsound minecraft:entity.villager.no neutral @a ~ ~ ~ 1 1
execute as @a[scores={craft_copper_chestplate=1,have_coppaer_ingot=..7}] run tellraw @s "素材が不足しています"
execute as @a[scores={craft_copper_chestplate=1}] run scoreboard players set @s GUIbougu 1
execute as @a[scores={craft_copper_chestplate=1}] run scoreboard players set @s craft_copper_chestplate 0

#銅のレギンス
execute as @a[scores={craft_copper_leggings=1}] store result score @a have_coppaer_ingot run clear @s minecraft:copper_ingot 0
execute as @a[scores={craft_copper_leggings=1,have_coppaer_ingot=7..}] run clear @s minecraft:copper_ingot 7
execute as @a[scores={craft_copper_leggings=1,have_coppaer_ingot=7..}] run give @s minecraft:leather_leggings{display:{Name:'{"text":"銅のレギンス","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64} 1
execute at @a[scores={craft_copper_leggings=1,have_coppaer_ingot=7..}] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute at @a[scores={craft_copper_leggings=1,have_coppaer_ingot=..6}] run playsound minecraft:entity.villager.no neutral @a ~ ~ ~ 1 1
execute as @a[scores={craft_copper_leggings=1,have_coppaer_ingot=..6}] run tellraw @s "素材が不足しています"
execute as @a[scores={craft_copper_leggings=1}] run scoreboard players set @s GUIbougu 1
execute as @a[scores={craft_copper_leggings=1}] run scoreboard players set @s craft_copper_leggings 0

#銅のブーツ
execute as @a[scores={craft_copper_boots=1}] store result score @a have_coppaer_ingot run clear @s minecraft:copper_ingot 0
execute as @a[scores={craft_copper_boots=1,have_coppaer_ingot=4..}] run clear @s minecraft:copper_ingot 4
execute as @a[scores={craft_copper_boots=1,have_coppaer_ingot=4..}] run give @s minecraft:leather_boots{display:{Name:'{"text":"銅のブーツ","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64} 1
execute at @a[scores={craft_copper_boots=1,have_coppaer_ingot=4..}] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute at @a[scores={craft_copper_boots=1,have_coppaer_ingot=..3}] run playsound minecraft:entity.villager.no neutral @a ~ ~ ~ 1 1
execute as @a[scores={craft_copper_boots=1,have_coppaer_ingot=..3}] run tellraw @s "素材が不足しています"
execute as @a[scores={craft_copper_boots=1}] run scoreboard players set @s GUIbougu 1
execute as @a[scores={craft_copper_boots=1}] run scoreboard players set @s craft_copper_boots 0

#リンゴジュース
execute as @a[scores={craft_apple_potion=1}] store result score @a have_apple run clear @s minecraft:apple 0
execute as @a[scores={craft_apple_potion=1}] store result score @a have_glass_bottle run clear @s minecraft:glass_bottle 0
execute as @a[scores={craft_apple_potion=1,have_apple=2..,have_glass_bottle=1..}] run tag @s add crafted_apple_potion
execute as @a[scores={craft_apple_potion=1,have_apple=..1}] run tag @s add miss_crafted_apple_potion
execute as @a[scores={craft_apple_potion=1,have_glass_bottle=..0}] run tag @s add miss_crafted_apple_potion
execute as @a[tag=crafted_apple_potion] run clear @s minecraft:apple 2
execute as @a[tag=crafted_apple_potion] run clear @s minecraft:glass_bottle 1
execute as @a[tag=crafted_apple_potion] run give @s minecraft:potion{display:{Name:'[{"text":"リンゴジュース","italic":false}]'},CustomPotionEffects:[{Id:6b,Amplifier:4b,Duration:0,Ambient:false,ShowParticles:true}],CustomPotionColor:16733695}
execute at @a[tag=crafted_apple_potion] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute as @a[tag=crafted_apple_potion] run tag @s remove crafted_apple_potion
execute as @a[tag=miss_crafted_apple_potion] run tellraw @s "素材が不足しています"
execute at @a[tag=miss_crafted_apple_potion] run playsound minecraft:entity.villager.no neutral @a ~ ~ ~ 1 1
execute as @a[tag=miss_crafted_apple_potion] run tag @s remove miss_crafted_apple_potion
execute as @a[scores={craft_apple_potion=1}] run scoreboard players set @s GUIpotion 1
execute as @a[scores={craft_apple_potion=1}] run scoreboard players set @s craft_apple_potion 0

#シールドバッテリー
execute as @a[scores={craft_shield_potion=1}] store result score @a have_lapis_block run clear @s minecraft:lapis_block 0
execute as @a[scores={craft_shield_potion=1}] store result score @a have_glass_bottle run clear @s minecraft:glass_bottle 0
execute as @a[scores={craft_shield_potion=1,have_lapis_block=1..,have_glass_bottle=1..}] run tag @s add crafted_shield_potion
execute as @a[scores={craft_shield_potion=1,have_glass_bottle=..0}] run tag @s add miss_crafted_shield_potion
execute as @a[scores={craft_shield_potion=1,have_lapis_block=..0}] run tag @s add miss_crafted_shield_potion
execute as @a[tag=crafted_shield_potion] run clear @s minecraft:lapis_block 1
execute as @a[tag=crafted_shield_potion] run clear @s minecraft:glass_bottle 1
execute as @a[tag=crafted_shield_potion] run give @s minecraft:potion{display:{Name:'[{"text":"シールドバッテリー","italic":false}]',},CustomPotionEffects:[{Id:22b,Amplifier:2b,Duration:36000,Ambient:false,ShowParticles:false}],CustomPotionColor:170}
execute at @a[tag=crafted_shield_potion] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute as @a[tag=crafted_shield_potion] run tag @s remove crafted_shield_potion
execute as @a[tag=miss_crafted_shield_potion] run tellraw @s "素材が不足しています"
execute at @a[tag=miss_crafted_shield_potion] run playsound minecraft:entity.villager.no neutral @a ~ ~ ~ 1 1
execute as @a[tag=miss_crafted_shield_potion] run tag @s remove miss_crafted_shield_potion
execute as @a[scores={craft_shield_potion=1}] run scoreboard players set @s GUIpotion 1
execute as @a[scores={craft_shield_potion=1}] run scoreboard players set @s craft_shield_potion 0

#プロテイン
execute as @a[scores={craft_protein=1}] store result score @a have_glass_bottle run clear @s minecraft:glass_bottle 0
execute as @a[scores={craft_protein=1}] store result score @a have_beef run clear @s minecraft:beef 0
execute as @a[scores={craft_protein=1}] store result score @a have_chicken run clear @s minecraft:chicken 0
execute as @a[scores={craft_protein=1}] store result score @a have_mutton run clear @s minecraft:mutton 0
execute as @a[scores={craft_protein=1}] store result score @a have_porkchop run clear @s minecraft:porkchop 0
execute as @a[scores={craft_protein=1,have_beef=1..,have_porkchop=1..,have_chicken=1..,have_mutton=1..,have_glass_bottle=1..}] run tag @s add crafted_protein
execute as @a[scores={craft_protein=1,have_beef=..0}] run tag @s add miss_crafted_protein
execute as @a[scores={craft_protein=1,have_chicken=..0}] run tag @s add miss_crafted_protein
execute as @a[scores={craft_protein=1,have_mutton=..0}] run tag @s add miss_crafted_protein
execute as @a[scores={craft_protein=1,have_porkchop=..0}] run tag @s add miss_crafted_protein
execute as @a[scores={craft_protein=1,have_glass_bottle=..0}] run tag @s add miss_crafted_protein
execute as @a[tag=crafted_protein] run clear @s minecraft:beef 1
execute as @a[tag=crafted_protein] run clear @s minecraft:porkchop 1
execute as @a[tag=crafted_protein] run clear @s minecraft:mutton 1
execute as @a[tag=crafted_protein] run clear @s minecraft:chicken 1
execute as @a[tag=crafted_protein] run clear @s minecraft:glass_bottle 1
execute as @a[tag=crafted_protein] run give @s minecraft:potion{display:{Name:'[{"text":"プロテイン","italic":false}]'},CustomPotionEffects:[{Id:1b,Amplifier:0b,Duration:400,Ambient:false,ShowParticles:false},{Id:11b,Amplifier:0b,Duration:400,Ambient:false,ShowParticles:false}],CustomPotionColor:4194304}
execute at @a[tag=crafted_protein] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute as @a[tag=crafted_protein] run tag @s remove crafted_protein
execute as @a[tag=miss_crafted_protein] run tellraw @s "素材が不足しています"
execute at @a[tag=miss_crafted_protein] run playsound minecraft:entity.villager.no neutral @a ~ ~ ~ 1 1
execute as @a[tag=miss_crafted_protein] run tag @s remove miss_crafted_protein
execute as @a[scores={craft_protein=1}] run scoreboard players set @s GUIpotion 1
execute as @a[scores={craft_protein=1}] run scoreboard players set @s craft_protein 0

#興奮剤
execute as @a[scores={craft_octane_potion=1}] store result score @a have_glass_bottle run clear @s minecraft:glass_bottle 0
execute as @a[scores={craft_octane_potion=1}] store result score @a have_gunpowder run clear @s minecraft:gunpowder 0
execute as @a[scores={craft_octane_potion=1}] store result score @a have_suger run clear @s minecraft:sugar 0
execute as @a[scores={craft_octane_potion=1}] store result score @a have_wheat_seeds run clear @s minecraft:wheat_seeds 0
execute as @a[scores={craft_octane_potion=1,have_gunpowder=1..,have_glass_bottle=1..,have_suger=3..,have_wheat_seeds=1..}] run tag @s add crafted_octane_potion
execute as @a[scores={craft_octane_potion=1,have_gunpowder=..0}] run tag @s add miss_crafted_octane_potion
execute as @a[scores={craft_octane_potion=1,have_suger=..2}] run tag @s add miss_crafted_octane_potion
execute as @a[scores={craft_octane_potion=1,have_wheat_seeds=..0}] run tag @s add miss_crafted_octane_potion
execute as @a[scores={craft_octane_potion=1,have_glass_bottle=..0}] run tag @s add miss_crafted_octane_potion
execute as @a[tag=crafted_octane_potion] run clear @s minecraft:glass_bottle 1
execute as @a[tag=crafted_octane_potion] run clear @s minecraft:sugar 3
execute as @a[tag=crafted_octane_potion] run clear @s minecraft:wheat_seeds 1
execute as @a[tag=crafted_octane_potion] run clear @s minecraft:gunpowder 1
execute as @a[tag=crafted_octane_potion] run give @s minecraft:splash_potion{display:{Name:'[{"text":"興奮剤","italic":false}]'},CustomPotionEffects:[{Id:1b,Amplifier:2b,Duration:160,Ambient:false,ShowParticles:false},{Id:8b,Amplifier:2b,Duration:160,Ambient:false,ShowParticles:false}],CustomPotionColor:5635925} 3
execute at @a[tag=crafted_octane_potion] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute as @a[tag=crafted_octane_potion] run tag @s remove crafted_octane_potion
execute as @a[tag=miss_crafted_octane_potion] run tellraw @s "素材が不足しています"
execute at @a[tag=miss_crafted_octane_potion] run playsound minecraft:entity.villager.no neutral @a ~ ~ ~ 1 1
execute as @a[tag=miss_crafted_octane_potion] run tag @s remove miss_crafted_octane_potion
execute as @a[scores={craft_octane_potion=1}] run scoreboard players set @s GUIpotion 1
execute as @a[scores={craft_octane_potion=1}] run scoreboard players set @s craft_octane_potion 0


#mainが1の時に開く
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.10 with minecraft:iron_sword{display:{Name:'{"text":"武器","italic":false}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.12 with minecraft:diamond_chestplate{display:{Name:'{"text":"装備","italic":false}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.14 with minecraft:potion{display:{Name:'{"text":"ポーション","italic":false}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.16 with minecraft:stick{display:{Name:'{"text":"その他","italic":false}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.0 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.1 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.2 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.3 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.4 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.5 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.6 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.7 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.8 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.9 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.11 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.13 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.15 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.17 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.18 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.19 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.20 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.21 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.22 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.23 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.24 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.25 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute at @a[scores={GUImain=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.26 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}}
execute as @a[scores={GUImain=1}] run scoreboard players set @s GUImain 0

#guibukiが1の時に開く
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.0 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.1 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.2 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.3 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.4 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.5 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.6 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.7 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.8 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.9 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.10 with minecraft:wooden_sword{display:{Name:'{"text":"木の剣を作る","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.11 with minecraft:iron_sword{display:{Name:'{"text":"鉄の剣を作る","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.12 with minecraft:golden_sword{display:{Name:'{"text":"金の剣を作る","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.13 with minecraft:diamond_sword{display:{Name:'{"text":"ダイヤの剣を作る","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.14 with minecraft:netherite_sword{display:{Name:'{"text":"ネザライトの剣を作る","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.15 with minecraft:bow{display:{Name:'{"text":"弓を作る","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.16 with minecraft:arrow{display:{Name:'{"text":"矢を作る","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.17 with minecraft:arrow{display:{Name:'{"text":"次のページ","italic":false}'},Enchantments:[{id:"protection",lvl:0}],HideFlags:1}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.18 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.19 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.20 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.21 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.22 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.23 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.24 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.25 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}}
execute at @a[scores={GUIbuki=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.26 with minecraft:barrier{display:{Name:'{"text":"メインに戻る","italic":false}'}}
execute as @a[scores={GUIbuki=1}] run scoreboard players set @s GUIbuki 0

#bouguが1の時開く
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.0 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.1 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.2 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.3 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.4 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.5 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.6 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.7 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.8 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.9 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.10 with minecraft:leather_helmet{display:{Name:'[{"text":"銅のヘルメットを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"銅のインゴットx5","italic":false}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.11 with minecraft:leather_chestplate{display:{Name:'[{"text":"銅のチェストプレートを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"銅のインゴットx8","italic":false}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.12 with minecraft:leather_leggings{display:{Name:'[{"text":"銅のレギンスを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"銅のインゴットx7","italic":false}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.13 with minecraft:leather_boots{display:{Name:'[{"text":"銅のブーツを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"銅のインゴットx4","italic":false}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.14 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.15 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.16 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.17 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.18 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.19 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.20 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.21 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.22 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.23 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.24 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.25 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.26 with minecraft:barrier{display:{Name:'{"text":"メインに戻る","italic":false}'}}
execute as @a[scores={GUIbougu=1}] run scoreboard players set @s GUIbougu 0

#GUIpotionが1の時開く
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.0 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.1 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.2 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.3 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.4 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.5 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.6 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.7 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.8 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.9 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.10 with minecraft:potion{display:{Name:'[{"text":"リンゴジュース","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"リンゴx2","italic":false}','{"text":"ガラス瓶x1","italic":false}']},CustomPotionEffects:[{Id:6b,Amplifier:4b,Duration:0,Ambient:false,ShowParticles:true}],CustomPotionColor:16733695}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.11 with minecraft:potion{display:{Name:'[{"text":"シールドバッテリーを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"ラピスラズリブロックx1","italic":false}','{"text":"ガラス瓶x1","italic":false}']},CustomPotionEffects:[{Id:22b,Amplifier:2b,Duration:36000,Ambient:false,ShowParticles:false}],CustomPotionColor:170}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.12 with minecraft:potion{display:{Name:'[{"text":"プロテインを作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"生の豚肉x1","italic":false}','{"text":"生の牛肉x1","italic":false}','{"text":"生の鶏肉x1","italic":false}','{"text":"生の羊肉x1","italic":false}','{"text":"ガラス瓶x1","italic":false}']},CustomPotionEffects:[{Id:1b,Amplifier:0b,Duration:400,Ambient:false,ShowParticles:false},{Id:11b,Amplifier:0b,Duration:400,Ambient:false,ShowParticles:false}],CustomPotionColor:4194304}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.13 with minecraft:splash_potion{display:{Name:'[{"text":"興奮剤を作る","italic":false}]',Lore:['{"text":"[必要素材]","italic":false}','{"text":"砂糖x3","italic":false}','{"text":"火薬x1","italic":false}','{"text":"種x1","italic":false}','{"text":"ガラス瓶x1","italic":false}']},CustomPotionEffects:[{Id:1b,Amplifier:2b,Duration:160,Ambient:false,ShowParticles:false},{Id:8b,Amplifier:2b,Duration:160,Ambient:false,ShowParticles:false}],CustomPotionColor:5635925}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.14 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.15 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.16 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.17 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.18 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.19 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.20 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.21 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.22 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.23 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.24 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.25 with minecraft:blue_stained_glass_pane{display:{Name:'{"text":"potion","italic":false}'}}
execute at @a[scores={GUIpotion=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.26 with minecraft:barrier{display:{Name:'{"text":"メインに戻る","italic":false}'}}
execute as @a[scores={GUIpotion=1}] run scoreboard players set @s GUIpotion 0

#コンパス持ってるときだけチェストロッコ呼び出し
scoreboard players add @a[nbt={SelectedItem:{id:"minecraft:compass"}}] have_compass 1
scoreboard players set @a[nbt=!{SelectedItem:{id:"minecraft:compass"}}] have_compass 0
execute at @a[scores={have_compass=1}] run summon minecraft:chest_minecart ~ ~1.2 ~ {CustomName:'{"text":"SHC_menu"}',Tags:[GUI],Invulnerable:true,Silent:true,NoGravity:true}
execute at @a[scores={have_compass=1..}] run tp @e[tag=GUI,limit=1,distance=0..3,sort=nearest] ~ ~1.2 ~
execute as @a[scores={have_compass=1}] run scoreboard players set @s GUImain 1
execute at @a[scores={have_compass=0}] run tp @e[tag=GUI,distance=..3] ~ ~-256 ~