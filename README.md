## InterSystems IRIS Interoperability Upload Service
This is an InterSystems IRIS Interoperability Upload Service to send files to the server using a multipart request from form or http request.

## What The the service does

This application receive a http multipart request with a file and saves to disk 

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation: ZPM

Open IRIS Namespace with Interoperability Enabled.
Open Terminal and call:
USER>zpm "install upload-service"

## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/upload-adapter.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Run the Sample

Open the [production](http://localhost:52773/csp/irisapp/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.upload.UploadProduction) and start it.
Now Open Postman or create a multipart request into a form pointing to localhost:9980/ using POST with a form-data file attribute.

