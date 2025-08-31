// script_reload_code mvm_outpost/tank_spawner

class TankSpawner {
	alternatePath = null
	useForwardSpawn = false;

	function init() {
		this.alternatePath = Entities.FindByName(null, "boss_path_B_1");
		this.disableForwardSpawn();
	}

	function enableForwardSpawn() {
		printl("----- Enable forward spawn")
		this.useForwardSpawn = true;
	}

	function disableForwardSpawn() {
		printl("----- Disable forward spawn")
		this.useForwardSpawn = false;
	}

	function teleportToForwardSpawn() {
		printl("----- Use forward: " + this.useForwardSpawn)
		if (this.useForwardSpawn == true) {
			local tank = Entities.FindByName(null, "tankboss_spawn");

			local targetPos = this.alternatePath.GetOrigin();
			tank.SetOrigin(targetPos);
		}
	}
}

::spawner <- TankSpawner();

function io_init() {
	spawner.init();
}

function io_enableForwardSpawn() {
	spawner.enableForwardSpawn();
}

function io_disableForwardSpawn() {
	spawner.disableForwardSpawn();
}

function io_teleportToForwardSpawn() {
	spawner.teleportToForwardSpawn();
}