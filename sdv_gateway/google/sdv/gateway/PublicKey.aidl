// Copyright 2024 Google LLC

package google.sdv.gateway;

/**
 * Public key needed to create SDV service identity for IVI components.
 *
 * Note: not the final API.
 */

@VintfStability
parcelable PublicKey {
    byte[32] keyValue;
}
