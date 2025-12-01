// Copyright 2024 Google LLC

package google.sdv.gateway;

import google.sdv.gateway.PublicKey;
import google.sdv.gateway.data_tunnel.ClientDescriptor;
import google.sdv.gateway.data_tunnel.PublicationDescriptor;
import google.sdv.gateway.service_discovery.PublisherUnitMetadata;

/**
 * A publication that can be used to read messages and receive notifications (as a subscriber) or to
 * write messages (as a publisher) in the calling application's process through the
 * "libsdvgatewayclient" library.
 *
 * Note: not the final API.
 */

@VintfStability
interface IDataTunnelPublication {
    /**
     * Returns the descriptor required for creating the FMQ in the client process. Called internally
     * by the "ASDVGateway_Client_bindSubscriber" or "ASDVGateway_Client_bindPublisher" C API
     * functions. Should only be called once.
     *
     * NOTE: Don't call directly. Use the C API functions from "libsdvgatewayclient" to read/write
     * Data Tunnel messages and to get notifications.
     */
    PublicationDescriptor takeOwnershipOfPublicationDescriptor();

    /**
     * Returns metadata of the publisher unit (version, message size and count).
     */
    PublisherUnitMetadata getMetadata();

    /**
     * Closes the subscription or destroys the publication.
     */
    void closeOrDestroy();
}
