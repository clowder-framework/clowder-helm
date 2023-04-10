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
  - label: FAQ
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

This is auto generated using:

```
docker run -it --rm -v $(pwd):/data mogensen/helm-changelog:latest
```

See [CHANGELOG.md](CHANGELOG.md) for the changes.
