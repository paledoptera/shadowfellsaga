event_inherited();

global.enemyTurn="semi";
global.enemyTargetNum=1;
overrideBulletDestruction=false;
readyCutscene = false;
enemy.idle=spr_semigun;
enemy._name="Semi Sheriff";
enemy.es0=global.elements[0,0];
enemy.es1=global.elements[4,1];
enemy.hp = 145;
SetEnemyState("idle")