#アイテムのクリック検知（ほぼテンプレ）
execute as @a[scores={GUImain=0}] store success score @s GUImain run clear @s minecraft:barrier{display:{Name:'{"text":"メインに戻る","italic":false}'}} 1
execute as @a[scores={GUImain=0}] store success score @s GUImain run clear @s minecraft:blue_stained_glass_pane{display:{Name:'{"text":"main"}'}} 1
execute as @a[scores={GUIbuki=0}] store success score @s GUIbuki run clear @s minecraft:iron_sword{display:{Name:'{"text":"武器","italic":false}'}} 1
execute as @a[scores={GUIbuki=0}] store success score @s GUIbuki run clear @s minecraft:blue_stained_glass_pane{display:{Name:'{"text":"buki","italic":false}'}} 1
execute as @a[scores={GUIbougu=0}] store success score @s GUIbougu run clear @s minecraft:diamond_chestplate{display:{Name:'{"text":"装備","italic":false}'}} 1
execute as @a[scores={GUIbougu=0}] store success score @s GUIbougu run clear @s minecraft:blue_stained_glass_pane{display:{Name:'{"text":"bougu","italic":false}'}} 1
execute as @a[scores={craft_copper_helmet=0}] store success score @s craft_copper_helmet run clear @s minecraft:leather_helmet{display:{Name:'[{"text":"銅のヘルメットを作る","italic":false}]',Lore:['{"text":"[必要素材]"}','{"text":"銅のインゴットx5"}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64} 1

#クラフト処理(アイテム数の検知→その結果に応じて反応→guibouguを再表示、クリックで増えたスコアボードを削除)
execute as @a[scores={craft_copper_helmet=1}] store result score @a have_coppaer_ingot run clear @s minecraft:copper_ingot 0
execute as @a[scores={craft_copper_helmet=1,have_coppaer_ingot=5..}] run clear @s minecraft:copper_ingot 5
execute as @a[scores={craft_copper_helmet=1,have_coppaer_ingot=5..}] run give @s minecraft:leather_helmet{display:{Name:'{"text":"銅のヘルメット","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}
execute as @a[scores={craft_copper_helmet=1,have_coppaer_ingot=5..}] run playsound minecraft:block.anvil.use player @s ~ ~ ~ 1 2
execute as @a[scores={craft_copper_helmet=1,have_coppaer_ingot=..4}] run tellraw @s "素材が不足しています"
execute as @a[scores={craft_copper_helmet=1,have_coppaer_ingot=..4}] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1 1
execute as @a[scores={craft_copper_helmet=1}] run scoreboard players set @s GUIbougu 1
execute as @a[scores={craft_copper_helmet=1}] run scoreboard players set @s craft_copper_helmet 0

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
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.10 with minecraft:leather_helmet{display:{Name:'[{"text":"銅のヘルメットを作る","italic":false}]',Lore:['{"text":"[必要素材]"}','{"text":"銅のインゴットx5"}'],color:16744448},Enchantments:[{id:"protection",lvl:1}],HideFlags:64}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.11 with minecraft:leather_chestplate{display:{Name:'{"text":"銅のチェストプレートを作る","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.12 with minecraft:leather_leggings{display:{Name:'{"text":"銅のレギンスを作る","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}
execute at @a[scores={GUIbougu=1}] run item replace entity @e[type=minecraft:chest_minecart,limit=1,sort=nearest] container.13 with minecraft:leather_boots{display:{Name:'{"text":"銅のブーツを作る","italic":false}',color:16744448},Enchantments:[{id:"protection",lvl:1}]}
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