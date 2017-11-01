#
pjName := example-cfx-redux-todo

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-v $$(pwd):/root/${pjName} \
		-p 3000:3000 \
		mooxe/node \
		/bin/bash