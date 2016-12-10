FROM java:8
copy javaagent /usr/src/appdynamics/javaagent
COPY poc-product-environment.properties /usr/src/poc-product-environment.properties
COPY microservice-demo-products-0.0.1-SNAPSHOT.jar /usr/src/microservice-demo-products-0.0.1-SNAPSHOT.jar
WORKDIR /usr/src
CMD java -javaagent:"/usr/src/appdynamics/javaagent/javaagent.jar" -Dconfig.home="/usr/src" -Dappdynamics.agent.applicationName="poc-product-service" -Dappdynamics.agent.tierName="poc-product-service-tier" -Dappdynamics.agent.nodeName="poc-product-service-node" -jar microservice-demo-products-0.0.1-SNAPSHOT.jar