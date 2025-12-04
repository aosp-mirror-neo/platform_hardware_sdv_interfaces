// Copyright 2024 Google LLC

package google.sdv.gateway;

import google.sdv.gateway.ISdvGatewaySession;

/**
 * AIDL interface for the SDV Gateway service on AAOS-IVI.
 *
 * Note: not the final API.
 * TODO(b/340519425): Return the SDV public error APIs.
 */

@VintfStability
interface ISdvGateway {
    /**
     * Returns the version of the SDV Gateway service.
     *
     * @return the version of SDV Gateway service in string format.
     */
    String getVersion();

    /**
     * Creates a session for interacting with the SDV Gateway. Sessions are independent of each
     * other and provide separated contexts for clients. A single session is allowed for a client
     * process. Attempting to create a new session while a session exists will result in an error.
     *
     * In order to delete a session, the client process must release all references to it.
     * Clients must not pass the session to other processes.
     *
     * @return a new session object.
     * @return Status::ok on success
     *         EX_SERVICE_SPECIFIC containing a @{link SdvGatewayStatusCode} error code and an error
     * message in case of failure.
     */
    ISdvGatewaySession createSession();
}
