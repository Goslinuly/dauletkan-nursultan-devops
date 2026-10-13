# dauletkan-nursultan-devops

DevOps Laboratory Work 1 — Linux, Git, GitHub, Docker and Jenkins.

| | |
|---|---|
| Name | Nursultan |
| Surname | Dauletkan |
| Group | IT2-2313 |
| Student ID | 37037 |
| Course | DevOps |

## Structure

```
app/app.py                          Python web application (shows student info)
scripts/Dauletkan_Nursultan_system.sh   Linux system information script
config/app.conf                     Application configuration
Dockerfile                          Docker image dauletkan-nursultan-devops
docker-compose.yml                  Compose service for the application
Jenkinsfile                         CI/CD pipeline: Checkout, Build, Test, Docker Build, Docker Run
```

## Run

```bash
docker build -t dauletkan-nursultan-devops .
docker run -d --name dauletkan-nursultan-container -p 5050:5000 dauletkan-nursultan-devops
curl localhost:5050
```
Repository: https://github.com/Goslinuly/dauletkan-nursultan-devops
