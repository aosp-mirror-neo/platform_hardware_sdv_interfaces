// Copyright 2024 Google LLC

package google.sdv.gateway;

/**
 * RequestCertificateChainParams contains the parameters needed to call SDV Gateway Session AIDL's
 * requestCertificateChain API
 */

@VintfStability
parcelable RequestCertificateChainParams {
    /**
     * A PEM-encoded PKCS #10 Certification Request. It must contain the Subject Alternative Name
     * value from the @{link RpcCredentialsConfigResult}.
     */
    @utf8InCpp String certificationRequestPem;
}
