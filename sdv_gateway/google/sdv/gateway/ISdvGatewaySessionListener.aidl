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

/**
 * Interface for receiving events in the client's process from the SDV Gateway server.
 */
@VintfStability
oneway interface ISdvGatewaySessionListener {
    @VintfStability
    @Backing(type="int")
    enum EventType {
        /**
         * The RPC network's handle changed.
         */
        RPC_NETWORK_HANDLE_CHANGED = 0,
    }

    /**
     * Called when a new event is available.
     *
     * @param eventType The type of event.
     */
    void onEvent(in EventType eventType);
}
