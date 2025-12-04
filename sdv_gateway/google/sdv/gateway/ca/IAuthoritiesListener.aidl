// Copyright 2024 Google LLC

package google.sdv.gateway.ca;

/**
 * Interface for receiving the list of certificate authorities present in the vehicle.
 */
@VintfStability
oneway interface IAuthoritiesListener {
    /**
     * Returns the PEM-encoded X.509 certificate authorities list currently present in the vehicle.
     */
    void onAuthoritiesChanged(in String authoritiesListPem);
}
