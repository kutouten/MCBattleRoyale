spreadplayers 0 0 0 128 false @e[team=ling]
execute at @e[team=ling] run tp @e[team=ling] ~ ~128 ~
worldborder set 2156
execute at @e[team=ling] run worldborder center ~ ~
execute at @e[team=ling] run setworldspawn ~ ~ ~
schedule function hogepack:8 120s append
