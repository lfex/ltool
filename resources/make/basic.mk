get-version:
	@echo "Version info:\n"
	@echo "\t./bin/create-tool:\t" `grep 'version=' ./bin/create-tool | \
	head -1|awk -F= '{print $$2}'`
	@echo "\t./test/tests.sh:\t" `grep expectedversion test/tests.sh|head -1| \
		awk -F= '{print $$2}'|sed -e 's/"//g'`
	@echo "\tBuilt lfetool:\t\t" `./lfetool -v`
	@echo "\tLatest tag:\t\t" `git tag|tail -1`
	@echo

build-no-version:
	@echo "Building lfetool ..."
	@./bin/create-tool

build: get-version build-no-version
	@echo "Finished."

push-all:
	@echo "Pushing code to github ..."
	git push origin --all
	git push upstream --all
	git push origin --tags
	git push upstream --tags
