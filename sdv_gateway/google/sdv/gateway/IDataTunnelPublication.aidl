//
// Copyright (C) 2026 The Android Open Source Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

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
 *
 * @deprecated Comm stack API will be enabled for AAOS-IVI in the future.
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
