// Copyright 2024 Google LLC

package google.sdv.privileged.identity;

import google.sdv.identity.ProcessIdentifier;
import google.sdv.identity.ServiceFqin;
import google.sdv.identity.ServiceIdentity;

/**
 * NOTE: Only the SDV Gateway service is allowed to use this interface.
 */
@VintfStability
interface IPrivilegedIdentityAgent {
    /**
     * Create a new Identity for the Service given the arguments.
     *
     * Has the same behavior as {@link google.sdv.identity.IIdentityAgent.createIdentity} but
     * additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     */
    ServiceIdentity createIdentityForProcess(in ServiceIdentity.EcPublicKey publicKey,
            in ServiceFqin fqin, in IBinder linkToDeath, in ProcessIdentifier process_identifier);
}
