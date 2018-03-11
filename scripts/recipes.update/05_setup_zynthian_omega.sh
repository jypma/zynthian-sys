#!/bin/bash

source "$ZYNTHIAN_SYS_DIR/scripts/zynthian_envars.sh"

if [ ! -f "$ZYNTHIAN_CONFIG_DIR/updates/omega" ]; then

	# Update ZynAddSubFX
	cd $ZYNTHIAN_SW_DIR
	mv zynaddsubfx zynaddsubfx.omega
	#rm -rf zynaddsubfx
	bash $ZYNTHIAN_RECIPE_DIR/install_zynaddsubfx.sh

	# Create flag for omega update
	if [ ! -d "$ZYNTHIAN_CONFIG_DIR/updates" ]; then
		mkdir "$ZYNTHIAN_CONFIG_DIR/updates"
	fi
	touch "$ZYNTHIAN_CONFIG_DIR/updates/omega"

	# Force Reboot
	touch $REBOOT_FLAGFILE
fi
