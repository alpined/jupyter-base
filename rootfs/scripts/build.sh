
find /scripts/ -name "*.sh" -exec chmod 755 {} \;

# update the system
apk update && apk upgrade

for ff in /scripts/build.d/*.sh
do
	# process each script in numeric order
	echo "============================================================"
	echo "Processing script ${ff} ..."
	echo "============================================================"
	/bin/sh ${ff}
	# mark it done
	mv ${ff} ${ff}-done
done

# clean-up 
rm -fr /var/cache/apk/* /tmp/*
