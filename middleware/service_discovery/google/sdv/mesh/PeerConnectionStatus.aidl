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

package google.sdv.mesh;

/**
 * Represents connection status of a peer in the SDV Mesh from perspective of another peer.
 */
@RustDerive(Clone=true, PartialEq=true, Hash=true)
@VintfStability
parcelable PeerConnectionStatus {
    /**
     * Describes the reason for disconnection.  This field is only valid if
     * `connectionStatus` is `DISCONNECTED`.
     */
    @Backing(type="int")
    enum DisconnectionReason {
        /** Reason for disconnection is unknown or not applicable. */
        UNKNOWN,

        /**
         * Disconnection due to an internal error within the local VM. This
         * precludes any connectivity or authentication error.
         */
        INTERNAL_ERROR,

        /**
         * Disconnection due to a connectivity problem. This is unrelated to
         * credentials provisioning flows, and precludes any authentication
         * error.
         */
        CONNECTIVITY_ERROR,

        /**
         * Disconnection due to an authentication failure.  This can have
         * multiple software causes, such as a failed provisioning flow, DICE
         * policy verification failure, boot mode mismatch, or an unknown VM
         * name.  This is likely to require more detailed reporting in the
         * future.
         */
        AUTHENTICATION_ERROR,
    }

    /**
     * Describes the connection status of the peer.
     */
    @Backing(type="int")
    enum ConnectionStatus {
        /**
         * Status of the peer is unknown. This is unexpected state that likely caused by a logic
         * error.
         */
        UNKNOWN,
        /**
         * Peer is disconnected.
         */
        DISCONNECTED,
        /**
         * Peer is connected.
         */
        CONNECTED,
    }

    /** Name of the peer VM. */
    String vmName;

    /** Connection status of a peer. */
    ConnectionStatus connectionStatus;

    /**
     * Reason for disconnection.  This field is only valid if `connectionStatus` is
     * `DISCONNECTED`.
     */
    DisconnectionReason disconnectionReason;
}
