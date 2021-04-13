//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "$HOME/.config/dwmblocks/music",	1,		0},
	{"", "$HOME/.config/dwmblocks/getvol",	1,		0},
	{"", "$HOME/.config/dwmblocks/kblayout",	1,		0},
	{"󰍛 ", "$HOME/.config/dwmblocks/getcpu",	1,		0},
	{"󰘚 ", "$HOME/.config/dwmblocks/getram",	30,		0},
	{"󰃭 ", "$HOME/.config/dwmblocks/date",	60,		0},
	{"󰅐 ", "$HOME/.config/dwmblocks/clock",					1,		0},
	//{"      ", "",					0,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "  ";
static unsigned int delimLen = 5;
