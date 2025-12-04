// Copyright 2024 Google LLC

package google.sdv.gateway;

/**
 * FindRpcServerByNameParams contains the parameters needed to call SDV Gateway Session AIDL's
 * findRpcServerByName API
 */

@VintfStability
parcelable FindRpcServerByNameParams {
    /**
     * The name of the virtual machine where the server is to be searched. When this is left empty,
     * all VMs will be used in the search.
     */
    @utf8InCpp String sdvVmName;
    /** The name of the server package (in the registered FQIN). */
    @utf8InCpp String packageName;
    /**
     * The name of the service bundle where the service to connect to is included (in the
     * registered FQIN).
     */
    @utf8InCpp String serviceBundleName;
    /** The name of the service unit registered via registration agent. */
    @utf8InCpp String serviceUnitName;
}
