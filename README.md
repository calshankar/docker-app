### Setting up Job in Jenkins
+ From the jenkins landing page, select new item to open up the project view
+ Select Pipeline as the project type, give it a name & click on "OK" to open up the project configuration page
+ For the pipeline definition, choose Pipeline script from SCM, and select git as the SCM option
+ Enter the repository url as "https://github.com/calshankar/docker-app" to let Jenkins know how to find your repository.
+ Specify the branch as "*/master" and add the name for jenkins file as "Jenkinsfile". This file is present in root path of the repo
+ This step is not mandatory -> You can choose to setup 'Poll SCM' by entering the value "H/5* * * *" for polling every 5 mins. The preferred option is to setup Webhook for jenkins job on the git repository configuration
+ Click on save to complete the job setup
+ If you do have not setup 'Poll SCM' or webhook, you need to manually trigger the job by clicking the play button or Build now option & watch the console ouput for the job trigerred on the screen for any runtime issues

Note:
+ The pipeline script assumes that docker-credential with the id "docker-hub-credentials" (spelled as is) already exist. If the credential does not exist, you can add it from Jenkins landing page by selecting credential & selecting "system credential". The username should not have '@' character (no e-mail address)

+ The job configuration assumes, docker is installed & deamon is already started/running

### Health Check option
Additional Health check option is added. To test from command line execute the following command in the order. Note the additional capability is required to bring down the network interface on the container
+ docker container run -d --name healthcheck_test --cap-add NET_ADMIN -p 8080:80 <image name with tags>

Let's introduce the problem which fails the health check
+ docker exec -it healthcheck_test /bin/bash -c "sleep 10; ip link set lo down; sleep 15; ip link set lo up"

Watch from one window to see the status of healthcheck toggling
+ watch -n 1 "docker container ls"

You can also watch historical record of docker State change events for last 10 mins
+ docker system events --since 10m --filter event=health

### How to install Jenkins
The instruction assumes that you will run the instruction on Ubuntu OS which can be installed via virtual box on windows or you can spin up any ubuntu machine on datacenter or free-tier cloud
https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-16-04

The instruction does not change much if you are running 'yum' based linux OS
### Docker command reference
+ http://files.zeroturnaround.com/pdf/zt_docker_cheat_sheet.pdf
+ https://dockerlux.github.io/pdf/cheat-sheet-v2.pdf
