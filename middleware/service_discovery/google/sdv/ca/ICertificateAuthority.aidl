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

package google.sdv.ca;

import google.sdv.ca.IAuthoritiesListener;

/**
 * Interface for the authority that issues certificates for Service Bundles.
 *
 */
@VintfStability
interface ICertificateAuthority {
    /**
     * Requests a certificate from the authority.
     *
     * The authority will only issue a certificate for the FQIN currently registered to the
     * caller's process.
     *
     * @param request A PEM-encoded PKCS #10 Certification Request.
     *                It must contain the BASE32-encoded FQIN of the requestor as the
     *                subject alternative DNS name.
     *
     * Returns the PEM-encoded certificate chain for the requested public key.
     *
     * Fails with StatusCode INVALID_OPERATION if isEnabled() is false.
     */
    String requestCertification(in String request);

    /**
     * Adds a listener to receive updates on the list of CAs present in the vehicle.
     *
     * Each SDV VM has its own certificate authority (CA). As SDV VMs join or leave the
     * secure mesh, their corresponding CAs will be added or removed from this list.
     *
     * listener.onAuthoritiesChanged will immediately be called once to return the current list
     * and later whenever that list changes.
     *
     * Fails with StatusCode INVALID_OPERATION if isEnabled() is false.
     *
     * @param listener Listener interface for receiving the list of certificate authorities
     *                 and any further updates that might happen later.
     */
    void addAuthoritiesListener(in IAuthoritiesListener listener);

    /**
     * Stops an IAuthoritiesListener from receiving updates from the CA.
     *
     * Fails with StatusCode INVALID_OPERATION if isEnabled() is false.
     *
     * @param listener Listener that was previously passed to addAuthoritiesListener.
     */
    void removeAuthoritiesListener(in IAuthoritiesListener listener);

    /**
     * Whether the certificate authority (CA) service is enabled.
     *
     * If `true`, requestCertificate, addAuthoritiesListener and removeAuthoritiesListener
     * calls will be processed as expected. This wil be the case when the SDV Boot Mode is
     * LOCKED.
     *
     * If `false`, requestCertificate and setAuthoritiesListener calls will fail with
     * StatusCode INVALID_OPERATION. This wil be the case when the SDV Boot Mode is
     * UNLOCKED.
     *
     * If the CA service is disabled, communications that would go through TLS channels
     * using material from this interface should happen in plain-text (unauthenticated and
     * unencrypted) instead.
     */
    boolean isEnabled();
}
