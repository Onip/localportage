# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="source"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="TuxGuitar is a multitrack guitar tablature editor and player written in Java-SWT, it can open GP3 and GP4 files"
HOMEPAGE="http://www.herac.com.ar/soluciones/tuxguitar.htm"
SRC_URI="mirror://sourceforge/${PN}/TuxGuitar-${PV}-src.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"

KEYWORDS="~x86 ~amd64"

RDEPEND="virtual/libc
		|| ( ( x11-libs/libXxf86vm
				x11-libs/libXext
				x11-libs/libX11
			) virtual/x11 )
		>=virtual/jre-1.5
		dev-java/swt
		dev-java/itext"
DEPEND=">=virtual/jdk-1.5
		dev-java/ant-core
		${RDEPEND}"

IUSE=""

S="${WORKDIR}/TuxGuitar-${PV}-src"

src_unpack() {
	unpack ${A}

	sed -i -e "s/lib\.itext\.jar=lib\/itext-.*/lib\.itext\.jar=lib\/itext\.jar/" ${S}/build.properties

	mkdir -p ${S}/lib
	cd ${S}/lib
	java-pkg_jar-from swt-3
	java-pkg_jar-from itext iText.jar itext.jar
}

src_compile() {
	eant
}

src_install() {
	java-pkg_dojar TuxGuitar.jar

	java-pkg_addcp "/usr/share/tuxguitar"

	use source && java-pkg_dosrc src/org

	java-pkg_dolauncher ${PN} \
		--main org.herac.tuxguitar.gui.TuxGuitar \
		--java_args "-Xms128m -Xmx128m"

	# Images and Files
	cp -r share/* ${D}/usr/share/${PN}/

	dodir /usr/share/pixmaps/
	cp share/files/icon.png ${D}/usr/share/pixmaps/tuxguitar-icon.png
	make_desktop_entry ${PN} TuxGuitar tuxguitar-icon.png
}
