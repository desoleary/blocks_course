## Docker Development


#### 1a. Working with a new docker image

```
touch ~/dev/truleads/frontend/ember-cli.Dockerfile
```

```
docker build -t registry.gitlab.com/codetouch/truweb/truleads/clickhook/ember-cli:3.3.0-node_8.11 -f ember-cli.Dockerfile .
```

#### 1b. Working with an existing docker image

*Ensure to find an image that matches what you are deploying and compare it to the official images* `E.g. danlynn/ember-cli:3.3.0-node_8.11`

	docker pull danlynn/ember-cli:3.3.0-node_8.11

#### 2. Log into Docker

	docker login registry.gitlab.com
	# Username: desoleary
	# Password: USE ACCESS TOKEN from https://gitlab.com/profile/personal_access_tokens
	# Login Succeeded

#### 3. Retrieve image details

	# perform lookup by docker image name
	docker image ls | grep -E -i -w 'clickhook/ember-cli|IMAGE ID'

	# REPOSITORY                                                          TAG                 IMAGE ID            CREATED             SIZE
	# registry.gitlab.com/codetouch/truweb/truleads/clickhook/ember-cli   3.3.0-node_8.11     97624e29d1a2        34 minutes ago      4.59GB

#### 4. Log into image bash shell

*Ensure to use the correct WORKDIR used inside the Dockerfile* `/usr/src/app`

	# enter shell with `IMAGE ID`
	docker run --rm -ti -v ${pwd}:/usr/src/app <IMAGE ID> bash # E.g. docker run --rm -ti -v ${pwd}:/usr/src/app 97624e29d1a2 bash

	# enter shell with `REPOSITORY:TAG`
	docker run --rm -ti -v ${pwd}:/usr/src/app <REPOSITORY>:<TAG> bash # E.g. docker run --rm -ti -v ${pwd}:/usr/src/app registry.gitlab.com/codetouch/truweb/truleads/clickhook/ember-cli:3.3.0-node_8.11 bash

#### 5. Push image to Gitlab Registry
	docker push registry.gitlab.com/codetouch/truWeb/truLeads/clickhook/ember-cli:3.3.0-node_8.16.0
