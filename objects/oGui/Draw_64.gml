var _playerWidth = (oPlayer.hp / oPlayer.maxhp) * 500;

draw_set_color(c_black);
draw_rectangle(9, 9, 9+_playerWidth+2, 21, false);

draw_set_color(/*#*/0x73D859);
draw_rectangle(10, 10, 10+_playerWidth, 20, false);

var _enemyWidth = (oEnemy.hp / oEnemy.maxhp) * 500;

draw_set_color(c_black);
draw_rectangle(1600-9, 9, 1600-9-_enemyWidth-2, 21, false);

draw_set_color(/*#*/0x73D859);
draw_rectangle(1600-10, 10, 1600-10-_enemyWidth, 20, false);