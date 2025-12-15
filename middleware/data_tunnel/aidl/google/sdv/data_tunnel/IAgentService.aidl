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

package google.sdv.data_tunnel;

/**
 * PoC version of publisher API for Data Tunnel service.
 *
 * Unstable until API council approval.
 */

import android.hardware.common.fmq.MQDescriptor;
import android.hardware.common.fmq.UnsynchronizedWrite;
import google.sdv.data_tunnel.ClientDescriptor;
import google.sdv.data_tunnel.PublicationDescriptor;
import google.sdv.identity.UnitIdentifier;
import google.sdv.service_discovery.common.RegistrationToken;
import google.sdv.service_discovery.common.UnitType;

/**
 *  Data Tunnel Agent private interface
 */
@VintfStability
interface IAgentService {
    /**
     * The method failed with an unknown error.
     */
    const int ERROR_UNKNOWN = 1;
    /**
     * The method failed with an Access Denied error.
     */
    const int ERROR_ACCESS_DENIED = 2;

    /**
     * Establishes connection with the local Data Tunnel Agent instance using 64-bit sid
     * of ServiceIdentity and returns the ClientDescriptor along with the assigned client_id
     * and a pair of pipe handles for duplex communication.
     */
    void Connect(in long sid, out ClientDescriptor client_desc);

    /**
     * Registers a new publication with the given registration token and a descriptor for
     * an FMQ already allocated by the publishing client and returns its descriptor.
     * A publication cannot be registered twice with the same RegistrationToken; in this case,
     * the method will return an error.
     */
    void RegisterPublication(in RegistrationToken registration_token,
            in MQDescriptor<byte, UnsynchronizedWrite> mq_descriptor,
            out PublicationDescriptor publication_descriptor);

    /**
     * Destroys the specified publication and cleans up all the associated resources. The method
     * will return an error if the publication_id is invalid or the publication has already been
     * destroyed.
     */
    void DestroyPublication(in int publication_id);

    /**
     * Subscribes to the specified publication with the given unit identifier and returns
     * its descriptor. The method will return an error if the unit_identifier is invalid or refers
     * to a previously deleted publication.
     */
    void SubscribeToPublication(
            in UnitIdentifier unit_identifier, out PublicationDescriptor publication_descriptor);

    /**
     * Unsubscribes from the specified publication. The agent will continue to send notifications
     * as long as there is at least one active subscriber to the specified publication.
     */
    void UnsubscribeFromPublication(in int publication_id);

    /**
     * Fetches the last message from the specified publication with the given unit identifier.
     * The method will return an error if the unit_identifier is invalid or refers to a previously
     * deleted publication.
     */
    void GetLastPublicationMessage(in UnitIdentifier unit_identifier, out byte[] message);

    /**
     * Fetches the last message from the specified channel with the given unit type and channel
     * name. The method will return an error if the unit_type or channel_name is invalid or refers
     * to a previously deleted publication.
     */
    void GetLastChannelMessage(in UnitType unit_type, in String channel_name, out byte[] message);
}
