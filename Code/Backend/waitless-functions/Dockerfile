FROM maven:3.6.3 AS installer-env
COPY src home/src
COPY pom.xml /home
RUN mvn -f /home/pom.xml clean package

FROM mcr.microsoft.com/azure-functions/java:2.0
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY --from=installer-env ["/home/target/azure-functions/waitless-functions-2", "/home/site/wwwroot"]
