# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

### 0.16.1
- fix for when `enable: false` for extractors

### 0.16.0
- update clowder to [1.21.0](https://github.com/clowder-framework/clowder/releases/tag/v1.21.0)
- update all extractors to incorperate pyclowder 2.6.0

### 0.15.5
- fix rabbitmq/mongodb url

### 0.15.4
- fix name of extractors to be fullname

### 0.15.3
- fix deployment when using release name and secrets

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

