// Copyright 2024 Google LLC

package google.sdv.gateway.service_discovery;

/**
 * Standardized metadata for a Publisher Service Unit registered with Service Discovery.
 *
 * Note: not the final API.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true)
@VintfStability
parcelable PublisherUnitMetadata {
    int version; // unsigned 32 bits
    int messageSizeBytes;
    int messageCount;
    byte[] valueHolder;
}
