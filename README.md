## 🤶🏻 nice-n-naughty  🎅🏻

### Introduction

The current project aims to be a version of the most recent Santa tracker I created using shell.  In this particular case we will have a full blown app and a backend for performing operations.

Something that I learned as I worked on the last Santa tool is that things can change as I go and that change is for the better.  Hence I will not worry as much for things like names or even the overall app as I expect that ideas will start flowing, pushing me to change things for the better.  


## 🎄 Deployment

I want this to be for real hence I will take care of all the plumbing first, just like I would do for a prod app.  I will be using ECS for hosting this, as I am tired of the approach i do at work I will try one of the wonderful options I have learned from watching "container from the couch" and Nathan Peck.  I will attempt using Fargate as I have never used it for work 😜.  

Having stated the below I will be using the [copilot](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Copilot.html) as i eventually plan to become a contributor for it!  #newyearresolution #aws #womenwhogo


### Docker tips

Before using copilot for deploying my fargate task I wanted to validate the containarization process.  For that purpose I created my docker file, the dockerignore, and did the whole building and running.  For the benefit of my memory below are the commands I used for testing:

```
docker build . -t nice
docker run -p 3002:3000 --> map port 3000 from container to 3002 on the host
docker ps --> to get the id of the running container if I need to navigate through the container file system
docker exec -ti ${CONTAINERID FROM PREVIOUS STEP} sh

```

After running the container I can navigate to http://localhost:3002 and see the app.

## Copilot

Having a Dockerfile is the prerequisite for setting up a project using copilot.  The following commands were used for the creation of the ECS infrastructure:


For creating my application with the following command, this is to describe a high level component that will encompass various services.  This will start a prompt for setting best practices and help me focus on architecture instead of infrastructure
```
copilot init

```
After I answer the questions it had created the whole local setup, it gave me the options to deploy and I initially said no.  However I changed my mind soon after, nice thing about copilot is it gave me the actual commands I would have need to run if I changed my mind:
 `copilot env init --name test --profile default --app nice-n-naughty`

So I run them and created my test env which encompassed a VPC, subnets, IAM, and an ECS cluster.  Afterwards I had a nice cluster created!!

Next step is to deploy the service with the following command:

`copilot svc deploy --name nice-n-naugthy --env test`

