node {
    def app

    stage('Clone repository') {
        /* Clone the repository to our workspace */

        checkout scm
    }

    stage('Clean up') {
        /* The commands builds the actual image; similar to
         * docker build on the command line */
      
        sh 'docker ps -aq | xargs docker stop'
        sh 'docker ps -aq | xargs docker rm -v'
        sh 'docker rmi demo-app'
    }

    stage('Build image') {
        /* This builds the actual image;
         * docker build on the command line */

        app = docker.build("demo-app")
    }

    stage('Run image') {
        /* Running the Image, similar to 'run' command from Shell */

        sh 'docker run -d -p 8082:80 --name=learntek_demo demo-app'
    }

    stage('Test image') {
        /* Test our index.html webpage hosted on the container on host port 8082 */

        sh 'curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:8082'
    }
  
    stage('Push image') {
        /* Finally, push the image with tags to docker registry */

        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
