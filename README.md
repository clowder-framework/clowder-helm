# Clowder

[Clowder](https://clowderframework.org/) is an open source datamanagement for long tail data.

## TL;DR;

```bash
helm repo add ncsa https://opensource.ncsa.illinois.edu/charts/
helm install clowder ncsa/clowder --set commKey=clowderiscool
```

## Introduction

This chart bootstraps a [Clowder](https://github.com/clowder-framework/clowder) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.16+
- helm 3
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
helm install my-release ncsa/clowder --set commKey=clowderiscool
```

The command deploys Clowder on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation. This will also install MongoDB, RabbitMQ, elasticsearch as well as some extractors.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
helm uninstall my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Clowder chart and their default values.

### Clowder Options

A list of values frequently changed.

| Parameter                            | Description                                      | Default                                                 |
| ------------------------------------ | ------------------------------------------------ | -------------------------------------------------------
| memory | Memory for the clowder application in MB. | 4096
| commKey | Administrator key. This key will give administrator level access to Clowder and is not associated with any user. | ""
| secretKey | Secret key used for cookies. This should be set the same for all clowder instances in a replicated setup. Best is for kubernetes to generate a random key. | ""
| initialAdmins | List of initial admins in clowder, this is a list of email addresses and these will always be admins. | []
| registerThroughAdmins | Should the admin be required to approve all new users. Setting this to false will result in all new users immediately be given access to Clowder. | true
| idleTimeoutInMinutes | Number of minutes you stay logged into clowder without any interactions. | 30
| tempfolder | Folder used to save files by clowder, before being send to storage location. | /home/clowder/data/tmp
| helpmenu | List of additional menu entries to be added to the clowder help menu. | []
| userid | the id of the user that runs the clowder process, this is helpful if you want to write to a shared storage as a specific user. | 10001
| groupid | the id of the groups that runs the clowder process, this is helpful if you want to write to a shared storage as a specific group. | 0
| replicaCount | Number of instances to run of clowder. | 1
| monitor.replicaCount | number of instances to run of monitor. | 1

### Extra Clowder Options

These options can be used to set any other clowder variables, or plugins.

| Parameter                            | Description                                      | Default                                                 |
| ------------------------------------ | ------------------------------------------------ | -------------------------------------------------------
| extraOptions | List of additional options to be passed to the clowder process. | []
| extraPlugins | List of additional plugins should be enabled. This will allow you to add additional login mechanisms. | []
| extraConfig | List of additional configuration options to set for clowder. | []
| extraVolumes | List of additional volumes for clowder, for example to hold large datasets. | []
| extraVolumeMounts | List of additional volumemounts for clowder, for example to hold large datasets. | []

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
helm install my-release ncsa/clowder --set clowderkey=ncsa
```

The above command sets the clowder admin key `ncsa`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
helm install my-release ncsa/clowder -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Users

To be able to work with clowder you will need an account on the server. Clowder will not ship with any accounts and will
require users to be approved by an admin. The list of initial admins is set using `initialAdmins`. Any user that creates
an account with an email specified in this list will automatically be approved.

## Emails

Clowder will use emails when users sign up. To enable emails you need to configure the email server. To setup emails use

```yaml
smtp:
  mock: false
  host: smtp.example.com
```

If this is not set, the clowder server will use a mock and print the emails in the clowder logs.

## Helpmenu

You can add additional entries to the help menu, each entry in the list needs to have a label and a URL, for example
to add a FAQ:

```yaml
helpmenu:
  - lalel: FAQ
    url: https://example.com/faq
```

## Persistence

Clowder can use a disk storage (default) or S3. In case of S3 it can either use an existing bucket, or use minio to
provide the bucket.

### Existing PersistentVolumeClaims

1. Create the PersistentVolume
1. Create the PersistentVolumeClaim
1. Install the chart

```bash
helm install my-release ncsa/clowder --set persistence.existingClaim=PVC_NAME
```

## Extra Options

To mount additional storage:

```yaml
extraVolumes:
  - name: sites
    persistentVolumeClaim:
      claimName: clowder-sites
extraVolumeMounts:
  - name: sites
    mountPath: /home/clowder/sites
    readOnly: true
```

To enable different login options (for example CILogon):

```yaml
extraPlugins:
  - 10051:services.CILogonProvider
extraConfig:
  - securesocial.registrationEnabled = false
  - securesocial.cilogon.authorizationUrl = "https://cilogon.org/authorize"
  - securesocial.cilogon.accessTokenUrl = "https://cilogon.org/oauth2/token"
  - securesocial.cilogon.userinfoUrl = "https://cilogon.org/oauth2/userinfo"
  - securesocial.cilogon.clientId = "cilogon:/client_id/XYZ"
  - securesocial.cilogon.clientSecret = "XYZ"
```

## ChangeLog

### 0.15.2
- update clowder to [1.20.3](https://github.com/clowder-framework/clowder/releases/tag/v1.20.3)
- update image previewer to 2.4.0

### 0.15.1
- Update clowder to version [1.20.1](https://github.com/clowder-framework/clowder/releases/tag/v1.20.1)

### 0.15.0
- Update clowder to version [1.20.0](https://github.com/clowder-framework/clowder/releases/tag/v1.20.0)
- Update extractors for pyclowder version [2.5.1](https://github.com/clowder-framework/pyclowder/releases/tag/2.5.1)

### 0.14.6
- don't set traefik ingress annotionion, it breaks TLS

### 0.14.5
- Update clowder to version [1.19.4](https://github.com/clowder-framework/clowder/releases/tag/v1.19.4)

### 0.14.4
- allow for mounting of extra volumes in clowder
- use tempfolder for clowder (/home/clowder/data/tmp)
- use helpmenu to add additional entries to the botttom of the help menu.
- remove users option, use initialadmins instead

### 0.14.3
- Update clowder to version [1.19.2](https://github.com/clowder-framework/clowder/releases/tag/v1.19.2)

### 0.14.2
- Update clowder to version [1.19.1](https://github.com/clowder-framework/clowder/releases/tag/v1.19.1)

### 0.14.1
- Allow to specify userid/groupid for clowder pods

### 0.14.0
- Update clowder to version [1.19.0](https://github.com/clowder-framework/clowder/releases/tag/v1.19.0)

### 0.13.1
- default for users is now empty list
- no recursive chown of data folder
- only set secretname for TLS if explicitly provided

### 0.13.0
- Update clowder to version [1.18.1](https://github.com/clowder-framework/clowder/releases/tag/v1.18.1)
- Also see updates for version [1.18.0](https://github.com/clowder-framework/clowder/releases/tag/v1.18.0)
- fix TLS for nginx and traefik v2.

### 0.12.0
- Update clowder to version [1.17.0](https://github.com/clowder-framework/clowder/releases/tag/v1.17.0)

### 0.11.1
- Fixed problem with storageClassName in persistence

### 0.11.0
- Update clowder to 0.16.0
  - Archiving updates
  - Sorting in search api
- Disable rabbitmq plugin

### 0.10.1
- Update clowder to 0.15.1
  - Several views were throwing errors trying to access a None value in EventSinkService when a user was not logged in.
  - Changed EventSinkService logging to debug to minimize chatter.
  - Don't automatically create eventsink queue and bind it to eventsink exchange. Let clients do that so that we don't have a queue for the eventsink filling up if there are no consumers.
- Update digest extractor to 2.2.0

### 0.10.0
- Complete rewrite of the messagebus code
- Added new previewers (Vega and FBX)
- Can filter search by upload/creation dates
- Disabled download if file is not processed yet
- Fixed bug when creating spaces through the api.
- Return headers when calling /api/me
- Updated core extractor versions

### 0.9.1
- Forgot to increate clowder version tag.
- Now using appVersion for clowder version tag by default.
- Using `networking.k8s.io/v1` for ingress rules

### 0.9.0
- update clowder to 1.14.1
- helm chart now in https://github.com/clowder-framework/clowder-helm

### 0.8.0
- update clowder to 1.13.0
- update extractors:
  - extractors-digest to 2.1.6

### 0.7.0
- update clowder to 1.12.2
- can set extra options for clowder `extraOptions`
- can set the memory used by clowder using `memory` (default is 2GB)
- update extractors:
  - extractors-digest to 2.1.5
  - extractors-image-preview to 2.1.5
  - extractors-image-metadata to 2.1.5
  - extractors-audio-preview to 2.1.5
  - extractors-pdf-preview to 2.1.5
  - extractors-video-preview to 2.1.5

### 0.6.2
- update clowder to 1.11.2
- can set replicas for monitor independent from clowder
- update extractors:
  - extractors-digest to 2.1.4
  - extractors-image-preview to 2.1.4
  - extractors-image-metadata to 2.1.4
  - extractors-audio-preview to 2.1.4
  - extractors-pdf-preview to 2.1.4
  - extractors-video-preview to 2.1.4
  - extractors-clamav to 1.0.3

### 0.6.1
- update clowder to 1.11.1
- ability to set idle timeout (default is 30 min)
- use new healthz endpoint in clowder for ready checks.

### 0.6.0
- update clowder to 1.11.0
- update RabbitMQ to 7.6.7
- updated most core extractors to newer version
- added virus checker extractor
- added `extraConfig` and `extraPlugins` to allow finer control of clowder
  - this can be used to add additional login options to clowder
- monitor is now deployed at https://\<server\>/\<path\>/monitor/index.html

### 0.5.0
- update clowder to 1.9.0
- now uses helm3 syntax for chart
- added minio for storage option
- secrets are now passed as environment variables not in configmap
- user creation moved to init container for clowder, will prevent helm chart from timing out.

### 0.2.0
- update clowder to 1.8.0
- make sure to use image.tag for containers

### 0.0.1
This is the first release of the helm chart
