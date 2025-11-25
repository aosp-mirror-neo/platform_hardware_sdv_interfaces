// Copyright 2024 Google LLC

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
