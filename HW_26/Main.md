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





-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----
