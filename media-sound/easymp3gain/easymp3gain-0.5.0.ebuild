# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="GUI for aacgain, mp3gain and vorbisgain"
HOMEPAGE="http://easymp3gain.sourceforge.net"
#SRC_URI="mirror://sourceforge/${PN}/${P}.src.tar.gz"
SRC_URI="${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S="${WORKDIR}/easymp3gain-gtk2_0.5.0-1_amd64"

DEPEND=">=dev-lang/fpc-2.4.0
	>=dev-lang/lazarus-0.9.28"
RDEPEND="x11-libs/gtk+:2"

src_prepare(){
	epatch "${FILESDIR}"/${P}-desktop.patch
}
