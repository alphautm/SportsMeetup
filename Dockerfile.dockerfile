FROM anapsix/alpine-java 
LABEL maintainer="alpha@utm.com" 
COPY /target/SportsMeetup-1.5.1.jar /home/SportsMeetup-1.5.1.jar 
CMD ["java","-jar","/home/SportsMeetup-1.5.1.jar"]