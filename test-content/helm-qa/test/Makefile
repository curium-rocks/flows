update-test-charts:
	helm dependency build
	find charts -name '*.tgz' -exec tar -xzf {} -C charts \;  -exec rm {} \;
