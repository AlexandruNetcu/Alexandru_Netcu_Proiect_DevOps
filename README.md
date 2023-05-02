
# Alexandru Netcu - Devops project

- In acest proiect vom folosi tool-uri de CI/CD pentru a face deployment unor artefacte. 
- Vom crea codul nostru, iar folosind Git vom da commit codului si il vom urca pe GitHub.
- Configuram Jenkins, instaland plugin-urile necesare
- Vom crea un job in Jenkins care va prelua codul de pe GitHub din branch-ul nostru 
- Integrand Maven si folosind plugin-ul "Maven Integration" codul va fi rulat creand astfel un artefact webapp.war
- Folosind Ansible copiem artefactul creat de unde vom da push imaginii cu artefactul catre DockerHub si vom da deploy catre un container

## Tools and techs

- AWS
- Git
- GitHub
- Jenkins
- Ansible
- Docker
- DockerHub
- MobaXterm/Putty

## Deployment

Vom crea 3 instante EC2 in AWS fiecare reprezentand servere pentru Jenkins, Docker si Ansible, si vom seta security group pentru fiecare specificand porturile de acces (un range de porturi).

![aws](https://user-images.githubusercontent.com/39223390/235632391-7283ba45-af44-4aaf-b9cf-3f3ffcf67af2.jpg)
![image](https://user-images.githubusercontent.com/39223390/235662629-5f170eb1-f271-45df-ba7e-51adaa0e688d.png)


Pentru a ne putea conecta la instantele EC2, copiem cheia publica a fiecareia si le accesam folosind MobaXterm creand astfel autentificare pe fiecare server cu user "ec2-user".

![image](https://user-images.githubusercontent.com/39223390/235632671-b1bdd3cd-de10-4a30-9692-79afb4d0ec35.png)


![image](https://user-images.githubusercontent.com/39223390/235633155-ccabd918-eb94-4ac4-89f6-8bddbac85754.png)

Ca si cheie privata o vom folosi pe cea generata de AWS in momenul crearii instantelor EC2.

Configuram serverele create instaland Jenkins, Docker si Ansible:

1. ### Instanta de Jenkins

Pentru a rula Jenkins trebuie mai intai instalat pachetul de Java. Deoarece la crearea instantei de EC2 am selectat ca OS, Amazon Linux, vom folosi pachetele din repository-ul "epel".

```bash
    amazon-linux-extras install epel
```
In acest moment avem acces la acest repository si putem instala pachetul de Java jdk11.

```bash
      amazon-linux-extras install java-openjdk11
```
Dupa instalarea pachetului openjdk11 putem instala jenkins folosind comanda:

```bash
      yum install jenkins
```

Iar pentru a verifica statusul sau a porni serviciul de Jenkins folosim:

```bash
      service jenkins status 
      service jenkins start
```
![image](https://user-images.githubusercontent.com/39223390/235635835-4c257c88-0b3a-4e34-8f8f-cbabba996ae4.png)



In acest moment putem deschide un nou tab in browser si sa accesam serverul Jenkins folosind ip-ul instantei EC2 si portul 8080.

```bash
      54.89.247.67:8080
```
2. ### Instanta de Dockerhost

Pentru a instala docker folosim comanda: 
```bash
      yum install docker
```
Din acest moment putem incepe integrarea Jenkins-Docker:

Vom crea un nou user "dockeradmin" pe care il vom adauga ulterior grupului "docker". Vom configura autentificarea pentru a putea fi folosita o parola pentru userul dockeradmin.

```bash
      useradd dockeradmin
      passwd dockeradmin

      usermod -aG docker dockeradmin
      vi /etc/ssh/sshd_confing
```
![image](https://user-images.githubusercontent.com/39223390/235658797-81112924-437a-495d-b43c-c9de145ccd8c.png)


Dupa aceasta trebuie sa dam restart, deoarece instantele EC2 din AWS nu permit autentificarea cu parola.

```bash
        service sshd reload
```
Pentru copierea artefactelor din jenkins in Dockerhost trebuie instalat plugin-ul "Publish over SSH".

![image](https://user-images.githubusercontent.com/39223390/235656677-eeae2939-2ba5-4c05-bd67-7a78ffd28fbb.png)

3. ### Instanta de Ansible

Vom crea un nou user "ansadmin" si il vom adauga in sudoers si vom configura folosirea unei parole la autentificare pentru acest user.

```bash
        useradd ansadmin
        passwd ansadmin

        visudo
```
![image](https://user-images.githubusercontent.com/39223390/235659525-f9c642a5-bdf9-4015-b24c-935e9a6aeee8.png)

```bash
       vi /etc/ssh/sshd_config
```
Acum ne putem conecta cu userul creat si dupa aceea putem instala Ansible
 
 ```bash
        sudo su - ansadmin
           sudo amazon-linux-extras install ansible2

```
4. ### Stabilirea relatiei manager node - control node dintre Ansible si Dockerhost

Initializam Dockerhost sa creeze un container folosind nodul de control Ansible, printr-un ansible playbook. Acest lucru se va realiza folosind userul "ansadmin" care se afla si pe instanta Ansible. Folosim aceiasi pasi pentru a crea userul "ansadmin" generand o parola pentru acesta, adaugand-ul in sudoers si configurand ca autentificarea sa fie realizata cu parola.

Vom rula urmatoarea comanda in Ansible:

```bash
     vi /etc/ansible/hosts   
```
In acest fisier adaugam ip-urile Dockerhost si Ansible ca hosts:

![image](https://user-images.githubusercontent.com/39223390/235664225-e7a91027-fc07-4c42-8420-bdb890d7a640.png)

In instanta Ansible generam cheia publica folosind:

```bash
        ssh-keygen
```
Copiem cheia publica in Dockerhost folosind ip-ul privat. Putem folosi acest ip deoarece instantele sunt in acelasi VPC (Virtual Private Cloud).

```bash
        ssh-copy-id ip_privat
```
![image](https://user-images.githubusercontent.com/39223390/235666322-ccf36c26-fdb7-4da5-8d46-e91c23d789fc.png)

Pentru a verifica daca cele 2 instante sunt conectate, folosim ca user "ansadmin" urmatoarea comanda:

```bash
        ansible all -m ping
```

![image](https://user-images.githubusercontent.com/39223390/235667415-7513794f-9501-4ede-8a74-9256111d4948.png)


In instanta Ansible cream 3 fisiere pe care le adaugam in folderul unde se vor copia artefactele. Unul din fisiere va fi Dockerfile iar celelalte 2 vor fi playbbook-uri Ansible care vor crea o imagine si o vor urca pe DockerHub, respectiv vor crea un container.


```bash
        cd /opt/docker
        vi Dockerfile
        vi deploy_regapp.yml
        vi regapp.yml
```
![image](https://user-images.githubusercontent.com/39223390/235669290-3bb447a7-b5ba-4961-b95f-0afb0b692a46.png)

![image](https://user-images.githubusercontent.com/39223390/235669551-0a6d2c86-fe20-4b27-8518-0ab78d41b601.png)

![image](https://user-images.githubusercontent.com/39223390/235669703-9dd7c607-d393-4418-ae71-7b18c87eb10c.png)

La final configuram Job-ul de Jenkins sa apeleze aceste fisiere, iar in momentul in care avem schimbari in codul de pe Git, jobul de Jenkins va rula automat si va updata containerul.
