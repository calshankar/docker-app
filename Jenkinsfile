node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Clean up') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
      
        sh 'docker ps -aq | xargs docker stop'
        sh 'docker ps -aq | xargs docker rm -v'
        sh 'docker rmi shankar-app'        
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("shankar-app")
    }

    stage('Run image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        sh 'docker run -d -p 8082:80 --name=dumb_dummer shankar-app'
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        sh 'curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:8082'
    }
}
