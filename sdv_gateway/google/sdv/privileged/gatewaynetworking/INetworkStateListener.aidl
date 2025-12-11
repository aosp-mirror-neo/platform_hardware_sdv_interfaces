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

package google.sdv.privileged.gatewaynetworking;

import google.sdv.privileged.gatewaynetworking.CarPowerState;

/**
 * Interface for receiving events in the client's process from the SDV Gateway server. The power
 * state event is also included in this listener as sdv network and power event are coupled on some
 * platforms.
 */
@VintfStability
oneway interface INetworkStateListener {
    /**
     * Called when the network state changed.
     *
     * @param networkHandle The network handle. Or 0 if the network is not
     * available.
     */
    void onSdvNetworkHandleChanged(in long networkHandle);

    /**
     * Called when the power state changed. This forwards the signal from the SDVGatewayNetworking
     * service to gateway listeners and subscribers by SDVGateway.
     *
     * TODO: b/463265090 - Can be moved to a dedicated interface only for power events. Or removed
     * by using ICarPowerStateChangeListener directly.
     *
     * @param powerState The power state.
     */
    void onCarPowerStateChanged(in CarPowerState powerState);
}
