#/bin/sh

disablePkgsList="
./feeds/lienol/package/chinadns-ng 
./package/lean/baidupcs-web 
./package/lean/luci-app-baidupcs-web 
./package/lean/ipt2socks 
./feeds/packages/net/miniupnpd 
./feeds/packages/net/mwan3 
./feeds/packages/utils/ttyd 
./feeds/packages/utils/docker-ce 
./feeds/packages/utils/containerd 
./feeds/packages/utils/libnetwork 
./feeds/packages/utils/tini 
./package/network/services/dropbear 
./feeds/packages/net/https-dns-proxy 
./package/lean/luci-app-dockerman 
./package/lean/kcptun 
./feeds/luci/applications/luci-app-upnp
"

function disableDulicatedPkg()
{
	if [ -d $1 ];then
		rm -rf $1
		echo $1" Disabled."
	fi
}

./scripts/feeds update -a

for disablePkg in $disablePkgsList
do
	disableDulicatedPkg $disablePkg
done

./scripts/feeds update -i
./scripts/feeds install -a

if [ ! -f .config ];then
cp defconfig .config
echo "Default .config created."
fi
