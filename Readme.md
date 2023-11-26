Хотел бы познокомиться со всеми инструментоми, так как не знаком ни с чем.
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

FROM maven:3.8.4-openjdk-17

ARG GITHUB_TOKEN

RUN git clone https://${GITHUB_TOKEN}@github.com/tms-dos17-onl/spring-petclinic.git /spring-petclinic

WORKDIR /spring-petclinic
RUN ./mvnw -B package
