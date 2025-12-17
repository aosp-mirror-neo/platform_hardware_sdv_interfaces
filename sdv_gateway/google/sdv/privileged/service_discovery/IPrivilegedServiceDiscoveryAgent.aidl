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

package google.sdv.privileged.service_discovery;

import google.sdv.identity.ProcessIdentifier;
import google.sdv.identity.ServiceFqin;
import google.sdv.service_discovery.common.UnitType;
import google.sdv.service_discovery.discovery.IServiceUnitChangeListener;
import google.sdv.service_discovery.discovery.IServiceUnitFetchListener;
import google.sdv.service_discovery.discovery.ServiceUnitDefinition;
import google.sdv.service_discovery.discovery.UnitNameParameters;
import java.util.List;

/**
 * NOTE: Only the SDV Gateway service is allowed to use this interface.
 *
 * @deprecated Comm stack API will be enabled for AAOS-IVI in the future.
 */
@VintfStability
interface IPrivilegedServiceDiscoveryAgent {
    /**
     * Discovers all Service Units registered with the specified UnitType.
     *
     * Returns a list of ServiceUnitDefinition objects one for each of the discovered Unit,
     * or an empty list if nothing was found but
     * additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     */
    void fetchServiceUnitsByTypeForProcess(in UnitType unitType,
            in IServiceUnitFetchListener listener, in ProcessIdentifier processIdentifier);

    /**
     * Discovers all Service Units that match the provided UnitNameParameters.
     *
     * Returns a list of ServiceUnitDefinition objects one for each of the discovered Unit,
     * or an empty list if nothing was found but
     * additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     */
    void fetchServiceUnitsByNameForProcess(in UnitNameParameters query,
            in IServiceUnitFetchListener listener, in ProcessIdentifier processIdentifier);

    /**
     * Discovers the single Service Unit identified by the provided the FQIN (Fully
     * Qualified Instance Name), and UnitName.
     *
     * Returns a single ServiceUnitDefinition object or null if the Server Unit does not
     * exist but
     * additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     */
    @nullable ServiceUnitDefinition getServiceUnitForProcess(in ServiceFqin fqin,
            @utf8InCpp String unitName, in ProcessIdentifier processIdentifier);

    /**
     * Registers the IServiceUnitChangeListener to monitor lifecycle events (registration,
     * unregistration, and change) for units matching unitType. If some units matching the unitType
     * are already registered, the onServiceUnitRegistered callback will be called immediately.
     * Otherwise, no callback method will be called until a unit is registered. An
     * onServiceUnitUnregistered or onServiceUnitChanged callback will not be called before an
     * onServiceUnitRegistered callback is called for a given service unit.
     * Multiple callbacks can be registered for the same UnitType even if called from the same
     * process.
     * Additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     *
     * @param unitType type of service units to monitor.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching the unitType.
     */
    void registerServiceUnitChangeListenerByTypeForProcess(in UnitType unitType,
            in IServiceUnitChangeListener listener, in ProcessIdentifier processIdentifier);

    /**
     * Unregisters the IServiceUnitChangeListener for a UnitType.
     * This method does nothing if the listener is not registered, and can be called
     * multiple times safely.
     * Additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     *
     * @param unitType of monitored service units for which listener was previously registered.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching a unitType.
     */
    void unregisterServiceUnitChangeListenerByTypeForProcess(in UnitType unitType,
            in IServiceUnitChangeListener listener, in ProcessIdentifier processIdentifier);

    /**
     * Registers the IServiceUnitChangeListener to monitor lifecycle events (registration,
     * unregistration, and change) for units matching a query. If some units matching the query are
     * already registered, the onServiceUnitRegistered callback will be called immediately.
     * Otherwise, no callback method will be called until a unit is registered. An
     * onServiceUnitUnregistered or onServiceUnitChanged callback will not be called before an
     * onServiceUnitRegistered callback is called for a given service unit.
     * Multiple callbacks can be registered for the same query even if called from the same
     * process.
     * Additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     *
     * @param query UnitNameParameters of monitored service units.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching the query.
     */
    void registerServiceUnitChangeListenerByNameForProcess(in UnitNameParameters query,
            in IServiceUnitChangeListener listener, in ProcessIdentifier processIdentifier);

    /**
     * Unregisters the IServiceUnitChangeListener for a query.
     * This method does nothing if the listener is not registered, and can be called
     * multiple times safely.
     * Additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     *
     * @param query UnitNameParameters of monitored service units for which the listener was already
     *         registered.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching the provided
     *         UnitNameParameters query.
     */
    void unregisterServiceUnitChangeListenerByNameForProcess(in UnitNameParameters query,
            in IServiceUnitChangeListener listener, in ProcessIdentifier processIdentifier);

    /**
     * Unregisters the IServiceUnitChangeListener by clearing all its registrations.
     * This method does does nothing if the listener is not registered, and can be called
     * multiple times safely.
     * Additionally allows the ProcessIdentifier of the caller application to be explicitly passed
     * as an argument and can only be used by the SDV Gateway service.
     *
     * @param listener implementation of IServiceUnitChangeListener that was previously registered.
     */
    void unregisterServiceUnitChangeListenerForProcess(
            in IServiceUnitChangeListener listener, in ProcessIdentifier processIdentifier);
}
