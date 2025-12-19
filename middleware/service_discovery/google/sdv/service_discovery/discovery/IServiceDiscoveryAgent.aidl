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

package google.sdv.service_discovery.discovery;

import google.sdv.identity.ServiceFqin;
import google.sdv.service_discovery.common.UnitType;
import google.sdv.service_discovery.discovery.IChannelFetchListener;
import google.sdv.service_discovery.discovery.IServiceUnitChangeListener;
import google.sdv.service_discovery.discovery.IServiceUnitFetchListener;
import google.sdv.service_discovery.discovery.ServiceUnitDefinition;
import google.sdv.service_discovery.discovery.UnitNameParameters;
import java.util.List;

@VintfStability
interface IServiceDiscoveryAgent {
    /**
     * Deprecated - to be removed
     * Discovers all Service Units registered with the specified UnitType.
     *
     * Returns a list of ServiceUnitDefinition objects one for each of the discovered Unit,
     * or an empty list if nothing was found.
     */
    List<ServiceUnitDefinition> listServiceUnitsByType(in UnitType unitType);

    /**
     * Deprecated - to be removed
     * Discovers all Service Units that match the provided UnitNameParameters.
     *
     * Returns a list of ServiceUnitDefinition objects one for each of the discovered Unit,
     * or an empty list if nothing was found.
     */
    List<ServiceUnitDefinition> listServiceUnitsByName(in UnitNameParameters query);

    /**
     * Discovers all Service Units registered with the specified UnitType.
     *
     * Returns a list of ServiceUnitDefinition objects one for each of the discovered Unit,
     * or an empty list if nothing was found.
     */
    void fetchServiceUnitsByType(in UnitType unitType, in IServiceUnitFetchListener listener);

    /**
     * Discovers all Service Units that match the provided UnitNameParameters.
     *
     * Returns a list of ServiceUnitDefinition objects one for each of the discovered Unit,
     * or an empty list if nothing was found.
     */
    void fetchServiceUnitsByName(
            in UnitNameParameters query, in IServiceUnitFetchListener listener);

    /**
     * Discovers the single Service Unit identified by the provided the FQIN (Fully
     * Qualified Instance Name), and UnitName.
     *
     * Returns a single ServiceUnitDefinition object or null if the Server Unit does not
     *   exist.
     */
    @nullable ServiceUnitDefinition getServiceUnit(
            in ServiceFqin fqin, @utf8InCpp String unitName);

    /**
     * Registers the IServiceUnitChangeListener to monitor lifecycle events (registration,
     * unregistration, and change) for units matching unitType. If some units matching the unitType
     * are already registered, the onServiceUnitRegistered callback will be called immediately.
     * Otherwise, no callback method will be called until a unit is registered. An
     * onServiceUnitUnregistered or onServiceUnitChanged callback will not be called before an
     * onServiceUnitRegistered callback is called for a given service unit.
     * Multiple callbacks can be registered for the same UnitType even if called from the same
     * process.
     *
     * @param unitType type of service units to monitor.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching the unitType.
     */
    void registerServiceUnitChangeListenerByType(
            in UnitType unitType, in IServiceUnitChangeListener listener);

    /**
     * Unregisters the IServiceUnitChangeListener for a UnitType.
     * This method does nothing if the listener is not registered, and can be called
     * multiple times safely.
     *
     * @param unitType of monitored service units for which listener was previously registered.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching a unitType.
     */
    void unregisterServiceUnitChangeListenerByType(
            in UnitType unitType, in IServiceUnitChangeListener listener);

    /**
     * Registers the IServiceUnitChangeListener to monitor lifecycle events (registration,
     * unregistration, and change) for units matching a query. If some units matching the query are
     * already registered, the onServiceUnitRegistered callback will be called immediately.
     * Otherwise, no callback method will be called until a unit is registered. An
     * onServiceUnitUnregistered or onServiceUnitChanged callback will not be called before an
     * onServiceUnitRegistered callback is called for a given service unit.
     * Multiple callbacks can be registered for the same query even if called from the same
     * process.
     *
     * @param query UnitNameParameters of monitored service units.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching the query.
     */
    void registerServiceUnitChangeListenerByName(
            in UnitNameParameters query, in IServiceUnitChangeListener listener);

    /**
     * Unregisters the IServiceUnitChangeListener for a query.
     * This method does nothing if the listener is not registered, and can be called
     * multiple times safely.
     *
     * @param query UnitNameParameters of monitored service units for which the listener was already
     *         registered.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching the provided
     *         UnitNameParameters query.
     */
    void unregisterServiceUnitChangeListenerByName(
            in UnitNameParameters query, in IServiceUnitChangeListener listener);

    /**
     * Unregisters the IServiceUnitChangeListener by clearing all its registrations.
     * This method does does nothing if the listener is not registered, and can be called
     * multiple times safely.
     *
     * @param listener implementation of IServiceUnitChangeListener that was previously registered.
     */
    void unregisterServiceUnitChangeListener(in IServiceUnitChangeListener listener);

    /**
     * Registers the IServiceUnitChangeListener to monitor lifecycle events (registration,
     * unregistration, and change) for units matching unitType and channelName. If units with
     * the same unitType and channelName are already registered, the onServiceUnitRegistered
     * callback will be called immediately. Otherwise, no callback method will be called until a
     * unit is registered. An onServiceUnitUnregistered or onServiceUnitChanged callback will not be
     * called before an onServiceUnitRegistered callback is called for a given service unit.
     * Multiple callbacks can be registered for the same unitType and channelName even if called
     * from the same process.
     *
     * @param unitType type of service units to monitor.
     * @param channelName channel name of service units to monitor.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching the unitType and
     * channelName.
     */
    void registerServiceUnitChangeListenerByChannel(in UnitType unitType,
            @utf8InCpp String channelName, in IServiceUnitChangeListener listener);

    /**
     * Unregisters the IServiceUnitChangeListener for a unitType and channelName.
     * This method does nothing if the listener is not registered, and can be called
     * multiple times safely.
     *
     * @param unitType of monitored service units for which listener was previously registered.
     * @param channelName channel name of monitored service units for which listener was previously
     *         registered.
     * @param listener implementation of IServiceUnitChangeListener, responsible for informing the
     *         client about registered/unregistered/changed service units matching a unitType and
     * channelName.
     */
    void unregisterServiceUnitChangeListenerByChannel(in UnitType unitType,
            @utf8InCpp String channelName, in IServiceUnitChangeListener listener);

    /**
     * Discovers all service units registered with the specified Channel name.
     *
     * Returns a list of ServiceUnitDefinition objects one for each of the discovered unit,
     * or an empty list if nothing was found.
     */
    void fetchPublishersByChannelName(
            @utf8InCpp String channelName, in IServiceUnitFetchListener listener);

    /**
     * Discovers all active channel names accessible by the caller.
     *
     * An active channel is defined as a channel that has at least one publisher
     * currently registered to it.
     * The results are provided asynchronously via the listener.
     *
     * @param listener The callback interface to receive the list of channels or errors.
     */
    void listChannels(in IChannelFetchListener listener);

    /**
     * Discovers all active channel names accessible by the caller for a given unitType.
     *
     * An active channel is defined as a channel that has at least one publisher
     * currently registered to it for the given unitType.
     * The results are provided asynchronously via the listener.
     *
     * @param unitType The type of service units to filter channels by.
     * @param listener The callback interface to receive the list of channels or errors.
     */
    void listChannelsByType(in UnitType unitType, in IChannelFetchListener listener);
}
