// Copyright 2024 Google LLC

package google.sdv.privileged.service_discovery;

import google.sdv.identity.ProcessIdentifier;
import google.sdv.service_discovery.common.AccessControl;
import google.sdv.service_discovery.common.RegistrationToken;
import google.sdv.service_discovery.common.UnitType;
import google.sdv.service_discovery.common.metadata.ApplicationMetadata;

/**
 * NOTE: Only the SDV Gateway service is allowed to use this interface.
 */
@VintfStability
interface IPrivilegedServiceRegistrationAgent {
    /**
     * Registers a Service Unit hosted by the calling Service Bundle along with the provided
     * Unit Type, ACLs, and Metadata for a specific caller process.
     *
     * Has the same behavior as {@link
     * google.sdv.service_discovery.discovery.IServiceRegistrationAgent.registerServiceUnit} but
     * additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     */
    RegistrationToken registerServiceUnitForProcess(@utf8InCpp String serviceUnitName,
            in UnitType unitType, in AccessControl acls, in ApplicationMetadata appMetadata,
            in ProcessIdentifier processIdentifier);

    /**
     * Unregisters the Service Unit hosted by the calling Service Bundle and identified by
     * the provided ServiceUnitName for a specific caller process.
     *
     * Has the same behavior as {@link
     * google.sdv.service_discovery.discovery.IServiceRegistrationAgent.unregisterServiceUnit} but
     * additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     */
    void unregisterServiceUnitForProcess(
            @utf8InCpp String serviceUnitName, in ProcessIdentifier processIdentifier);
}
