if (gameover == false) {
	if (oEnemy.hp <= 0) {
		gameover = true;
		playerWon = true;
		oEnemy.visible = false;
		oEnemy.disableInput = true;
		instance_create_depth(oEnemy.x, oEnemy.y, -5, oExplosion);
	}
	if (oPlayer.hp <= 0) {
		gameover = true;
		playerWon = false;
		oPlayer.visible = false;
		oPlayer.disableInput = true;
		instance_create_depth(oPlayer.x, oPlayer.y, -5, oExplosion);
	}
}
if (gameover == true) {
	gameoverTimer ++;
	
	if (gameoverTimer > 60) {
		show_message( playerWon ? "You win!" : "You lost!");
		game_restart();
	}
}
