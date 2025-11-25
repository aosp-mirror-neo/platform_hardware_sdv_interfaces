// Copyright 2024 Google LLC

package google.sdv.gateway;

import google.sdv.gateway.service_discovery.PublisherUnitMetadata;
import google.sdv.gateway.service_discovery.UnitType;

/**
 * Parameters for creating a Data Tunnel publication.
 *
 * Note: not the final API.
 */
@VintfStability
parcelable CreatePublicationParams {
    /** The name of the service unit to register and create a publisher for. */
    @utf8InCpp String serviceUnitName;
    /** The unit type of the service unit to register and create a publisher for. */
    UnitType unitType;
    /**
     * The version, the size in bytes of the publication's messages, the number of messages that
     * can be stored in the publication
     */
    PublisherUnitMetadata publisherUnitMetadata;
}
