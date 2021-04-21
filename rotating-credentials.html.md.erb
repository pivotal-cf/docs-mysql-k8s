---
title: Rotating MySQL Credentials
owner: MySQL
---

<strong><%= modified_date %></strong>

This topic describes how to rotate the MySQL root password and the MySQL backup user password.

## <a id='overview'></a>Overview

When a user provisions a MySQL instance, the MySQL
Operator automatically creates a Kubernetes secret containing the MySQL root password
as well as the password for the MySQL backup user.

To adhere to security best practices or to company regulations, VMware
recommends rotating a MySQL instance's credentials regularly.
In addition, you should rotate a password if it is compromised for any reason.

This topic provides multiple methods for rotating passwords for a
MySQL instance.

* [Option 1: Delete the Kubernetes Secret](#delete-secret):
Kubernetes automatically re-creates the secret with newly generated passwords.

* [Option 2: Patch the Kubernetes Secret with a Custom Password](#patch-secret):
This procedure enables you to configure MySQL with your own custom passwords.
It also enables you to rotate the root password and the backup user password individually.

## <a id='prereq'></a>Prerequisites

Before you rotate a MySQL instance's password, you need:

* The Kubernetes Command Line Interface (kubectl) installed.
For more information, see the
[Kubernetes documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl/).

* `admin` Role access to the namespace of the MySQL instance for which you want to
   rotate the root password. For more information about User-facing roles, see the
   [Kubernetes documentation](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles).

## <a id='delete-secret'></a>Option 1: Delete the Kubernetes Secret

This option deletes the Kubernetes secret containing the MySQL passwords.
When the secret is deleted, Kubernetes automatically re-creates the secret
with newly generated passwords.
This procedure rotates both the MySQL root password and the backup user password.

1. Delete the Kubernetes secret by running:

    ```
    kubectl delete secret INSTANCE-NAME-credentials
    ```
    Where `INSTANCE-NAME` is the name of the MySQL instance.

    For example:

    <pre class="terminal">$ kubectl delete secret mysql-sample-credentials
    <br>secret "mysql-sample-credentials" deleted
    </pre>

1. Wait until Kubernetes has automatically re-created the secret.
   You can watch the progress by running:

    ```
    kubectl get secret --watch
    ```
    For example:

    <pre class="terminal">$ kubectl get secret --watch
    <br>NAME                                  TYPE                                  DATA   AGE
    default-token-wb7gl                   kubernetes.io/service-account-token   3      10d
    <span style="color: #77bf00;">mysql-sample-credentials         Opaque                                4      48s</span>
    tanzu-mysql-backup-cron-token-c7bnt   kubernetes.io/service-account-token   3      10d
    tanzu-mysql-image-registry            kubernetes.io/dockerconfigjson        1      2m3s
    tanzu-mysql-token-24cdv               kubernetes.io/service-account-token   3      10d
    </pre>

1. Update the database with the new passwords by restarting your MySQL instance:

    ```
    kubectl rollout restart statefulset INSTANCE-NAME
    ```

    For example:

    <pre class="terminal">$ kubectl rollout restart statefulset mysql-sample
    <br>statefulset.apps/mysql-sample restarted
    </pre>

1. Verify that your MySQL instance has finished updating by running:

    ```
    kubectl get mysql INSTANCE-NAME
    ```
    A MySQL instance has finished updating when the value of the `STATUS`
    column is `Running`.
    For example:

    <pre class="terminal">$ kubectl get mysql mysql-sample
    <br>NAME           READY   STATUS    AGE
    mysql-sample   true    Running   10d
    </pre>

1. To verify that the passwords were rotated successfully, try connecting to your
   MySQL instance.
   See [Accessing MySQL Instances](accessing.html).

## <a id='patch-secret'></a>Option 2: Patch the Kubernetes Secret with a Custom Password

This option patches the existing Kubernetes secret with a new password.
This procedure allows you to configure MySQL with your own custom passwords.
You can use this procedure to rotate either the MySQL root password or the backup
user password.

1. Patch the secret with your custom password by running:

    ```
    kubectl patch secret INSTANCE-NAME-credentials -p='{"stringData":{"PASSWORD-FIELD":"CUSTOM-PASSWORD"}}'
    ```
    Where:
    * `INSTANCE-NAME` is the name of the MySQL instance.
    * `PASSWORD-FIELD` is either `rootPassword` if you are changing the MySQL root password or
      `backupPassword` if you are changing the MySQL backup user password.
    * `CUSTOM-PASSWORD` is your custom password in plaintext. Kubernetes stores this password
      as a base64-encoded string in the Kubernetes secret.

    For example:

    <pre class="terminal">$ kubectl patch secret mysql-sample-credentials -p='{"stringData":{"rootPassword":"examplepassword"}}'
    <br>secret/mysql-sample-credentials patched
    </pre>

1. To update the database with the new password, restart your MySQL instance
   by running:

    ```
    kubectl rollout restart statefulset INSTANCE-NAME
    ```
    For example:

    <pre class="terminal">$ kubectl rollout restart statefulset mysql-sample
    <br>statefulset.apps/mysql-sample restarted
    </pre>

1. Verify that your MySQL instance has finished updating by running:

    ```
    kubectl get mysql INSTANCE-NAME
    ```
    A MySQL instance has finished updating when the value of the `STATUS`
    column is `Running`.
    For example:

    <pre class="terminal">$ kubectl get mysql mysql-sample
    <br>NAME           READY   STATUS    AGE
    mysql-sample   true    Running   10d
    </pre>

1. To verify that the password was rotated successfully, try connecting to your
   MySQL instance.
   See [Accessing MySQL Instances](accessing.html).
