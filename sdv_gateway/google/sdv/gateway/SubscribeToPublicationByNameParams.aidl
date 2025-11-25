// Copyright 2024 Google LLC

package google.sdv.gateway;

/**
 * Parameters for subscribing to a Data Tunnel publication service unit identified by name.
 *
 * Note: not the final API.
 */
@VintfStability
parcelable SubscribeToPublicationByNameParams {
    /**
     * sdvVmName the SDV VM instance (of the publisher) to subscribe to. Mandatory if there are
     * multiple VM instances that contain an exact match for the sdvPackageName, serviceBundleName,
     * and serviceUnitName.
     */
    @utf8InCpp String sdvVmName;
    /** The SDV Package Name (of the publisher) to subscribe to. */
    @utf8InCpp String sdvPackageName;
    /** The Service Bundle Name as declared in the publisher package's manifest. */
    @utf8InCpp String serviceBundleName;
    /** The service unit name (of the publisher) to subscribe to. */
    @utf8InCpp String serviceUnitName;
}
