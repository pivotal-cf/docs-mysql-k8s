# docs-mysql-k8s
================

Docs for VMware Tanzu™ SQL with MySQL for Kubernetes

## Which branch to use?

**Note**: Provide instructions in your PRs to indicate which branches you want Docs to apply your commits to.

| Branch name | Use for… |
|-------------| -------|
| main      | the development branch for the doc, publishes to https://docs-pcf-staging.cfapps.io/tanzu-mysql-kubernetes/1-n |
| 0.2      | v0.2.x beta, publishes to http://docs.pivotal.io/tanzu-mysql-kubernetes/0-2/|
| 0.1      | v0.1.x beta, publishes to http://docs.pivotal.io/tanzu-mysql-kubernetes/0-1/|


## Where is the book repository?

The private book repo associated with this content repo is [**docs-book-mysql-k8s**](https://github.com/pivotal-cf/docs-book-mysql-k8s).



## Style Guide

This is a word list for terminology and word usage specific to the VMware Tanzu SQL with MySQL for VMs docs.

| Word | Explanation |
|------|-------------|
| admin | Use as a person's job description instead of operator. Decided: JD, Kim Bassett, and David Sharp 2020.12.09 and changed to admin because that's our house style. If this specifically refers to the Kubernetes admin, use "Kubernetes admin" in first use on the page. |
| Kubernetes admin | See "admin" above. |
| Operator | Don't use as a job description for a person. Use as the "Tanzu MySQL Operator" or "Kubernetes Operator". Decided: 2020.12.10 Judy explained that the Tanzu MySQL Operator is a more precise term than the Kubernetes operator. The Tanzu MySQL Operator is a type of Kubernetes Operator. Use the capital "O" and in the first use on the page, preface with "Kubernetes" or something similar to show that it's a pattern and not a person.|
| Pod  | From the [word list](https://docs.google.com/spreadsheets/d/1hkadtxR1hY57kK7h5HN4ITHLJleZixCDH_RJPUpNq_A/edit?usp=sharing) See "TanzuMySQL Pod" below. |
| persistent volume claim (PVC)  | Spell out on first use on page.|
| TanzuMySQL instance  | Use this phrase consistently. Okay to shorten it to "instance". Not okay to use "MySQL instance" or "Tanzu instance" or "database instance". "TanzuMySQL" is a _kind_ in Kubernetes so that it the precise term. Decided: JD, Kim Bassett, and David Sharp 2020.12.09.|
| TanzuMySQL Pod | Usually use this instead of just Pod. Decided: 2020.12.10 Judy and Jane |

## Placeholder Table

This is a place to keep track of the placeholder we use.
We want to use placeholders consistently througout the doc.

| Placeholder | Sample | Explanation | Used in |
|-------------|--------|-------------|---------|
| DEVELOPMENT-NAMESPACE | my-namespace | "is the namespace in which you want to create the instance" or "is the namespace where you created the instance." | create-delete.html |
| REGISTRY-SERVER-URL |https://registry.pivotal.io/ |  is the TanzuNet registry or the private registry configured for your environment | create-delete.html|
| DOCKER-PASSWORD | sample-password | credentials used to pull images from the registry | create-delete.html |
| DOCKER-USERNAME |sample-username |  credentials used to pull images from the registry | create-delete.html |
| INSTANCE-NAME | tanzumysql-sample and another-sample |   is the value that you configured for metadata.name in the tanzumysql.yaml file | create-delete.html, accessing.html |
| INSTANCE-NAME-N (use instead of POD-NAME)| tanzumysql-sample-0 | "Where: + `INSTANCE-NAME` is the value that you configured for metadata.name in the tanzumysql.yaml file. + `N` is the index of the Pod in the TanzuMySQL instance." | create-delete-mysql.html, update-instance.html |
| REGISTRY-SERVER-URL |https://registry.pivotal.io/ |  is the TanzuNet registry or the private registry configured for your environment | create-delete.html|
|
