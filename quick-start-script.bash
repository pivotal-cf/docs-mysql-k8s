#!/usr/bin/env bash

# This script will deploy VMware MySQL Operator from Tanzu Network Registry in the `vmware-mysql-for-kubernetes-system` namespace.
# It also deploys the dependencies (latest version of cert-manager) needed by the operator to run.

SCRIPT_USAGE_MESSAGE="Run the script as $0 <MYSQL_OPERATOR_VERSION> <TANZU_REGISTRY_USERNAME> <TANZU_REGISTRY_PASSWORD>"

install_cert_manager() {
    if [ "$(kubectl api-resources --api-group=cert-manager.io -o name | wc -l)" -eq 0 ] ; then
        helm repo add jetstack https://charts.jetstack.io
        helm repo update

        echo -e "\nInstalling cert-manager..."
        helm install cert-manager jetstack/cert-manager --namespace cert-manager --set installCRDs=true --create-namespace

        echo "Waiting for cert-manager to be up..."
        kubectl rollout status --timeout=10m --namespace cert-manager deployment.apps/cert-manager
        kubectl rollout status --timeout=10m --namespace cert-manager deployment.apps/cert-manager-cainjector
        kubectl rollout status --timeout=10m --namespace cert-manager deployment.apps/cert-manager-webhook
    else
        echo "It looks like cert-manager is already installed. Skipping cert-manager installation."
    fi
}

log_in_to_registry() {
    helm registry login registry.tanzu.vmware.com --username="${TANZU_REGISTRY_USERNAME}" --password-stdin <<< "${TANZU_REGISTRY_PASSWORD}"
}

create_operator_namespace() {
    kubectl create namespace "$OPERATOR_NAMESPACE"
}

create_docker_registry_secret() {
    kubectl delete secret tanzu-image-registry --namespace "${OPERATOR_NAMESPACE}"
    kubectl create secret docker-registry tanzu-image-registry \
        --docker-server=https://registry.tanzu.vmware.com/ \
        --docker-username="${TANZU_REGISTRY_USERNAME}" \
        --docker-password="${TANZU_REGISTRY_PASSWORD}" \
        --namespace "${OPERATOR_NAMESPACE}"
}

deploy_operator() {
    if [ "$(kubectl api-resources --api-group=with.sql.tanzu.vmware.com -o name | grep mysql | wc -l)" -eq 0 ] ; then
        helm install "vmware-sql-with-mysql-operator" oci://registry.tanzu.vmware.com/tanzu-mysql-for-kubernetes/vmware-sql-with-mysql-operator \
            --version "${OPERATOR_VERSION}" \
            --namespace "${OPERATOR_NAMESPACE}" \
            --wait
        echo -e "\nMySQL operator ${OPERATOR_VERSION} installed successfully."
    else
        echo "It looks like mysql operator is already installed. Skipping operator deployment."
    fi
}

main() {
    OPERATOR_VERSION=${1?$SCRIPT_USAGE_MESSAGE}
    TANZU_REGISTRY_USERNAME=${2?$SCRIPT_USAGE_MESSAGE}
    TANZU_REGISTRY_PASSWORD=${3?$SCRIPT_USAGE_MESSAGE}
    OPERATOR_NAMESPACE="vmware-mysql-for-kubernetes-system"

    install_cert_manager

    echo -e "\nLogging in to the Tanzu Network registry..."
    log_in_to_registry

    echo -e "\nCreating ${OPERATOR_NAMESPACE} namespace"
    create_operator_namespace

    echo -e "\nCreating a registry secret ..."
    create_docker_registry_secret

    echo -e "\nDeploying VMware MySQL Operator in ${OPERATOR_NAMESPACE} namespace with the default values..."
    deploy_operator
}

main "$@"
