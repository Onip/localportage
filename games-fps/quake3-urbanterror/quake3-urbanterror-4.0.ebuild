MOD_DESC="total transformation realism based mod"
MOD_NAME="Urban Terror"
MOD_DIR="q3ut4"
MOD_BINS="ut4"

inherit games games-mods

HOMEPAGE="http://www.urbanterror.net/"
SRC_URI="
	http://unfoog.de/mirror/UrbanTerror40_full.zip
	ftp://mirrors.blueyonder.co.uk/mirrors/ftp.planetquake3.net/modifications/urbanterror/UrbanTerror40_full.zip
	http://www.ghozthosting.com/q3ut4/UrbanTerror40_full.zip
	http://hosting.map-depot.com/release/UrbanTerror40_full.zip
	http://outlands.quaddown.org/files/UrbanTerror40_full.zip
	http://dgames.vectranet.pl/UrbanTerror40_full.zip"

LICENSE="freedist"
SLOT="4"
RESTRICT="mirror strip"

KEYWORDS="-* ~amd64 ~ppc ~x86"

RDEPEND="ppc? ( games-fps/${GAME} )
		!ppc? (
		|| (
			games-fps/${GAME}
			games-fps/${GAME}-bin
			games-fps/ioUrbanTerror-bin ) )"


