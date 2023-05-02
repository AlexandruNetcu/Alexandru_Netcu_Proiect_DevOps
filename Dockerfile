FROM tomcat:latest
# dam pull unei imagini de baza si selectam versiunea
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
# executam comanda: copiem recursiv toate fisierele in webapps.dist in webapps pentru a putea accesa Tomcat din browser
COPY ./*.war /usr/local/tomcat/webapps
# copiem artefactele cu extensia .war de pe local catre container
