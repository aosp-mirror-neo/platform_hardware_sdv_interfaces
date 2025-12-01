// Copyright 2024 Google LLC

package google.sdv.gateway;

/**
 * RequestCertificateChainResult contains the response to SDV Gateway Session AIDL's
 * requestCertificateChain API call.
 */

@VintfStability
parcelable RequestCertificateChainResult {
    /**
     * The certicate chain corresponding to the certication request in PEM format.
     */
    @utf8InCpp String certificateChainPem;
}
