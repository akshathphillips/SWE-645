FROM tomcat:latest

# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from the target directory into the Tomcat webapps directory
COPY target/HW1-Part1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/HW1-Part2.war

# Expose the Tomcat HTTP port (default is 8080)
EXPOSE 8080

# Stop and then start Tomcat
CMD ["catalina.sh", "stop"]
CMD ["catalina.sh", "run"]
