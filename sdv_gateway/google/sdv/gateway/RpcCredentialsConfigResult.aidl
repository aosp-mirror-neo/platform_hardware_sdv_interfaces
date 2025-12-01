// Copyright 2024 Google LLC

package google.sdv.gateway;

/**
 * RpcCredentialsConfigResult contains the result of a call SDV Gateway Session AIDL's
 * rpcCredentialsConfig API.
 */

@VintfStability
parcelable RpcCredentialsConfigResult {
    /** Whether insecure or secure channels and RPC servers should be created. */
    boolean useInsecureRpc;
    /**
     * Subject Alternative Name (SAN) value that must be set by the caller in the X.509 extension
     * field of the certificates it creates. Can be ignored if @{link useInsecureRpc} is set to
     * true.
     */
    @utf8InCpp String subjectAlternativeName;
}
