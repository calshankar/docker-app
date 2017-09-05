node {
    def app
    
    stage('Clone repository') {
        /* Clone the repository to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image;
         * docker build on the command line */

        app = docker.build("demo-app")
    }

    stage('Push image') {
        /* Finally, push the image with tags to docker registry */

        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
