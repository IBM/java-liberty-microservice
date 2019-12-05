<p align="center">
    <a href="http://kitura.io/">
        <img src="https://landscape.cncf.io/logos/ibm-cloud-kcsp.svg" height="100" alt="IBM Cloud">
    </a>
</p>


<p align="center">
    <a href="https://cloud.ibm.com">
    <img src="https://img.shields.io/badge/IBM%20Cloud-powered-blue.svg" alt="IBM Cloud">
    </a>
    <a href="https://www.ibm.com/developerworks/learn/java/">
    <img src="https://img.shields.io/badge/platform-java-lightgrey.svg?style=flat" alt="platform">
    </a>
    <img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
</p>


# Create and deploy a Java - MicroProfile / Java EE Microservice

> We have similar applications available for [Go](https://github.com/IBM/go-microservice), [Spring](https://github.com/IBM/spring-microservice), [Python Flask](https://github.com/IBM/flask-microservice), and [Node](https://github.com/IBM/nodejs-microservice).

In this sample application, you will create a Java Liberty microservice. This provides a starting point for creating Java microservice applications running on [WebSphere Liberty](https://developer.ibm.com/wasdev/). It contains no default application code, but comes with standard best practices, including a health check.

The context root is set in the `src/main/webapp/WEB-INF/ibm-web-ext.xml` file. The ports are set in the `pom.xml` file and exposed to the CLI in the `cli-config.yml` file. The microservice application has a health endpoint which is accessible at `<host>:<port>/javalibertymicroservice/health`.

## Steps

You can [deploy this application to IBM Cloud](https://cloud.ibm.com/developer/appservice/create-app?starterKit=c5178a10-b4ff-3ecb-a50f-e548a19573e5) or [build it locally](#building-locally) by cloning this repo first. Once your app is live, you can access the `/health` endpoint to build out your cloud native application.

### Deploying to IBM Cloud

<p align="center">
    <a href="https://cloud.ibm.com/developer/appservice/create-app?starterKit=c5178a10-b4ff-3ecb-a50f-e548a19573e5">
    <img src="https://cloud.ibm.com/devops/setup/deploy/button_x2.png" alt="Deploy to IBM Cloud">
    </a>
</p>

Click **Deploy to IBM Cloud** to deploy this same application to IBM Cloud. This option creates a deployment pipeline, complete with a hosted GitLab project and a DevOps toolchain. You can deploy your app to Cloud Foundry, a Kubernetes cluster, or a Red Hat OpenShift cluster.

[IBM Cloud DevOps](https://www.ibm.com/cloud/devops) services provides toolchains as a set of tool integrations that support development, deployment, and operations tasks inside IBM Cloud.


### Building Locally

To get started building this application locally, you can either run the application natively or use the [IBM Cloud Developer Tools](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started) for containerization and easy deployment to IBM Cloud.

#### Native Application Development

* [Maven](https://maven.apache.org/install.html)
* Java 8: Any compliant JVM should work.
  * [Java 8 JDK from Oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
  * [Java 8 JDK from IBM (AIX, Linux, z/OS, IBM i)](http://www.ibm.com/developerworks/java/jdk/),
    or [Download a Liberty server package](https://developer.ibm.com/assets/wasdev/#filter/assetTypeFilters=PRODUCT)
    that contains the IBM JDK (Windows, Linux)
    
To build and run the application:
1. `mvn install`
1. `mvn liberty:run-server`

To run an application in Docker use the Docker file called `Dockerfile`. If you do not want to install Maven locally you can use `Dockerfile-tools` to build a container with Maven installed.

#### IBM Cloud Developer Tools

Install [IBM Cloud Developer Tools](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started) on your machine by running the following command:
```
curl -sL https://ibm.biz/idt-installer | bash
```

Create an application on IBM Cloud by running:

```bash
ibmcloud dev create
```

This will create and download a starter application with the necessary files needed for local development and deployment.

Your application will be compiled with Docker containers. To compile and run your app, run:

```bash
ibmcloud dev build
ibmcloud dev run
```

This will launch your application locally. When you are ready to deploy to IBM Cloud on Cloud Foundry or Kubernetes, run one of the commands:

```bash
ibmcloud dev deploy -t buildpack // to Cloud Foundry
ibmcloud dev deploy -t container // to K8s cluster
```

You can build and debug your app locally with:

```bash
ibmcloud dev build --debug
ibmcloud dev debug
```

## Next Steps
* Learn more about augmenting your Java applications on IBM Cloud with the [Java Programming Guide](https://cloud.ibm.com/docs/java?topic=java-getting-started).
* Explore other [sample applications](https://cloud.ibm.com/developer/appservice/starter-kits) on IBM Cloud.

## License

This sample application is licensed under the Apache License, Version 2. Separate third-party code objects invoked within this code pattern are licensed by their respective providers pursuant to their own separate licenses. Contributions are subject to the [Developer Certificate of Origin, Version 1.1](https://developercertificate.org/) and the [Apache License, Version 2](https://www.apache.org/licenses/LICENSE-2.0.txt).

[Apache License FAQ](https://www.apache.org/foundation/license-faq.html#WhatDoesItMEAN)

