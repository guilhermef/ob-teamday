BUILD_IMAGE_NAME=gradle-build
DEPLOY_IMAGE_NAME=spring-boot-project
RUN_IN_DOCKER=docker run -it -p 8080:8080 -v $(PWD)/java/spring-boot-project:/home/gradle/app $(BUILD_IMAGE_NAME)

_build_initial_container:
	@docker build -f Dockerfile.build -t $(BUILD_IMAGE_NAME) .

build: _build_initial_container
	@$(RUN_IN_DOCKER) gradle build
	@mkdir -p $(PWD)/tmp
	@cp $(PWD)/java/spring-boot-project/build/libs/spring-boot-project-1.0-SNAPSHOT.jar $(PWD)/tmp/app.jar
	@docker build -t $(DEPLOY_IMAGE_NAME) .
	@echo "$(DEPLOY_IMAGE_NAME) generated, have fun!"

run: _build_initial_container
	@$(RUN_IN_DOCKER) gradle run

run_deployable: build
	@docker run -p 8080:8080 $(DEPLOY_IMAGE_NAME)
