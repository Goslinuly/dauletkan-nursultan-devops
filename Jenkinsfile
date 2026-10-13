pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Nursultan'
        STUDENT_SURNAME = 'Dauletkan'
        STUDENT_GROUP   = 'IT2-2313'
        STUDENT_ID      = '37037'
        IMAGE_NAME      = 'dauletkan-nursultan-devops'
        CONTAINER_NAME  = 'dauletkan-nursultan-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --pretty="Commit used by Jenkins: %h %s (%an)"'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    echo "Student: $STUDENT_NAME $STUDENT_SURNAME"
                    echo "Group: $STUDENT_GROUP"
                    echo "Student ID: $STUDENT_ID"
                    chmod +x scripts/*.sh
                    bash -n scripts/Dauletkan_Nursultan_system.sh
                    ./scripts/Dauletkan_Nursultan_system.sh
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    test -f Dockerfile         && echo "OK: Dockerfile exists"
                    test -f docker-compose.yml && echo "OK: docker-compose.yml exists"
                    grep -q "Student ID: $STUDENT_ID" Dauletkan_Nursultan_info.txt && echo "OK: student info file is valid"
                    grep -q "^port=5000" config/app.conf && echo "OK: config/app.conf is valid"
                    echo "All tests passed"
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    docker build -t $IMAGE_NAME:$BUILD_NUMBER -t $IMAGE_NAME:latest .
                    docker images $IMAGE_NAME
                '''
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME 2>/dev/null || true
                    docker run -d --name $CONTAINER_NAME -p 5050:5000 \
                        -e STUDENT_NAME -e STUDENT_SURNAME -e STUDENT_GROUP -e STUDENT_ID \
                        $IMAGE_NAME:$BUILD_NUMBER
                    sleep 3
                    docker ps --filter name=$CONTAINER_NAME
                    docker logs $CONTAINER_NAME
                    docker exec $CONTAINER_NAME wget -qO- http://localhost:5000 | grep "Application is running successfully!"
                '''
            }
        }
    }

    post {
        success { echo "Pipeline for ${STUDENT_SURNAME} ${STUDENT_NAME} (${STUDENT_ID}) finished successfully" }
        failure { echo "Pipeline failed - check the stage marked in red" }
    }
}
