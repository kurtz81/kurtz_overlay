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

pkg_nofetch() {
    eerror "Please contact Kurtz for tar.gz package to copy in distfiles directory."
}

src_prepare(){
	cd "${S}"
	epatch "${FILESDIR}/${P}-desktop.patch"
}

src_install() {
	#${WORKDIR}

    dodir /opt/easymp3gain

    insinto /opt/easymp3gain
    #doins -r "${S}/*" "/"

    doins -r "${S}/icons/" "/"
	doins -r "${S}/lang/" "/"
	doins -r "${S}/help/" "/"
	doins "${S}/easymp3gain" "/"
	fperms 0755 "/opt/easymp3gain/easymp3gain"
	doins "${S}/RELEASE.txt" "/"
	doins "${S}/README.txt" "/"
	doins "${S}/CHANGELOG.txt" "/"
	doins "${S}/AUTHORS" "/"

	dosym "/opt/easymp3gain/easymp3gain" "/usr/bin/easymp3gain"

    insinto /usr/share/applications
    newins "${S}/applications/easymp3gain.desktop" "easymp3gain.desktop"

#    doicon sylpheed.png
#    domenu sylpheed.desktop

}
