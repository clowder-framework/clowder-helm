# Change Log

## 0.16.4 

**Release date:** 2023-04-10

![AppVersion: 1.21.0](https://img.shields.io/static/v1?label=AppVersion&message=1.21.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix data folder for s3 

### Default value changes

```diff
# No changes in this release
```

## 0.16.3 

**Release date:** 2023-04-10

![AppVersion: 1.21.0](https://img.shields.io/static/v1?label=AppVersion&message=1.21.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* release 0.16.3 
* make sure tmp folder exists (fixes #7) 
* update digest extractor 
* update changelog 
* Merge branch 'main' of github.com:clowder-framework/clowder-helm 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index fb0323f..4b084c8 100644
--- a/values.yaml
+++ b/values.yaml
@@ -126,7 +126,7 @@ smtp:
 ## env          : additional environment variables to pass to extractor.
 extractors:
   file-digest:
-    image: clowder/extractors-digest:2.2.3
+    image: clowder/extractors-digest:2.2.4
     # enabled: true
     # replicaCount: 1
     # pullPolicy: Always
```

## 0.16.2 

**Release date:** 2023-02-21

![AppVersion: 1.21.0](https://img.shields.io/static/v1?label=AppVersion&message=1.21.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update extractor version 
* Minor typo correction 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 6dc2ae1..fb0323f 100644
--- a/values.yaml
+++ b/values.yaml
@@ -126,25 +126,26 @@ smtp:
 ## env          : additional environment variables to pass to extractor.
 extractors:
   file-digest:
-    image: clowder/extractors-digest:2.2.2
-    #enabled: true
-    #replicaCount: 1
-    #pullPolicy: Always
+    image: clowder/extractors-digest:2.2.3
+    # enabled: true
+    # replicaCount: 1
+    # pullPolicy: Always
+    # imagePullSecrets: regcred
     # env:
     #   - name: extractor.bump.sh
     #     value: "bar"
   image-preview:
-    image: clowder/extractors-image-preview:2.4.1
+    image: clowder/extractors-image-preview:2.4.2
   image-metadata:
-    image: clowder/extractors-image-metadata:2.1.8
+    image: clowder/extractors-image-metadata:2.1.9
   audio-preview:
-    image: clowder/extractors-audio-preview:2.1.8
+    image: clowder/extractors-audio-preview:2.1.9
   pdf-preview:
-    image: clowder/extractors-pdf-preview:2.1.8
+    image: clowder/extractors-pdf-preview:2.1.9
   video-preview:
-    image: clowder/extractors-video-preview:2.2.2
+    image: clowder/extractors-video-preview:2.2.3
   clamav:
-    image: clowder/extractors-clamav:1.0.7
+    image: clowder/extractors-clamav:1.0.9
 
 # ----------------------------------------------------------------------
 # DATA STORAGE
```

## 0.16.1 

**Release date:** 2022-09-12

![AppVersion: 1.21.0](https://img.shields.io/static/v1?label=AppVersion&message=1.21.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix ability to disable extractor 

### Default value changes

```diff
# No changes in this release
```

## 0.16.0 

**Release date:** 2022-09-09

![AppVersion: 1.21.0](https://img.shields.io/static/v1?label=AppVersion&message=1.21.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* clowder/extractor updates 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 60990e5..6dc2ae1 100644
--- a/values.yaml
+++ b/values.yaml
@@ -126,7 +126,7 @@ smtp:
 ## env          : additional environment variables to pass to extractor.
 extractors:
   file-digest:
-    image: clowder/extractors-digest:2.2.1
+    image: clowder/extractors-digest:2.2.2
     #enabled: true
     #replicaCount: 1
     #pullPolicy: Always
@@ -134,17 +134,17 @@ extractors:
     #   - name: extractor.bump.sh
     #     value: "bar"
   image-preview:
-    image: clowder/extractors-image-preview:2.4.0
+    image: clowder/extractors-image-preview:2.4.1
   image-metadata:
-    image: clowder/extractors-image-metadata:2.1.7
+    image: clowder/extractors-image-metadata:2.1.8
   audio-preview:
-    image: clowder/extractors-audio-preview:2.1.7
+    image: clowder/extractors-audio-preview:2.1.8
   pdf-preview:
-    image: clowder/extractors-pdf-preview:2.1.7
+    image: clowder/extractors-pdf-preview:2.1.8
   video-preview:
-    image: clowder/extractors-video-preview:2.2.1
+    image: clowder/extractors-video-preview:2.2.2
   clamav:
-    image: clowder/extractors-clamav:1.0.6
+    image: clowder/extractors-clamav:1.0.7
 
 # ----------------------------------------------------------------------
 # DATA STORAGE
```

## 0.15.5 

**Release date:** 2022-07-31

![AppVersion: 1.20.3](https://img.shields.io/static/v1?label=AppVersion&message=1.20.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix mongo/rabbitmq 

### Default value changes

```diff
# No changes in this release
```

## 0.15.4 

**Release date:** 2022-07-31

![AppVersion: 1.20.3](https://img.shields.io/static/v1?label=AppVersion&message=1.20.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix name of extractors 
* fix extractor secret 
* fix helm push 

### Default value changes

```diff
# No changes in this release
```

## 0.15.3 

**Release date:** 2022-07-31

![AppVersion: 1.20.3](https://img.shields.io/static/v1?label=AppVersion&message=1.20.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix secrets 
* add old bitnami charts 
* point to older bitnami charts 

### Default value changes

```diff
# No changes in this release
```

## 0.15.2 

**Release date:** 2022-06-11

![AppVersion: 1.20.3](https://img.shields.io/static/v1?label=AppVersion&message=1.20.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update clowder to 1.20.3 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 400d429..60990e5 100644
--- a/values.yaml
+++ b/values.yaml
@@ -134,7 +134,7 @@ extractors:
     #   - name: extractor.bump.sh
     #     value: "bar"
   image-preview:
-    image: clowder/extractors-image-preview:2.2.2
+    image: clowder/extractors-image-preview:2.4.0
   image-metadata:
     image: clowder/extractors-image-metadata:2.1.7
   audio-preview:
```

## 0.15.1 

**Release date:** 2022-04-05

![AppVersion: 1.20.1](https://img.shields.io/static/v1?label=AppVersion&message=1.20.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* clowder 1.20.1 

### Default value changes

```diff
# No changes in this release
```

## 0.15.0 

**Release date:** 2022-03-06

![AppVersion: 1.20.0](https://img.shields.io/static/v1?label=AppVersion&message=1.20.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* clowder/pyclowder release 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 4c1ba0f..400d429 100644
--- a/values.yaml
+++ b/values.yaml
@@ -126,7 +126,7 @@ smtp:
 ## env          : additional environment variables to pass to extractor.
 extractors:
   file-digest:
-    image: clowder/extractors-digest:2.2.0
+    image: clowder/extractors-digest:2.2.1
     #enabled: true
     #replicaCount: 1
     #pullPolicy: Always
@@ -134,17 +134,17 @@ extractors:
     #   - name: extractor.bump.sh
     #     value: "bar"
   image-preview:
-    image: clowder/extractors-image-preview:2.2.1
+    image: clowder/extractors-image-preview:2.2.2
   image-metadata:
-    image: clowder/extractors-image-metadata:2.1.6
+    image: clowder/extractors-image-metadata:2.1.7
   audio-preview:
-    image: clowder/extractors-audio-preview:2.1.6
+    image: clowder/extractors-audio-preview:2.1.7
   pdf-preview:
-    image: clowder/extractors-pdf-preview:2.1.6
+    image: clowder/extractors-pdf-preview:2.1.7
   video-preview:
-    image: clowder/extractors-video-preview:2.2.0
+    image: clowder/extractors-video-preview:2.2.1
   clamav:
-    image: clowder/extractors-clamav:1.0.3
+    image: clowder/extractors-clamav:1.0.6
 
 # ----------------------------------------------------------------------
 # DATA STORAGE
@@ -235,8 +235,6 @@ monitor:
     # nodePort: 30000
     port: 9999
 
-# ----------------------------------------------------------------------
-
 # ----------------------------------------------------------------------
 # clowder requires mongodb to be able to run
 #
```

## 0.14.6 

**Release date:** 2021-12-13

![AppVersion: 1.19.4](https://img.shields.io/static/v1?label=AppVersion&message=1.19.4&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* don't set ingress traefik annotion 

### Default value changes

```diff
# No changes in this release
```

## 0.14.5 

**Release date:** 2021-12-13

![AppVersion: 1.19.4](https://img.shields.io/static/v1?label=AppVersion&message=1.19.4&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update to version 1.19.4 

### Default value changes

```diff
# No changes in this release
```

## 0.14.4 

**Release date:** 2021-10-25

![AppVersion: 1.19.2](https://img.shields.io/static/v1?label=AppVersion&message=1.19.2&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* add helpmenu, remove users 
* Update README.md 
* Update README.md 
* add temp folder and extra volumes 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 1ed5587..4c1ba0f 100644
--- a/values.yaml
+++ b/values.yaml
@@ -21,6 +21,8 @@ memory: 2048
 
 ## List of admins for Clowder. These people will at every restart of clowder be given admin
 ## priveleges. Can also be used to recover system by giving existing user admin rights.
+## Make sure to provide at least one initialAdmin user, otherwise you will not be able
+## to login.
 initialAdmins:
 #  - admin@example.com
 
@@ -36,20 +38,6 @@ registerThroughAdmins: true
 ## a replicated setup. Best is for kubernetes to generate a random key.
 #secretKey:
 
-## List of initial users. These users will be added after clowder is installed. The
-## users will still need to accept the data policy.
-## email     : Email address, also used to login
-## password  : Initial password, if not set a random password is generated
-## firstname : First name of the user
-## lastname  : Last name of the user
-## admin     : should user be given admin privileges
-users: []
-  # - email: admin@example.com
-  #   #password: secret
-  #   firstname: Admin
-  #   lastname: User
-  #   admin: true
-
 ## idleTimeoutInMinutes the time in minutes that your session is valid for until clowder
 ## logs you out.
 idleTimeoutInMinutes: 30
@@ -80,6 +68,15 @@ userid: 10001
 ## to a shared folder.
 groupid: 0
 
+## tempfolder is the place where clowder will safe the files when they are uploaded. Best
+## is for this to be on the same volume as the final storage, or on a fast storage.
+tempfolder: /home/clowder/data/tmp/
+
+## helpmenu is a list of entries that are added to the help menu in clowder, each entry has
+## two fields, label (shown in menu) and the url.
+helpmenu: []
+# - label: "FAQs"
+#   url: "https://example.com/faqs"
 
 # ----------------------------------------------------------------------
 # Configure the ingress object to hook into existing infastructure
@@ -216,6 +213,15 @@ persistence:
   ## Annotations
   annotations: {}
 
+# Add additional volumes and mounts, for example to hold data transfered externally of clowder
+extraVolumes: []
+  # - name: sites
+  #   persistentVolumeClaim:
+  #     claimName: clowder-sites
+extraVolumeMounts: []
+  # - name: sites
+  #   mountPath: /home/clowder/sites
+  #   readOnly: true
 
 # ----------------------------------------------------------------------
 monitor:
```

## 0.14.3 

**Release date:** 2021-10-20

![AppVersion: 1.19.2](https://img.shields.io/static/v1?label=AppVersion&message=1.19.2&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* clowder 1.19.2 

### Default value changes

```diff
# No changes in this release
```

## 0.14.2 

**Release date:** 2021-10-20

![AppVersion: 1.19.1](https://img.shields.io/static/v1?label=AppVersion&message=1.19.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* clowder 1.19.1 release 
* run chown as root 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 60ef4ec..1ed5587 100644
--- a/values.yaml
+++ b/values.yaml
@@ -72,6 +72,14 @@ extraConfig:
 #  - enablePublic = true
 #  - verifySpaces = false
 
+## userid is the userid for clowder, change this if you need a specific userid to write
+## to a shared folder.
+userid: 10001
+
+## groupid is the groupid for clowder, change this if you need a specific groupid to write
+## to a shared folder.
+groupid: 0
+
 
 # ----------------------------------------------------------------------
 # Configure the ingress object to hook into existing infastructure
```

## 0.14.1 

**Release date:** 2021-10-06

![AppVersion: 1.19.0](https://img.shields.io/static/v1?label=AppVersion&message=1.19.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* allow to specify userid 

### Default value changes

```diff
# No changes in this release
```

## 0.14.0 

**Release date:** 2021-10-05

![AppVersion: 1.19.0](https://img.shields.io/static/v1?label=AppVersion&message=1.19.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* clowder release 1.19.0 

### Default value changes

```diff
# No changes in this release
```

## 0.13.1 

**Release date:** 2021-10-04

![AppVersion: 1.18.1](https://img.shields.io/static/v1?label=AppVersion&message=1.18.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* version 0.13.1 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 8b763fa..60ef4ec 100644
--- a/values.yaml
+++ b/values.yaml
@@ -43,12 +43,12 @@ registerThroughAdmins: true
 ## firstname : First name of the user
 ## lastname  : Last name of the user
 ## admin     : should user be given admin privileges
-users:
-  - email: admin@example.com
-    #password: secret
-    firstname: Admin
-    lastname: User
-    admin: true
+users: []
+  # - email: admin@example.com
+  #   #password: secret
+  #   firstname: Admin
+  #   lastname: User
+  #   admin: true
 
 ## idleTimeoutInMinutes the time in minutes that your session is valid for until clowder
 ## logs you out.
```

## 0.13.0 

**Release date:** 2021-09-02

![AppVersion: 1.18.1](https://img.shields.io/static/v1?label=AppVersion&message=1.18.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* release 0.13.0 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 2c9575e..8b763fa 100644
--- a/values.yaml
+++ b/values.yaml
@@ -79,12 +79,12 @@ extraConfig:
 #
 ingress:
   enabled: false
-  annotations: {}
-  # kubernetes.io/ingress.class: "nginx"
+  tls: true
+  # annotations:
+  #   kubernetes.io/ingress.class: "nginx"
   # hosts:
   #   - clowder.localhost
   path: /
-  tls:
   #  - secretName: chart-example-tls
   #    hosts:
   #      - chart-example.local
@@ -126,7 +126,7 @@ extractors:
     #replicaCount: 1
     #pullPolicy: Always
     # env:
-    #   - name: foo
+    #   - name: extractor.bump.sh
     #     value: "bar"
   image-preview:
     image: clowder/extractors-image-preview:2.2.1
@@ -202,7 +202,7 @@ persistence:
   ##
   #storageClass: "-"
 
-  ## sisze of the storage class
+  ## size of the storage class
   size: 20Gi
 
   ## Annotations
```

## 0.12.0 

**Release date:** 2021-05-05

![AppVersion: 1.17.0](https://img.shields.io/static/v1?label=AppVersion&message=1.17.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update clowder to version 1.17.0 

### Default value changes

```diff
# No changes in this release
```

## 0.11.1 

**Release date:** 2021-04-24

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix persistence problem 
* update changelog 
* update README 

### Default value changes

```diff
# No changes in this release
```

## 0.11.0 

**Release date:** 2021-04-01

![AppVersion: 1.16.0](https://img.shields.io/static/v1?label=AppVersion&message=1.16.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* clowder 1.16.0, chart 1.11.0 

### Default value changes

```diff
# No changes in this release
```

## 0.10.1 

**Release date:** 2021-03-24

![AppVersion: 1.15.1](https://img.shields.io/static/v1?label=AppVersion&message=1.15.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* version 0.10.1 of chart, clowder 1.15.1 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 16685db..2c9575e 100644
--- a/values.yaml
+++ b/values.yaml
@@ -121,7 +121,7 @@ smtp:
 ## env          : additional environment variables to pass to extractor.
 extractors:
   file-digest:
-    image: clowder/extractors-digest:2.1.6
+    image: clowder/extractors-digest:2.2.0
     #enabled: true
     #replicaCount: 1
     #pullPolicy: Always
```

## 0.10.0 

**Release date:** 2021-03-04

![AppVersion: 1.15.0](https://img.shields.io/static/v1?label=AppVersion&message=1.15.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* clowder version 1.15.0, chart version 0.10.0 
* forgot to update README 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 9d91384..16685db 100644
--- a/values.yaml
+++ b/values.yaml
@@ -129,15 +129,15 @@ extractors:
     #   - name: foo
     #     value: "bar"
   image-preview:
-    image: clowder/extractors-image-preview:2.1.5
+    image: clowder/extractors-image-preview:2.2.1
   image-metadata:
-    image: clowder/extractors-image-metadata:2.1.5
+    image: clowder/extractors-image-metadata:2.1.6
   audio-preview:
-    image: clowder/extractors-audio-preview:2.1.5
+    image: clowder/extractors-audio-preview:2.1.6
   pdf-preview:
-    image: clowder/extractors-pdf-preview:2.1.5
+    image: clowder/extractors-pdf-preview:2.1.6
   video-preview:
-    image: clowder/extractors-video-preview:2.1.5
+    image: clowder/extractors-video-preview:2.2.0
   clamav:
     image: clowder/extractors-clamav:1.0.3
 
```

## 0.9.1 

**Release date:** 2021-02-09

![AppVersion: 1.14.1](https://img.shields.io/static/v1?label=AppVersion&message=1.14.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix problem with installed clowder version 
* tweaks to the release pipeline 
* use helm repo add 
* fix release 
* use main branch 
* update documentation 

### Default value changes

```diff
diff --git a/values.yaml b/values.yaml
index 1445333..9d91384 100644
--- a/values.yaml
+++ b/values.yaml
@@ -5,7 +5,7 @@
 image:
   repository: clowder
   name: clowder
-  tag: 1.13.0
+  tag: null
   checks: "ncsa/checks:1.0.0"
   pullPolicy: IfNotPresent
 
```

## 0.9.0 

**Release date:** 2021-02-04

![AppVersion: 1.14.1](https://img.shields.io/static/v1?label=AppVersion&message=1.14.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* bump clowder to version 1.14.1 
* package helm chart 
* fix ct.yaml 
* add linter 
* don't include elasticsearch2 chart 

### Default value changes

```diff
# No changes in this release
```

## 0.8.0 

**Release date:** 2021-02-04

![AppVersion: 1.13.0](https://img.shields.io/static/v1?label=AppVersion&message=1.13.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* create new clowder-helm repo 
* fix path to charts 
* auto build charts 
* fix typo 
* install betydb, add notes about secrets 
* copy charts to opensource 
* only ignore values-*.yaml in root 
* ignore bitnami 
* ignore charts folders, use helm dep up 
* use generic values 
* Initial Commit 

### Default value changes

```diff
# No changes in this release
```

---
Autogenerated from Helm Chart and git history using [helm-changelog](https://github.com/mogensen/helm-changelog)
