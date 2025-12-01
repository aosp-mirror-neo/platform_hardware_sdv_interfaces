// Copyright 2024 Google LLC

package google.sdv.gateway.service_discovery;

/**
 * ServerUnitMetadata contains the metadata required for registering a new server within SDV
 * Gateway Session AIDL (part of the RegisterRpcServerParams parameter for registerRpcServer
 * method).
 */

@VintfStability
parcelable ServerUnitMetadata {
    byte[] valueHolder;
    int version;
}
