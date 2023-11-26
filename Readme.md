Хотел бы познокомиться со всеми инструментоми, так как не знаком ни с чем.
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

FROM maven:3.8.4-openjdk-17

ARG GITHUB_TOKEN

RUN git clone https://${GITHUB_TOKEN}@github.com/tms-dos17-onl/spring-petclinic.git /spring-petclinic

WORKDIR /spring-petclinic
RUN ./mvnw -B package

[2/4] RUN git clone https://${GITHUB_TOKEN}@github.com/tms-dos17-onl/spring-petclinic.git /spring-petclinic:
1.820 Cloning into '/spring-petclinic'...
2.186 fatal: could not read Password for 'https://github.com': No such device or address
docker build --build-arg GITHUB_TOKEN -t ваш_образ .
