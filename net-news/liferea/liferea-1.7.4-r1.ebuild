# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-news/liferea/liferea-1.7.4.ebuild,v 1.1 2010/04/19 03:20:11 vostorga Exp $

EAPI="2"

inherit eutils gnome2
GCONF_DEBUG="no"

MY_P="${P/_/-}"

DESCRIPTION="News Aggregator for RDF/RSS/CDF/Atom/Echo/etc feeds"
HOMEPAGE="http://liferea.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="dbus libnotify networkmanager"

RDEPEND=">=x11-libs/gtk+-2.18.0:2
	>=dev-libs/glib-2.16.0:2
	>=x11-libs/pango-1.4.0
	gnome-base/gconf:2
	dev-libs/libunique
	>=dev-libs/libxml2-2.6.27
	>=dev-libs/libxslt-1.1.19
	>=dev-db/sqlite-3.6.10:3
	>=net-libs/libsoup-2.30.2-r1
	>=net-libs/webkit-gtk-1.1.11
	libnotify? ( >=x11-libs/libnotify-0.3.2 )
	dbus? ( >=dev-libs/dbus-glib-0.71 )
	networkmanager? ( net-misc/networkmanager dev-libs/dbus-glib )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig"

DOCS="AUTHORS ChangeLog README"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}/google-reader-auth.patch"
}
pkg_setup() {
	G2CONF="${G2CONF}
		--enable-sm
		--disable-schemas-install
		$(use_enable dbus)
		$(use_enable networkmanager nm)
		$(use_enable libnotify)"
}
