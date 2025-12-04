// Copyright 2024 Google LLC

package google.sdv.privileged.gatewaynetworking;

import google.sdv.privileged.gatewaynetworking.CarPowerState;

/**
 * NOTE: This interface is exposed by the SDV Gateway and only the (Java) SDV Gateway Networking
 * service is allowed to use this interface.
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
}
