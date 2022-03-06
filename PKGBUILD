# Maintainer: Aditya Shakya <adi1090x@gmail.com>

pkgname=archcraft-herbstluftwm
pkgver=1.0
pkgrel=1
pkgdesc="herbstluftwm Configurations for Archcraft"
url="https://github.com/archcraft-os/archcraft-herbstluftwm"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('archcraft-skeleton' 'herbstluftwm' 'hsetroot')
conflicts=()
provides=("${pkgname}")
options=(!strip !emptydirs)
install="${pkgname}.install"

prepare() {
	cp -af ../files/. ${srcdir}
}

package() {
	local _config=${pkgdir}/etc/skel/.config/herbstluftwm
	mkdir -p "$_config"

	# Copy i3wm config files
	cp -r ${srcdir}/alacritty 		"$_config"
	cp -r ${srcdir}/bin 			"$_config"
	cp -r ${srcdir}/polybar 		"$_config"
	cp -r ${srcdir}/rofi 			"$_config"

	chmod +x "$_config"/bin/*
	chmod +x "$_config"/rofi/bin/*

	install -Dm 755 autostart   	"$_config"/autostart
	install -Dm 644 dunstrc   		"$_config"/dunstrc
	install -Dm 644 picom.conf   	"$_config"/picom.conf
}
