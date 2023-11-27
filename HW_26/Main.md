1. Познакомиться с описанием проекта spring-petclinic, изучить какие инструменты нужны для его сборки.
2. Создать статический Jenkins агент (можно использовать WSL), установить туда инструменты, необходимые для сборки проекта.
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/9c513bb6-7e40-4333-b7e5-1c8dc960767d)

3. Реализовать Jenkinsfile для проекта, который состоит из следующих этапов (stages):
- Clone
- Клонируется данный проект. Обратите внимание, что этот репозиторий приватный и для того, чтобы его склонировать нужно использовать какие-то credentials. Необходимо создать нужные credentials в Jenkins и сослаться на них при написании pipeline.
- Build
- Происходит сборка проекта через Maven или Gradle и запускаются юнит-тесты.
- Publish
- Публикуется артефакт сборки с помощью инструкции archiveArtifacts.
- Публикуется отчёт тестирования с помощью инструкции junit.
----
````
pipeline {
    agent {
        label 'linux'
    }
    triggers {
        cron('H * * * *')
    }
    
    stages {
        stage('Clone') {
            steps {
                withCredentials([gitUsernamePassword(credentialsId: '5c15c1cf-1aa1-4a78-be64-ea2884636741', gitToolName: 'Default')]) {
                    git branch: 'main', credentialsId: '5c15c1cf-1aa1-4a78-be64-ea2884636741', url: 'https://github.com/tms-dos17-onl/spring-petclinic.git'
                }
            }
        }
        
        stage('Build') {
            steps {
                sh '''
                    cd /tmp/workspace/HW_26_pipline
                    ./mvnw package
                    ./mvnw test
                '''
            }
        }
        
        stage('Publish') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                junit 'target/surefire-reports/*.xml'
            }
        }
    }
}

````
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/dfa5f56c-382e-4c71-816c-d7f1a77f32d9)
4 Настроить сборку по расписанию (каждый час) при помощи блока triggers в Jenkinsfile.

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/6f30cda5-c152-4a69-b9b5-afb6cbd58028)

5. (**) Реализовать Dockerfile для данного проекта и изменить стадию Build таким образом, чтобы она строила Docker образ. Стадию Publish в данном случае можно пропустить.

````
pipeline {
    agent {
        label 'ubuntu'
    }
    stages {
        stage('Clone') {
            steps {
                withCredentials([gitUsernamePassword(credentialsId: '514dfe3a-610a-4082-b74d-4035c7e4b823', gitToolName: 'Default')]) {
                    git branch: 'main', credentialsId: '514dfe3a-610a-4082-b74d-4035c7e4b823', url: 'https://github.com/tms-dos17-onl/spring-petclinic.git'
                }
            }
        }
        stage('Build') {
            steps {
                sh '''
                    cd /tmp
                    docker build -t file_d .
                '''
              
            }
        }
    }
}
````
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/cc1532aa-6e4f-4496-beb4-13656baed8b8)
----
Dockerfile
````
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y openjdk-17-jdk
WORKDIR /tmp
COPY /workspace/HW_27_2 .
RUN ./mvnw clean package
````
