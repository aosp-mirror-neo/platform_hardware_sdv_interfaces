// Copyright 2024 Google LLC

package google.sdv.gateway;

/**
 * SocketAddress is a tuple of (host, port)
 *
 * Note: not the final API.
 */

@VintfStability
parcelable SocketAddress {
    @utf8InCpp String host;
    int port;
}
