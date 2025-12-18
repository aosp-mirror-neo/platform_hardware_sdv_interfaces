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
import google.sdv.privileged.gatewaynetworking.INetworkStateListener;

/**
 * NOTE: This interface is exposed by the SDV Gateway and only the (Java) SDV Gateway Networking
 * service is allowed to use this interface.
 *
 * @deprecated Gateway networking API will be internal in the future.
 */
@VintfStability
interface IPrivilegedGatewayNetworking {
    /**
     * Gets the name of the network interface for SDV-RPC from RpcAgent. We assume that RpcAgent's
     * configured network interface is static, ie: it does not change for the runtime of the
     * vehicle.
     *
     * @return String containing the network interface name or empty string if one wasn't created
     * by RpcAgent.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    @utf8InCpp String getRpcNetworkInterfaceName();

    /**
     * Sets the handle of the network interface for SDV-RPC from RpcAgent. We assume that RpcAgent's
     * configured network interface is static, ie: it does not change for the runtime of the
     * vehicle.
     *
     * @param handle that can be cast to net_handle_t and used with the Android C API to bind the
     *         network interface to the one used by the RPC agent.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    void setRpcNetworkHandle(long handle);

    /**
     * Passes the CarPowerState to SdvGateway from Java service.
     *
     * See b/418004379 for more contexts.
     *
     * @param state for the current power state of the device. The value is expected to be one of
     * the values of android.car.hardware.power.CarPowerManager.STATE_*.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    void onCarPowerStateChanged(CarPowerState state);

    /**
     * Registers a listener for network state changes. The listener will receive a notification
     * immediately after the registration.
     *
     * As a privileged interface, the caller is expected to be one of the SDV components, which is
     * not expected to die or unregister the callback.
     *
     * @param listener The listener to register.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    void registerNetworkStateListener(INetworkStateListener listener);

    /**
     * Sets a binder that is used as a liveness probe of the network service. The SdvGateway get
     * notified when the binder dies, and treats the event as a network disconnect. Calling this
     * methods a second time causes the old binder to be unbound and the new one to be used as a
     * liveness probe.
     * Calling this method with a null binder clears the old liveness probe (causes the old binder
     * to be unbound or does nothing).
     *
     * @param linkToDeath binder to use as liveness probe.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    void setNetworkServiceWatcher(@nullable IBinder linkToDeath);
}
