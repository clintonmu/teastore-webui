FROM maven:3.5-jdk-8 AS mavenbuild
RUN mkdir /root/foldername
WORKDIR /root/foldername
RUN git clone https://github.com/DescartesResearch/TeaStore.git
RUN cd TeaStore
WORKDIR /root/foldername/TeaStore
RUN mvn clean install -DskipTests
FROM clintonmu/teastore-base
COPY --from=mavenbuild /root/foldername/TeaStore/utilities/tools.descartes.teastore.docker.all/target/tools.descartes.teastore.webui.war /usr/local/tomcat/webapps/tools.descartes.teastore.webui.war
