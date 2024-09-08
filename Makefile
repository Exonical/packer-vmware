.PHONY: update-gitlab-ci

update-gitlab-ci:
	gomplate -c build-ci.yaml -f build-ci.tmpl -o .gitlab-ci.yml
