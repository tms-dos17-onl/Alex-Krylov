1. Создать новый Jenkins агент и установить на нём Docker.
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/e7ee1ada-6fd7-4ee7-be4d-5f0f9cc8908b)
---
2. Изменить Jenkinsfile из предыдущего домашнего задания путём добавления стадии "Integration Tests" между стадиями Build и Publish. Она должна запускаться в Docker контейнере на созданном ранее Jenkins агенте при помощи Docker Pipeline плагина и выполнять следующие шаги:
- Запуск приложения в фоновом режиме.
- Проверка работоспособности приложения при помощи curl.
Для передачи артефактов между агентами использовать stash/unstash.
----
````
pipeline {
    
    agent none
    stages {
        stage('Clone') {
            agent {
                label 'ubuntu'
            }
            steps {
                withCredentials([gitUsernamePassword(credentialsId: '722d92f4-2959-4f1b-af57-d96ac674690e', gitToolName: 'Default')]) {
                    git branch: 'main', credentialsId: '722d92f4-2959-4f1b-af57-d96ac674690e', url: 'https://github.com/tms-dos17-onl/spring-petclinic.git'
                }
            }
        }
    
        stage('Build') {
            agent {
                label 'ubuntu'
            }
            steps {
                sh '''
                    cd /tmp/workspace/HW_27
                    ./mvnw package
                    ./mvnw test
                '''
                stash(name:'Sstash')
            }
        }
        
        stage('Integration Tests') {
            agent {
                docker { image 'maven:3.9.5-eclipse-temurin-17-alpine' }
            }
            steps {
                unstash 'Sstash'
                sh 'ls target/'
                sh 'java -jar target/*.jar &'
                sh 'sleep 40'
                sh 'curl http://localhost:8080'
            }
        }
        
        stage('Publish') {
            agent {
                label 'ubuntu'
            }
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                junit 'target/surefire-reports/*.xml'
            }
        }
    }
}
````
----
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/8cd1aefb-95ae-4d4d-8696-fa851b0774d0)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/65261311-a83f-486a-bdd8-fc4fb1a7427c)

