#! /bin/sh
for ff in /scripts/init.d/*.sh
do
	# process each script in numeric order
	/bin/sh ${ff}
done
